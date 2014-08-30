" Vimの基本設定 GUI用の設定はgvimrc
scriptencoding utf-8

"==============================================================================
" Release AutoGroup
"==============================================================================
augroup MyAutoCmd
    autocmd!
augroup END

"==============================================================================
" Encoding
"==============================================================================
if has('win32') || has('win64')
    set encoding=cp932
else
    set encoding=utf-8
endif
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

"==============================================================================
" Edit Settings
"==============================================================================
set backspace=indent,eol,start      " Backspaceで何でも削除
set wildmenu wildmode=list:full     " コマンドライン補完強化
set completeopt=menuone             " 補完時の動作／表示
set autoindent                      " 自動インデント

"===================
" Tab Settings
"===================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"===================
" Key Mapping
"===================
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
" Display Settings
"==============================================================================
set ruler
set number
"set wrap
"set list
"set listchars=tab:≫\ ,eol:?
"set t_vb=
"set novisualbell
set noerrorbells
set visualbell t_vb=

"===================
" Cursor
"===================
" 端末が制御シーケンスに対応している必要がある
" Teratermの場合は以下の設定が必要
" 設定 > その他の設定 > 制御シーケンス > カーソル形状/点滅変更制御シーケンス
" Macの場合、デフォルトのターミナルは対応していないので、iTerm2を使う
let &t_SI .= "\e[6 q"
let &t_EI .= "\e[2 q"

"===================
" Search Settings
"===================
set ignorecase
set smartcase
set incsearch
set hlsearch

"===================
" Highlight
"===================
syntax on
set background=dark
set cursorline
set cursorcolumn
hi clear CursorLine
hi clear CursorColumn
highlight CursorLine ctermbg=8
highlight CursorColumn ctermbg=8

set showmatch
set matchpairs& matchpairs+=<:>

" 80桁目をハイライト
if v:version >= 703
    set colorcolumn=80
    autocmd MyAutoCmd ColorScheme * hi ColorColumn guibg=Red ctermbg=1
endif

" 行末のスペースと全角スペースをハイライト
function! HiSpace()
    hi EndSpace cterm=underline ctermfg=Red gui=underline guifg=Red
    hi WideSpace cterm=underline ctermfg=Red gui=underline guifg=Red
endfunction
augroup MyAutoCmd
    au BufWinEnter,WinEnter * let w:m1 = matchadd("EndSpace", '\s\+$')
    if has('win32') || has('win64')
        au BufWinEnter,WinEnter * let w:m2 = matchadd("WideSpace", '　')
    else
        au BufWinEnter,WinEnter * let w:m2 = matchadd("WideSpace", '\%u3000')
    endif
    au ColorScheme * call HiSpace()
augroup END
call HiSpace()

"==============================================================================
" Etc Settings
"==============================================================================

"===================
" Auto file
"===================
set nowritebackup
set nobackup
set noswapfile

"===================
" Printer
"===================
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h12:cSHIFTJIS
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

"===================
" Tag jump settigns
"===================
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tagsファイルの重複防止
  set tags=./tags,tags
endif

"==============================================================================
" NeoBundle
"==============================================================================
if has('vim_starting')
    set nocompatible               " Be iMproved
    if has('win32') || has('win64')
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
" Basic Plugin
"==============================================================================
"===================
" vimproc
"===================
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
        \ 'windows' : 'make -f make_mingw32.make',
        \ 'cygwin'  : 'make -f make_cygwin.mak',
        \ 'mac'     : 'make -f make_mac.mak',
        \ 'unix'    : 'make -f make_unix.mak',
    \ }}

"===================
" unite
"===================
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

"===================
" vimshell
"===================
NeoBundle 'Shougo/vimshell.vim'

"===================
" vimfiler
"===================
NeoBundleLazy 'Shougo/vimfiler', {
    \ 'depends': ['Shougo/unite.vim'],
    \ 'autoload': {
    \   'commands': ['VimFiler', 'VimFilerDouble'],
    \   'mappings': ['<plug>(vimfiler_switch)'],
    \   'explorer': 1
    \ }}
nnoremap <Space>f :<C-u>VimFiler<CR>
nnoremap <Space>d :<C-u>VimFilerDouble<CR>
let s:hooks = neobundle#get_hooks('vimfiler')
function! s:hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1
    autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
    function! s:vimfiler_settings()
        nmap <buffer> R <Plug>(vimfiler_redraw_screen)
        nmap <buffer> <C-l> <C-w>l
        nmap <buffer> q Q
    endfunction
endfunction

"==============================================================================
" Edit Assist Plugin
"==============================================================================
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'

"===================
" neocomplete
"===================
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

"===================
" neosnippet
"===================
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"==============================================================================
" Display Assist Plugin
"==============================================================================

"===================
" ColorScheme
"===================
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

"===================
" lightline
"===================
NeoBundle 'itchyny/lightline.vim'
let s:hooks = neobundle#get_hooks('lightline.vim')
function! s:hooks.on_source(bundle)
    set laststatus=2
    let g:lightline = {'colorscheme' : 'wombat',}
endfunction

"==============================================================================
" General Programming Assist Plugin
"==============================================================================
"===================
" QuickRun
"===================
NeoBundle 'thinca/vim-quickrun'
let s:hooks = neobundle#get_hooks('vim-quickrun')
function! s:hooks.on_source(bundle)
    if has('win32') || has('win64')
        let l:ENCODE = 'utf-8:cp932'
    else
        let l:ENCODE = 'utf-8'
    endif
    let g:quickrun_config = {
        \ '_': {'runner': 'system',
        \       'hook/output_encode': 1,
        \       'hook/output_encode/encoding': l:ENCODE}
        \ }
    set splitbelow
    set splitright
    nnoremap <Space>r :QuickRun<CR>
endfunction

"==============================================================================
" Python Assist Plugin
"==============================================================================
NeoBundleLazy 'lambdalisue/vim-django-support', {
    \ 'autoload': {
    \   'filetypes': ['python', 'python3', 'djangohtml']
    \ }}
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
    \ 'autoload': {
    \   'filetypes': ['python', 'python3', 'djangohtml']
    \ }}

"===================
" jedi
"===================
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

"==============================================================================
" NeoBundle END
"==============================================================================
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

