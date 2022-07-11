#!/bin/sh

set -e

# sudo apt-get install zsh

mkdir -p ~/.oh-my-zsh
mkdir -p ~/.config
cp -R oh-my-zsh/* ~/.oh-my-zsh/
cp oh-my-zsh/.zshrc ~/
cp bash_profile ~/.bash_profile

git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

echo "====================="
echo "4. Success!"
