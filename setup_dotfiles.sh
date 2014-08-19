#!/bin/bash
# -*- encoding:utf-8 -*-

#HERE=$(readlink -f $(dirname $0))
HERE=$(cd $(dirname $0);pwd)

if [ `uname` = "MINGW32_NT-6.1" ]; then
  # Windows
  VIM_DIR = ~/vimfiles
else
  # Windows以外
  VIM_DIR = ~/.vim
fi

mkdir -p ~/.vim/bundle
mkdir -p ~/.emacs.d

ln -sf $HERE/vimrc ~/$VIM_DIR/vimrc
ln -sf $HERE/bash_profile ~/.bashrc
ln -sf $HERE/init.el ~/.emacs.d/init.el
ln -sf $HERE/inputrc ~/.inputrc

if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# Vim設定の補足
# neocomplete.vimを有効にするにはシステムが以下の条件を満たしている必要がある
# ・luaがインストールされている
#   $ yum install lua
#   $ brew install lua
#   $ apt-cyg install lua
# ・vimのバージョンが7.3.885以上
# ・vimがlua対応をしている

