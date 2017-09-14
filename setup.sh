#!/usr/bin/env bash

nameOut="$(uname -s)"
if [ "${nameOut}" == "Darwin" ]; then
    echo Mac Os
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install vim
fi

cp vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
