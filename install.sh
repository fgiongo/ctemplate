#!/bin/bash


uninstall () {
    rm -rf $config_path
    rm -f $install_path/ctemplate
}


install_path=${1:-"$HOME/.local/bin"}
config_path=${2:-"$HOME/.config/ctemplate"}

if [ "$(id -u)" -eq 0 ]; then
    echo "Do not run this script as root! Exiting"
    exit 1
fi

if [[ ! ":$PATH:" == *":$install_path:"* ]]; then
    echo -e "Warning! Install path $install_path is not in PATH!\nPlease include $install_path in PATH."
fi

echo -e "Install path: $install_path\nConfig path: $config_path"

mkdir -p $install_path || {
    echo "Could not create install path, exiting.";
    exit 1;
}

mkdir -p $config_path || {
    echo "Could not create config path, uninstalling.";
    uninstall;
    exit 1;
}

cp ctemplate ctemplate.copy
sed -i "1a\\\ninstall_path=\"$install_path\"\nconfig_path=\"$config_path\"" ctemplate.copy

cp ctemplate.copy $install_path/ctemplate || {
    echo "Could not copy executable to install path, uninstalling.";
    uninstall;
    exit 1;
}

rm -f ctemplate.copy

chmod 555 $install_path/ctemplate || {
    echo "Could not change permissions on binary, uninstalling.";
    uninstall;
    exit 1;
}

touch $config_path/ctpconf || {
    echo "Could not create config files, uninstalling.";
    uninstall;
    exit 1;
}

echo -e "install_path=\"$install_path\"\nconfig_path=\"$config_path\"" > $config_path/ctpconf

cp Makefile-elf $config_path/Makefile-elf 
cp Makefile-a $config_path/Makefile-a
cp Makefile-so $config_path/Makefile-so

