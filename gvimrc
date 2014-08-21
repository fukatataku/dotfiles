" -*- encoding:utf-8 -*-
" GUI環境用の設定

"==============================================================================
" Display Settings
"==============================================================================
"===================
" ColorScheme
"===================
colorscheme jellybeans
"autocmd GUIEnter * set transparency=192

"===================
" Cursor Settigs
"===================
set guicursor=n-v-ve-o-c-sm:block-Cursor/lCursor-blinkon0
set guicursor+=i-r-ci-cr:ver25-Cursor-blinkon0

"===================
" Font Settings
"===================
if has('win32')
  "set guifont=MS_Gothic:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " Osakaフォントを使う
  " WindowsでOsakaフォントを使うには以下を参考にする
  " http://osaka.is.land.to/
  " http://osaka.is.land.to/files/Osaka.zip
  " ↑をダウンロードしてインストールすればOK
  set encoding=cp932
  set guifont=Osaka－等幅:h12
  set ambiwidth=auto
  set encoding=utf-8
  set linespace=1
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  set guifontset=a14,r14,k14
endif

"===================
" Window Settings
"===================
set columns=120
set lines=80
set cmdheight=2

"===================
" Bar Settings
"===================
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

"===================
" 日本語入力
"===================
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"===================
" マウス
"===================
set mouse=a
set nomousefocus
set mousehide
set guioptions+=a

