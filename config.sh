#!/bin/sh

set -e

# Require Vim with Lua
mv ~/.zshrc ~/.zshrc.backup

sudo pip install flake8
sudo mkdir -p ~/.vim_runtime
sudo mkdir -p ~/.oh-my-zsh
sudo mkdir -p ~/.config
cp -R vim/* ~/.vim_runtime/
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp -R oh-my-zsh/* ~/.oh-my-zsh/
chsh -s /bin/zsh
cp oh-my-zsh/.zshrc ~/
cp flake8 ~/.config/flake8
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
