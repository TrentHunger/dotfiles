#!/bin/bash

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

if [[ "$OSTYPE" == "darwin"* ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install tmux
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    pkg install tmux
fi

cp $BASEDIR/{.gitconfig,.tmux.conf,.vimrc} ~/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

