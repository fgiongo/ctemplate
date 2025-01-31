#!/bin/bash

show_help () {
    cat << EOF
Usage: $1 <command> [OPTIONS] 

Commands: 
  help                  Show this help message
  version               Show version number
  new <name>            Initializes a new C project on working directory
  module                C module handling subcommand
EOF
}
