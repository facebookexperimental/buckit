# Copyright 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

BUCK_RULES = [
    "android_aar",
    "android_app_modularity",
    "android_binary",
    "android_build_config",
    "android_bundle",
    "android_instrumentation_apk",
    "android_instrumentation_test",
    "android_library",
    "android_manifest",
    "android_platform",
    "android_prebuilt_aar",
    "android_resource",
    "apk_genrule",
    "apple_asset_catalog",
    "apple_binary",
    "apple_bundle",
    "apple_library",
    "apple_package",
    "apple_resource",
    "apple_test",
    "apple_toolchain",
    "apple_toolchain_set",
    "cgo_library",
    "command_alias",
    "config_setting",
    "constraint_setting",
    "constraint_value",
    "core_data_model",
    "csharp_library",
    "cxx_binary",
    "cxx_genrule",
    "cxx_library",
    "cxx_lua_extension",
    "cxx_precompiled_header",
    "cxx_python_extension",
    "cxx_test",
    "cxx_toolchain",
    "d_binary",
    "d_library",
    "d_test",
    "export_file",
    "external_test_runner",
    "filegroup",
    "gen_aidl",
    "genrule",
    "go_binary",
    "go_library",
    "cgo_library",
    "prebuilt_go_library",
    "go_test",
    "go_test_runner",
    "groovy_library",
    "groovy_test",
    "gwt_binary",
    "halide_library",
    "haskell_binary",
    "haskell_ghci",
    "haskell_haddock",
    "haskell_library",
    "haskell_prebuilt_library",
    "http_archive",
    "http_file",
    "jar_genrule",
    "java_annotation_processor",
    "java_binary",
    "java_library",
    "java_plugin",
    "java_test",
    "java_test_runner",
    "js_bundle",
    "js_bundle_genrule",
    "js_library",
    "keystore",
    "kotlin_library",
    "kotlin_test",
    "legacy_toolchain",
    "lua_binary",
    "lua_library",
    "ndk_library",
    "ndk_toolchain",
    "ocaml_binary",
    "ocaml_library",
    "platform",
    "prebuilt_apple_framework",
    "prebuilt_cxx_library",
    "prebuilt_cxx_library_group",
    "prebuilt_dotnet_library",
    "prebuilt_jar",
    "prebuilt_native_library",
    "prebuilt_ocaml_library",
    "prebuilt_python_library",
    "project_config",
    "python_binary",
    "python_library",
    "python_test",
    "python_test_runner",
    "remote_file",
    "robolectric_test",
    "rust_binary",
    "rust_library",
    "rust_test",
    "prebuilt_rust_library",
    "scala_library",
    "scala_test",
    "scene_kit_assets",
    "sh_binary",
    "sh_test",
    "supermodule_target_graph",
    "swift_library",
    "swift_toolchain",
    "test_suite",
    "thrift_library",
    "versioned_alias",
    "worker_tool",
    "xcode_postbuild_script",
    "xcode_prebuild_script",
    "xcode_workspace_config",
    "zip_file",
]

FBCODE_RULES = [
    "antlr3_srcs",
    "antlr4_srcs",
    "cpp_benchmark",
    "cpp_binary",
    "cpp_binary_external",
    "cpp_java_extension",
    "cpp_library",
    "cpp_library_external",
    "cpp_library_external_custom",
    "cpp_lua_extension",
    "cpp_lua_main_module",
    "cpp_module_external",
    "cpp_node_extension",
    "cpp_precompiled_header",
    "cpp_python_extension",
    "cpp_java_extension",
    "cpp_jvm_library",
    "cpp_unittest",
    "custom_rule",
    "custom_unittest",
    "cxx_genrule",
    "cython_library",
    "d_binary",
    "d_library",
    "d_library_external",
    "dewey_artifact",
    "export_file",
    "gen_thrift",
    "go_binary",
    "go_library",
    "cgo_library",
    "go_bindgen_library",
    "go_external_library",
    "go_unittest",
    "haskell_binary",
    "haskell_external_library",
    "haskell_ghci",
    "haskell_haddock",
    "haskell_library",
    "haskell_unittest",
    "java_binary",
    "java_library",
    "java_test",
    "java_shaded_jar",
    "js_executable",
    "js_library",
    "js_node_module_external",
    "js_npm_module",
    "lua_binary",
    "lua_library",
    "lua_unittest",
    "ocaml_binary",
    "ocaml_external_library",
    "ocaml_library",
    "python_binary",
    "python_config",
    "python_library",
    "python_multi_configs",
    "python_testslide",
    "python_unittest",
    "python_validator",
    "python_pytest",
    "python_logger",
    "remote_file",
    "rust_binary",
    "rust_library",
    "rust_unittest",
    "rust_bindgen_library",
    "rust_external_library",
    "scala_library",
    "scala_test",
    "smart_service_cxx",
    "smart_service_py",
    "smart_service_rust",
    "sphinx_wiki",
    "sphinx_manpage",
    "swig_library",
    "thrift_library",
    "versioned_alias",
    "prebuilt_jar",
    "python_wheel",
    "python_wheel_default",
    "flow_unittest",
    "flow_workflow_unittest",
    "fblearner_flow_util_python_library",
    "cogwheel_lite_test",
    "cogwheel_test",
    "cpp_lionhead_harness",
    "missing_tp2_project",
    "dper3_library",
    "dper3_unittest",
    "f6_pipeline_library",
]

# Maps from generic buck rules to fbcode-specific versions.
BUCK_TO_FBCODE_MAP = {
    "cxx_binary": "cpp_binary",
    "cxx_library": "cpp_library",
    "filegroup": "buck_filegroup",
    "python_test": "python_unittest",
}
