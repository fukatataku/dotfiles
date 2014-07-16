;; C-hでBackSpace
(global-set-key "\C-h" 'delete-backward-char)

;; スタートアップメッセージを表示しない
(setq inhibit-startup-message t)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;; オートセーブファイルを作成しない
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-sace-list-file-prefix nil)

;; １行ずつスクロール
;;(setq scroll-step 1)
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)

;; カーソル位置を表示
(column-number-mode 1)
(line-number-mode 1)

;; カーソルのblinkを止める
(blink-cursor-mode 0)

;; バッファリストを開くときにウィンドウを分割しない
(global-set-key "\C-x\C-b" 'buffer-menu)

;; バッファの先頭／終端でのビープ音を消す

;; エラー音を消す
(setq ring-bell-function 'ignore)

;; 各種バーを消す
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

;; 文字コード (UTF-8)
;(set-language-environmant 'utf-8)
(set-default-coding-systems 'utf-8)

;; 英語フォント設定
(set-face-attribute 'default nil
            :family "Menlo"
            :height 100)

;; 日本語フォント
(set-fontset-font
 nil 'japanese-jisx0208
  (font-spec :family "Hiragino Kaku Gothic ProN"))

;; 半角と全角の比を1:2にする
(setq face-font-rescale-alist
      '(("Hiragino_Kaku_Gothic_ProN.*" . 1.2)))

