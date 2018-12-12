# Copyright 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

from __future__ import absolute_import, division, print_function, unicode_literals

import tests.utils
from tests.utils import dedent


class LuaBinaryTest(tests.utils.TestCase):
    includes = [("@fbcode_macros//build_defs:lua_binary.bzl", "lua_binary")]

    @tests.utils.with_project()
    def test_lua_binary_parses(self, root):
        root.addFile(
            "BUCK",
            dedent(
                """
            load("@fbcode_macros//build_defs:lua_binary.bzl", "lua_binary")
            lua_binary(
                name = "foo",
                srcs = ["main.lua"],
                main_module = "main",
                deps = [
                    ":dep",
                ],
            )
            """
            ),
        )

        self.assertSuccess(root.runAudit(["BUCK"]))