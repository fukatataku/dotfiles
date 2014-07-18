" Encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
scriptencoding utf-8

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

" Auto file
set nowritebackup
set nobackup
set noswapfile

" Display
set list
set listchars=tab:>\ ,eol:$  
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

"===========
" NeoBundle
"===========
if has('vim_starting')
  set nocompatible               " Be iMproved

   " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

 " Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" For lightline.vim
set laststatus=2
let g:lightline = {'colorscheme' : 'wombat',}

