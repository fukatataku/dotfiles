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

# Vim設定の補足
# neocomplete.vimを有効にするにはシステムが以下の条件を満たしている必要がある
# ・luaがインストールされている
#   $ yum install lua
#   $ brew install lua
#   $ apt-cyg install lua
# ・vimのバージョンが7.3.885以上
# ・vimがlua対応をしている

