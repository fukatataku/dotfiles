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
set nolist
"set listchars=tab:?ゑｽｻ\ ,eol:遶奇ｽｲ
set number 
"set wrap
if v:version >= 703
    set colorcolumn=80
endif
set t_vb=
set novisualbell
set cursorline
set cursorcolumn
hi clear CursorLine
hi clear CursorColumn
highlight CursorLine ctermbg=8
highlight CursorColumn ctermbg=8
colorscheme torte

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

