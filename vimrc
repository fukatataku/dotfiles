"==============================================================================
" Release AutoGroup
"==============================================================================
augroup MyAutoCmd
    autocmd!
augroup END

"==============================================================================
" Encoding
"==============================================================================
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
scriptencoding utf-8

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
set ruler
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

"==============================================================================
" Key Mapping
"==============================================================================
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up> <C-w>-
nnoremap <S-Down> <C-w>+

"==============================================================================
" NeoBundle
"==============================================================================
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:

"==============================================================================
" vimproc
"==============================================================================
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'windows' : 'make -f make_mingw32.make',
        \ 'cygwin'  : 'make -f make_cygwin.mak',
        \ 'mac'     : 'make -f make_mac.mak',
        \ 'unix'    : 'make -f make_unix.mak',
    \ }}

"==============================================================================
" unite
"==============================================================================
NeoBundleLazy 'Shougo/unite.vim', {
    \ 'autoload': {
    \   'commands': ['Unite', 'UniteWithBufferDir']
    \ }}
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap [unite]f :<C-u>Unite<Space>file<CR>

"==============================================================================
" vimfiler
"==============================================================================
NeoBundleLazy 'Shougo/vimfiler', {
    \ 'depends': ['Shougo/unite.vim'],
    \ 'autoload': {
    \   'commands': ['VimFilerTab', 'VimFiler', 'VimFilerExplorer'],
    \   'mappings': ['<plug>(vimfiler_switch)'],
    \   'explorer': 1,
    \ }}
nnoremap <Space>f :VimFilerExplorer<CR>

"==============================================================================
" neocomplete
"==============================================================================
"if has('lua') && v:version >= 704
    "NeoBundleLazy 'Shougo/neocomplete.vim', {
        "\ 'autoload': {
        "\   'insert': 1,
        "\ }}
    "let g:neocomplete#enable_at_startup = 1
    "let s:hooks = neobundle#get_hooks('neocomplete.vim')
    "function! s:hooks.on_source(bundle)
        "let g:acp_enableAtStartup = 0
        "let g:neocomplete#enable_smart_case = 1
    "endfunction
"endif

"NeoBundle 'Shougo/neosnippet.vim'

"==============================================================================
" lightline
"==============================================================================
NeoBundle 'itchyny/lightline.vim'
let s:hooks = neobundle#get_hooks('lightline.vim')
function! s:hooks.on_source(bundle)
    set laststatus=2
    let g:lightline = {'colorscheme' : 'wombat',}
endfunction

"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'sjl/gundo.vim'
"NeoBundle 'vim-scripts/TaskList.vim'

"NeoBundle 'thinca/vim-quickrun'

" Python
"NeoBundle 'lambdalisue/vim-django-support'
"NeoBundle 'jmcantrell/vim-virtualenv'

"==============================================================================
" jedi
"==============================================================================
"NeoBundleLazy 'davidhalter/jedi-vim', {
    "\ "autoload": {
    "\   "filetypes": ["python", "python3", "djangohtml"],
    "\ },
    "\ "build": {
    "\   "cygwin": "pip install jedi",
    "\   "mac": "pip install jedi",
    "\   "unix": "pip install jedi",
    "\ }}
"let s:hooks = neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
  "let g:jedi#auto_vim_configuration = 0
  "let g:jedi#popup_select_first = 0
"endfunction

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

