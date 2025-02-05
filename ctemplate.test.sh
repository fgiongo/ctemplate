#!/bin/bash


setup_tests () {

    ctemplate_files=(ctemplate install.sh Makefile-{elf,a,so})

    if command -v ctemplate; then
        ctemplate uninstall
    fi

    if ls "${ctemplate_files[@]}" >/dev/null 2>&1; then
        bash install.sh

    else
        echo "ctemplate test setup: could not find necessary setup files" 
        exit 1
    fi

    if ! command -v git >/dev/null 2>&1; then
        echo "ctemplate test setup: git must be installed to run tests"
        exit 1
    fi
}

run_tests () {

    exit 0
}


executable_create () {

    # TODO(nando): implement
    return 0
}


static_lib_create () {

    # TODO(nando): implement
    return 0
}


dynamic_lib_create () {

    # TODO(nando): implement
    return 0
}

setup_tests
run_tests
