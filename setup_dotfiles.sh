#!/bin/sh
# -*- encoding:utf-8 -*-

HERE=$(readlink -f $(dirname $0))

mkdir -p ~/.vim

ln -sf $HERE/vimrc ~/.vim/vimrc
ln -sf $HERE/bash_profile ~/.bash_profile

