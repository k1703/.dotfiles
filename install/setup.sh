#!/bin/bash

dotfiles=".dotfiles"
link_files_dir="link"
copy_files_dir="copy"
install_file_dir="install"

for config_file in ~/$dotfiles/$link_files_dir/.[a-zA-Z0-9]*;do
    ln -s $config_file ~/$(basename $config_file)
    if [ "$?" = "0" ]; then
        printf "Installing from $config_file SUCCESS!"
    else
        printf "Installing from $config_file FAILURE!"
    fi
done

for config_file in ~/$dotfiles/$copy_files_dir/.[a-zA-Z0-9]*;do
    cp -nr $config_file ~/$(basename $config_file)
    if [ "$?" = "0" ]; then
        printf "Installing from $config_file SUCCESS!"
    else
        printf "Installing from $config_file FAILURE!"
    fi
done

for config_file in ~/$dotfiles/$install_files_dir/.[a-zA-Z0-9]*;do
    source $config_file
    if [ "$?" = "0" ]; then
        printf "Installing from $config_file SUCCESS!"
    else
        printf "Installing from $config_file FAILURE!"
    fi
done

mkdir -p caches/vim
