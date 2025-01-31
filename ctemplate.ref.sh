#!/bin/bash

ctemplate_version="1.0.0"

ctemplate_show_help () {

    cat << EOF
Usage: $0 [-h] [--help] [-v] [--version] <command> [OPTION]...

Commands: 
  help                  Show this help message
  version               Show version number
  new <name>            Initializes a new C project on working directory
  module                C module handling subcommand
  uninstall             Uninstall ctemplate

Options:
  --no-git              Don't initialize new git repository
EOF
exit 0
}


ctemplate_show_version () {

    echo "ctemplate version $ctemplate_version"
    exit 0
}


ctemplate_new () {

    if [[ -z $2 ]]; then
        echo "Usage: $0 $1 [-h] [--help] [help] [OPTION] <project-name>"
        exit 1
    fi

    name=""
    git=1

    while [[ $# -ge 2 ]]; do

        if [[ ${!#} == "--no-git" ]]; then
            git=1

        elif [[ ${!#} =~ ^[[:alpha:]]([[:alnum:]]*_*-*.*)*([[:alnum:]])+ ]]; then
            echo "match!"
            name=$0

        else
            echo "$0 $1: invalid argument ${!#}"
            exit 1
        fi

        shift
    done

        if [[ -z $name ]]; then
            echo "$0 $1: missing <project-name> argument"
            exit 1
        fi

    exit 0
}


ctemplate_new_show_help () {
    cat << EOF
Usage: $0 $1 [-h] [--help] [help] [OPTION]... <project-name>

Arguments:
  project-name          Project name - do not use whitespace or special
                        characters!

Options:
  --no-git              Don't initialize new git repository
EOF
    exit 0
}


ctemplate_module () {
    exit 0
}


ctemplate_uninstall () {

    rm -f $install_path/ctemplate
    rm -rf $config_path
}

case $1 in

    "help" | "-h" | "--help")
        ctemplate_show_help
        ;;

    "version" | "-v" | "--version")
        ctemplate_show_version
        ;;

    "new")
        ctemplate_new "$@"
        ;;

    "module")
        ctemplate_module "$@"
        ;;

    "uninstall")
        ctemplate_uninstall
        exit 0
        ;;

    *)
        echo "Usage: $0 [-h] [--help] [-v] [--version] <command> [OPTION]..."
        exit 1
        ;;

esac
