" GUI環境用の設定
scriptencoding utf-8

"==============================================================================
" Release AutoGroup
"==============================================================================
augroup MyAutoCmd_G
    autocmd!
augroup END

"==============================================================================
" Display Settings
"==============================================================================
set vb t_vb=

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
function! SetCursorColor()
    if has('multi_byte_ime')
        highlight Cursor gui=reverse guifg=NONE guibg=NONE
        highlight CursorIM gui=reverse guifg=NONE guibg=NONE
    endif
endfunction
au MyAutoCmd_G ColorScheme * call SetCursorColor()
call SetCursorColor()

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
  set guifont=Osaka－等幅:h12
  set ambiwidth=auto
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

