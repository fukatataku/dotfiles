#!/bin/sh
# -*- encoding:utf-8 -*-

#HERE=$(readlink -f $(dirname $0))
HERE=$(cd $(dirname $0);pwd)

mkdir -p ~/.vim/bundle
mkdir -p ~/.emacs.d

ln -sf $HERE/vimrc ~/.vim/vimrc
ln -sf $HERE/bash_profile ~/.bash_profile
ln -sf $HERE/init.el ~/.emacs.d/init.el
ln -sf $HERE/inputrc ~/.inputrc

if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
