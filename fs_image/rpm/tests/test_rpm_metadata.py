#!/usr/bin/env python3
import os
import shutil
import unittest

from .temp_repos import temp_repos_steps, Repo, Rpm
from ..common import temp_dir
from ..rpm_metadata import compare_rpm_versions, RpmMetadata
from find_built_subvol import find_built_subvol


class RpmMetadataTestCase(unittest.TestCase):
    def test_rpm_metadata_from_subvol(self):
        layer_path = os.path.join(os.path.dirname(__file__), 'child-layer')
        child_subvol = find_built_subvol(layer_path)

        a = RpmMetadata.from_subvol(child_subvol, 'rpm-test-mice')
        self.assertEqual(a.name, 'rpm-test-mice')
        self.assertEqual(a.epoch, 0)
        self.assertEqual(a.version, '0.1')
        self.assertEqual(a.release, 'a')

        # not installed
        with self.assertRaisesRegex(RuntimeError, '^Could not query RPM info'):
            a = RpmMetadata.from_subvol(child_subvol, 'rpm-test-carrot')

        # subvol with no RPM DB
        layer_path = os.path.join(os.path.dirname(__file__), 'hello-layer')
        hello_subvol = find_built_subvol(layer_path)
        with self.assertRaisesRegex(ValueError, ' does not exist$'):
            a = RpmMetadata.from_subvol(hello_subvol, 'rpm-test-mice')

    def test_rpm_metadata_from_file(self):
        with temp_repos_steps(repo_change_steps=[{
            'repo': Repo([Rpm('sheep', '0.3.5.beta', 'l33t.deadbeef.777')]),
        }]) as repos_root, temp_dir() as td:
            src_rpm_path = repos_root / ('0/repo/repo-pkgs/' +
                'rpm-test-sheep-0.3.5.beta-l33t.deadbeef.777.x86_64.rpm')
            dst_rpm_path = td / 'arbitrary_unused_name.rpm'
            shutil.copy(src_rpm_path, dst_rpm_path)
            a = RpmMetadata.from_file(dst_rpm_path)
            self.assertEqual(a.name, 'rpm-test-sheep')
            self.assertEqual(a.epoch, 0)
            self.assertEqual(a.version, '0.3.5.beta')
            self.assertEqual(a.release, 'l33t.deadbeef.777')

        # non-existent file
        with self.assertRaisesRegex(RuntimeError, '^Error querying RPM info'):
            a = RpmMetadata.from_file(b'idontexist.rpm')

        # missing extension
        with self.assertRaisesRegex(ValueError, ' needs to end with .rpm$'):
            a = RpmMetadata.from_file(b'idontendwithdotrpm')

    def test_rpm_query_arg_check(self):
        with self.assertRaisesRegex(ValueError, '^Must pass only '):
            RpmMetadata._repo_query(RpmMetadata, b"dbpath", None, b"path")

    def test_rpm_compare_versions(self):
        # name mismatch
        a = RpmMetadata('test-name1', 1, '2', '3')
        b = RpmMetadata('test-name2', 1, '2', '3')
        with self.assertRaises(ValueError):
            compare_rpm_versions(a, b)

        # Taste data was generated with:
        # rpmdev-vercmp <epoch1> <ver1> <release1> <epoch2> <ver2> <release2>
        # which also uses the same Python rpm lib.
        #
        # This number of test cases is excessive but does show how interesting
        # RPM version comparisons can be.
        test_data = [
            # Non-alphanumeric (except ~) are ignored for equality
            ((1, '2', '3'), (1, '2', '3'), 0),      # 1:2-3 == 1:2-3
            ((1, ':2>', '3'), (1, '-2-', '3'), 0),  # 1::2>-3 == 1:-2--3
            ((1, '2', '3?'), (1, '2', '?3'), 0),    # 1:2-?3 == 1:2-3?
            # epoch takes precedence no matter what
            ((0, '2', '3'), (1, '2', '3'), -1),  # 0:2-3 < 1:2-3
            ((1, '1', '3'), (0, '2', '3'), 1),   # 1:1-3 > 0:2-3
            # version and release trigger the real comparison rules
            ((0, '1', '3'), (0, '2', '3'), -1),        # 0:1-3 < 0:2-3
            ((0, '~2', '3'), (0, '1', '3'), -1),       # 0:~2-3 < 0:1-3
            ((0, '~', '3'), (0, '1', '3'), -1),        # 0:~-3 < 0:1-3
            ((0, '1', '3'), (0, '~', '3'), 1),         # 0:1-3 > 0:~-3
            ((0, '^1', '3'), (0, '^', '3'), 1),        # 0:^1-3 > 0:^-3
            ((0, '^', '3'), (0, '^1', '3'), -1),       # 0:^-3 < 0:^1-3
            ((0, '0333', 'b'), (0, '0033', 'b'), 1),   # 0:0333-b > 0:0033-b
            ((0, '3', '~~'), (0, '3', '~~~'), 1),      # 0:3-~~ > 0:3-~~~
            ((0, 'a2aa', 'b'), (0, 'a2a', 'b'), 1),    # 0:a2aa-b > 0:a2a-b
            ((0, '33', 'b'), (0, 'aaa', 'b'), 1),      # 0:33-b > 0:aaa-b
        ]

        for evr1, evr2, expected in test_data:
            a = RpmMetadata('test-name', *evr1)
            b = RpmMetadata('test-name', *evr2)
            self.assertEqual(compare_rpm_versions(a, b), expected)