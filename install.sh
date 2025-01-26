#!/bin/bash

cp ctemplate /usr/local/bin
chmod 555 /usr/local/bin/ctemplate
mkdir -p $HOME/Templates/ctemplate
cp Makefile-elf $HOME/Templates/ctemplate/Makefile-elf 
cp Makefile-a $HOME/Templates/ctemplate/Makefile-a
cp Makefile-so $HOME/Templates/ctemplate/Makefile-so

