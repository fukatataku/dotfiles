#!/bin/sh
# -*- encoding:utf-8 -*-

#HERE=$(readlink -f $(dirname $0))
HERE=$(cd $(dirname $0);pwd)

mkdir -p ~/.vim
mkdir -p ~/.emacs.d

ln -sf $HERE/vimrc ~/.vim/vimrc
ln -sf $HERE/bash_profile ~/.bash_profile
ln -sf $HERE/init.el ~/.emacs.d/init.el

