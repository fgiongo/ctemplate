#!/bin/bash

ctemplate_version="1.0.0"

ctemplate_show_help () {
    cat << EOF
Usage: $1 [-h] [--help] [-v] [--version] <command> [options] 

Commands: 
  help                  Show this help message
  version               Show version number
  new <name>            Initializes a new C project on working directory
  module                C module handling subcommand

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
    exit 0
}


ctemplate_module () {
    exit 0
}

case $1 in

    "help" | "-h" | "--help")
        ctemplate_show_help
        ;;

    "version" | "-v" | "--version")
        ctemplate_show_version
        ;;

    "new")
        shift
        ctemplate_new "$@"
        ;;

    "module")
        shift
        ctemplate_module "$@"
        ;;

    *)
        echo "Usage: $1 [-h] [--help] [-v] [--version] <command> [options]"
        exit 1
        ;;

esac
