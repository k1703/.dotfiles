#!/bin/bash

dotfiles=".dotfiles"
link_files_dir="link"
copy_files_dir="copy"
install_files_dir="install"

for config_file in $HOME/$dotfiles/$link_files_dir/.[a-zA-Z0-9]*;do
    tofile="$HOME/$(basename $config_file)"
    
    # Check that we're not overwriting existing config
    if [ -a $tofile ];then
	mv $tofile $tofile.bkp
	printf "Made a backup of existing $config_file to $tofile.bkp\n"
    fi

    # Link configs
    ln -s $config_file $tofile
    if [ "$?" = "0" ]; then
        printf "Linking from $config_file SUCCESS!\n"
    else
        printf "Linking from $config_file FAILURE!\n"
    fi
done

for config_file in $HOME/$dotfiles/$copy_files_dir/.[a-zA-Z0-9]*;do
    tofile="$HOME/$(basename $config_file)"
    
    # Check that we're not overwriting existing config
    if [ -a $tofile ];then
	mv $tofile $tofile.bkp
	printf "Made a backup of existing $config_file to $tofile.bkp\n"
    fi

    # Copy configs
    cp -nr $config_file $tofile
    cp -i $tofile.bkp/* $tofile
    if [ "$?" = "0" ]; then
        printf "Copying from $config_file SUCCESS!\n"
    else
        printf "Copying from $config_file FAILURE!\n"
    fi
done

chmod u+x $HOME/$dotfiles/$install_files_dir/*
for config_file in $HOME/$dotfiles/$install_files_dir/[a-zA-Z0-9]*;do
    source $config_file
    if [ "$?" = "0" ]; then
        printf "Installing from $config_file SUCCESS!\n"
    else
        printf "Installing from $config_file FAILURE!\n"
    fi
done

mkdir -p caches/vim
