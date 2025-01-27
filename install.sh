#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    echo "You are running this script as root! (not recommended)"
    read -p "Continue? (Y/N): " confirm
    [[ $confirm == [yY] ]] || exit 1
fi

install_path=${1:-"$HOME/.local/bin"}
config_path=${2:-"$HOME/.config/ctemplate"}

if [[ ! ":$PATH:" == *":$install_path:"* ]]; then
    echo "Warning! Install path $install_path is not in PATH!"
    read -p "Continue? (Y/N): " confirm
    [[ $confirm == [yY] ]] || exit 1
fi

echo -e "Install path: $install_path\nConfig path: $config_path"

mkdir -p $install_path || {
    echo "Could not create install path, exiting.";
    exit 1;
}

mkdir -p $config_path || {
    echo "Could not create config path, exiting.";
    uninstall();
    exit 1;
}

cp ctemplate $install_path || {
    echo "Could not copy executable to install path, exiting.";
    uninstall();
    exit 1;
}

chmod 555 $install_path/ctemplate || {
    echo "Could not change permissions on binary, exiting.";
    uninstall();
    exit 1;
}
cp Makefile-elf $config_path/Makefile-elf || {
    echo "Could not copy config files, exiting.";
    uninstall();
    exit 1;
}
cp Makefile-a $config_path/Makefile-a
cp Makefile-so $config_path/Makefile-so

uninstall () {
    rm -rf $config_path;
    rm -f $install_path/ctemplate;
}
