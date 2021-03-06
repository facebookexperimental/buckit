# Copyright 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

# A simple definitions file that lets us bootstrap the
# macros library.

load(":macros.bzl", "get_converted_rules")

load_symbols(get_converted_rules())

load(
    "@fbcode_macros//build_defs:export_files.bzl",
    "buck_export_file",
    "export_file",
    "export_files",
)
load("@fbcode_macros//build_defs:custom_unittest.bzl", "custom_unittest")
load("@fbcode_macros//build_defs:dewey_artifact.bzl", "dewey_artifact")
load("@fbcode_macros//build_defs:java_binary.bzl", "java_binary")
load("@fbcode_macros//build_defs:java_library.bzl", "java_library")
load("@fbcode_macros//build_defs:java_shaded_jar.bzl", "java_shaded_jar")
load("@fbcode_macros//build_defs:java_test.bzl", "java_test")
load(
    "@fbcode_macros//build_defs:native_rules.bzl",
    "buck_command_alias",
    "buck_filegroup",
    "buck_genrule",
    "buck_python_library",
    "buck_sh_binary",
    "buck_sh_test",
    "buck_zip_file",
    "cxx_genrule",
    "remote_file",
    "test_suite",
    "versioned_alias",
)
load("@fbcode_macros//build_defs:scala_library.bzl", "scala_library")
load("@fbcode_macros//build_defs:thrift_library.bzl", "thrift_library")
