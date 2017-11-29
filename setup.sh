#!/bin/bash

dotfiles=".dotfiles"
link_files_dir="link"
copy_files_dir="copy"

sudo apt update
sudo apt install -y git curl

for config_file in ~/$dotfiles/$link_files_dir/.[a-zA-Z0-9]*;do
        ln -s $config_file ~/$(basename $config_file)
        echo "$config_file $?"
done

for config_file in ~/$dotfiles/$copy_files_dir/.[a-zA-Z0-9]*;do
        cp -nr $config_file ~/$(basename $config_file)
done

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir caches/vim
