"==========
" Encoding
"==========
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
scriptencoding utf-8

"======
" Font
"======
if has('win32')
    echo 'Windows'
elseif has('win32unix')
    echo 'Cygwin'
elseif has('mac')
    echo 'Mac'
endif

" Cursor position
set ruler

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Edit
set virtualedit=all
set backspace=indent,eol,start
set wildmenu wildmode=list:full
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Auto file
set nowritebackup
set nobackup
set noswapfile

" Display
set list
set listchars=tab:»\ ,eol:↲
set number 
set colorcolumn=80
set t_vb=
set novisualbell

" Highlight
syntax on
set background=dark
set showmatch
set matchpairs& matchpairs+=<:>

" Macro
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

"===========
" NeoBundle
"===========
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'windows' : 'make -f make_mingw32.make',
        \ 'cygwin'  : 'make -f make_cygwin.mak',
        \ 'mac'     : 'make -f make_mac.mak',
        \ 'unix'    : 'make -f make_unix.mak',
    \ }}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" For lightline.vim
set laststatus=2
let g:lightline = {'colorscheme' : 'wombat',}

