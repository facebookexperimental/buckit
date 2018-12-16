load("@fbcode_macros//build_defs/lib:python_common.bzl", "python_common")
load("@fbcode_macros//build_defs/lib:visibility.bzl", "get_visibility")
load("@fbsource//tools/build_defs:fb_native_wrapper.bzl", "fb_native")

def python_binary(
        name,
        py_version = None,
        py_flavor = "",
        base_module = None,
        main_module = None,
        strip_libpar = True,
        srcs = (),
        versioned_srcs = (),
        tags = (),
        gen_srcs = (),
        deps = (),
        tests = (),
        par_style = None,
        external_deps = (),
        argcomplete = None,
        strict_tabs = None,
        compile = None,
        python = None,  # PAR argument
        allocator = None,
        check_types = False,
        preload_deps = (),
        visibility = None,
        resources = (),
        jemalloc_conf = None,
        typing = False,
        typing_options = "",
        check_types_options = "",
        runtime_deps = (),
        cpp_deps = (),  # ctypes targets
        helper_deps = False,
        analyze_imports = False,
        additional_coverage_targets = (),
        version_subdirs = None):
    visibility = get_visibility(visibility, name)

    all_attributes = python_common.convert_binary(
        is_test = False,
        fbconfig_rule_type = "python_binary",
        buck_rule_type = "python_binary",
        base_path = native.package_name(),
        name = name,
        py_version = py_version,
        py_flavor = py_flavor,
        base_module = base_module,
        main_module = main_module,
        strip_libpar = strip_libpar,
        srcs = srcs,
        versioned_srcs = versioned_srcs,
        tags = tags,
        gen_srcs = gen_srcs,
        deps = deps,
        tests = tests,
        par_style = par_style,
        emails = None,
        external_deps = external_deps,
        needed_coverage = None,
        argcomplete = argcomplete,
        strict_tabs = strict_tabs,
        compile = compile,
        args = None,
        env = None,
        python = python,
        allocator = allocator,
        check_types = check_types,
        preload_deps = preload_deps,
        visibility = visibility,
        resources = resources,
        jemalloc_conf = jemalloc_conf,
        typing = typing,
        typing_options = typing_options,
        check_types_options = check_types_options,
        runtime_deps = runtime_deps,
        cpp_deps = cpp_deps,
        helper_deps = helper_deps,
        analyze_imports = analyze_imports,
        additional_coverage_targets = additional_coverage_targets,
        version_subdirs = version_subdirs,
    )

    for attributes in all_attributes:
        fb_native.python_binary(**attributes)