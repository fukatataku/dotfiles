#!/bin/bash
# -*- encoding:utf-8 -*-

#HERE=$(readlink -f $(dirname $0))
HERE=$(cd $(dirname $0);pwd)

case `uname` in
	windows*)
		echo "Windows"
		VIM_DIR=~/vimfiles
		;;
	CYGWIN*)
		echo "Cygwin"
		VIM_DIR=~/.vim
		;;
	MINGW*)
		echo "MinGW"
		VIM_DIR=~/vimfiles
		;;
	Linux*)
		echo "Linux"
		VIM_DIR=~/.vim
		;;
	Darwin*)
		echo "Mac"
		VIM_DIR=~/.vim
		;;
	*)
		echo "unknown"
		VIM_DIR=~/.vim
		;;
esac

mkdir -p $VIM_DIR/bundle
mkdir -p ~/.emacs.d

ln -sf $HERE/vimrc $VIM_DIR/vimrc
ln -sf $HERE/gvimrc $VIM_DIR/gvimrc
ln -sf $HERE/bash_profile ~/.bashrc
ln -sf $HERE/init.el ~/.emacs.d/init.el
ln -sf $HERE/inputrc ~/.inputrc

if [ ! -e $VIM_DIR/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim $VIM_DIR/bundle/neobundle.vim
fi

# Vim設定の補足
# neocomplete.vimを有効にするにはシステムが以下の条件を満たしている必要がある
# ・luaがインストールされている
#   $ yum install lua
#   $ brew install lua
#   $ apt-cyg install lua
# ・vimのバージョンが7.3.885以上
# ・vimがlua対応をしている

