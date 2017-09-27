#!/bin/sh

set -e

# Require Vim with Lua

sudo pip install flake8
cp -R vim/* ~/.vim_runtime/
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp -R oh-my-zsh/* ~/.oh-my-zsh/
source ~/.oh-my-zsh/.zshrc
cp flake8 ~/.config/flake8

