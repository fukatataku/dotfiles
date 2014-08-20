" Vimの基本設定 GUI用の設定はgvimrc

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
"set virtualedit=all
set backspace=indent,eol,start
set wildmenu wildmode=list:full
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set completeopt=menuone
set autoindent

" Auto file
set nowritebackup
set nobackup
set noswapfile

" Display
set ruler
"set list
"set listchars=tab:≫\ ,eol:↵
set number 
"set wrap
if v:version >= 703
    set colorcolumn=80
    autocmd MyAutoCmd ColorScheme * hi ColorColumn guibg=Red ctermbg=7
endif
set t_vb=
set novisualbell
set cursorline
set cursorcolumn
hi clear CursorLine
hi clear CursorColumn
highlight CursorLine ctermbg=8
highlight CursorColumn ctermbg=8
"colorscheme evening

" Highlight
syntax on
set background=dark
set showmatch
set matchpairs& matchpairs+=<:>

" Printer
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h12:cSHIFTJIS
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

" other
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tagsファイルの重複防止
  set tags=./tags,tags
endif

"==============================================================================
" Key Mapping
"==============================================================================
inoremap <C-@> <Esc>
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
  let OSTYPE = system('uname')
  if OSTYPE == "windows32\n"
    let VIM_DIR = "~/vimfiles"
    set runtimepath+=~/vimfiles/bundle/neobundle.vim
  else
    let VIM_DIR = "~/.vim"
    set runtimepath+=~/.vim/bundle/neobundle.vim
  endif
endif

call neobundle#begin(expand(VIM_DIR . "/bundle/"))
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
nnoremap [unite]f :<C-u>UniteWithBufferDir<Space>-buffer-name=files file<CR>
nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap [unite]r :<C-u>Unite<Space>register<CR>
nnoremap [unite]c :<C-u>Unite<Space>bookmark<CR>
nnoremap [unite]t :<C-u>Unite<Space>tab<CR>
nnoremap [unite]w :<C-u>Unite<Space>window<CR>
nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>
let s:hooks = neobundle#get_hooks('unite.vim')
function! s:hooks.on_source(bundle)
    "let g:unite_source_bookmark_directory = '~/.unite/bookmark'
    "let g:unite_enable_start_insert = 1
    call unite#custom_default_action("source/bookmark/directory", "vimfiler")
    call unite#custom_default_action("directory", "vimfiler")
    call unite#custom_default_action("directory_mru", "vimfiler")
    NeoBundle 'Shougo/neomru.vim'
endfunction

"==============================================================================
" neomru
"==============================================================================
"NeoBundleLazy 'Shougo/neomru.vim', {
    "\ 'depends': ['Shougo/unite.vim'],
    "\ 'autoload': {
    "\   'commands': ['Unite', 'UniteWithBufferDir']
    "\ }}

"==============================================================================
" vimfiler
"==============================================================================
NeoBundleLazy 'Shougo/vimfiler', {
    \ 'depends': ['Shougo/unite.vim'],
    \ 'autoload': {
    \   'commands': ['VimFiler', 'VimFilerExplorer', 'VimFilerDouble'],
    \   'mappings': ['<plug>(vimfiler_switch)'],
    \   'explorer': 1
    \ }}
"nnoremap <Space>f :VimFilerExplorer<CR>
nnoremap <Space>f :VimFiler<CR>
nnoremap <Space>d :VimFilerDouble<CR>

"==============================================================================
" neocomplete/neocomplcache
"==============================================================================
if has('lua') && v:version >= 704
    NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'autoload': {
        \   'insert': 1,
        \ }}
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks('neocomplete.vim')
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_smart_case = 1
        "let g:neocomplete#force_omni_input_patterns = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endfunction
else
    NeoBundleLazy 'Shougo/neocomplcache', {
        \ 'autoload': {
        \   'insert': 1,
        \ }}
    let g:neocomplcache_enable_at_startup = 1
    let s:hooks = neobundle#get_hooks('neocomplcache')
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_smart_case = 1
    endfunction
endif

"==============================================================================
" neosnippet
"==============================================================================
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"==============================================================================
" ColorScheme
"==============================================================================
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'wOng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

"==============================================================================
" lightline
"==============================================================================
NeoBundle 'itchyny/lightline.vim'
let s:hooks = neobundle#get_hooks('lightline.vim')
function! s:hooks.on_source(bundle)
    set laststatus=2
    let g:lightline = {'colorscheme' : 'wombat',}
endfunction

"==============================================================================
" indent-guides
"==============================================================================
"NeoBundle 'nathanaelkane/vim-indent-guides'
"let s:hooks = neobundle#get_hooks("vim-indent-guides")
"function! s:hooks.on_source(bundle)
"    let g:indent_guides_guide_size = 1
"    let g:indent_guides_auto_colors = 0
"    highlight IndentGuidesOdd guibg=red ctermbg=3
"    highlight IndentGuidesEven guibg=green ctermbg=4
"    IndentGuidesEnable
"endfunction

"==============================================================================
" QuickRun
"==============================================================================
NeoBundle 'thinca/vim-quickrun'
let s:hooks = neobundle#get_hooks('vim-quickrun')
function! s:hooks.on_source(bundle)
    "let g:quickrun_config = {
        "\ '*': {'runner': 'remote/vimproc'},
        "\ }
    set splitbelow
    set splitright
    nnoremap <Space>r :QuickRun<CR>
endfunction

"==============================================================================
" Python (virtualenv & django)
"==============================================================================
NeoBundleLazy 'lambdalisue/vim-django-support', {
    \ 'autoload': {
    \   'filetypes': ['python', 'python3', 'djangohtml']
    \ }}
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
    \ 'autoload': {
    \   'filetypes': ['python', 'python3', 'djangohtml']
    \ }}

"==============================================================================
" jedi
"==============================================================================
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"],
    \ },
    \ "build": {
    \   "cygwin": "pip install jedi",
    \   "mac": "pip install jedi",
    \   "unix": "pip install jedi",
    \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
endfunction

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

