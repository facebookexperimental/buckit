load("@fbcode_macros//build_defs:rust_common.bzl", "rust_common")
load("@fbsource//tools/build_defs:fb_native_wrapper.bzl", "fb_native")

def rust_library(
        name,
        srcs = None,
        deps = None,
        external_deps = None,
        features = None,
        rustc_flags = None,
        crate = None,
        crate_root = None,
        unittests = True,
        tests = None,
        test_deps = None,
        test_external_deps = None,
        test_srcs = None,
        test_features = None,
        test_rustc_flags = None,
        test_link_style = None,
        preferred_linkage = None,
        proc_macro = False):
    attrs = rust_common.convert_rust(
        name,
        "rust_library",
        srcs = srcs,
        deps = deps,
        external_deps = external_deps,
        features = features,
        rustc_flags = rustc_flags,
        crate = crate,
        crate_root = crate_root,
        unittests = unittests,
        tests = tests,
        test_deps = test_deps,
        test_external_deps = test_external_deps,
        test_srcs = test_srcs,
        test_features = test_features,
        test_rustc_flags = test_rustc_flags,
        test_link_style = test_link_style,
        preferred_linkage = preferred_linkage,
        proc_macro = proc_macro,
    )
    fb_native.rust_library(**attrs)