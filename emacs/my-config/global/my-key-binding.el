;;; my-key-binding.el ---

;; Author: zwxiao
;; Contact: zwxiao@gmail.com
;; Version: $Id: key-binding.el,v 0.0 2009/04/17 04:48:09 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'key-binding)

;;; Code:

(require 'my-utils)

;; indent and complete style
;(global-set-key [(control tab)] 'my-indent-or-complete)
;; goto one line
(global-set-key [(meta g)] 'goto-line)
;; Set up the delete key 
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
;; refresh file
(global-set-key "\C-\M-r" 'revert-buffer-no-confirm)
(global-set-key "\C-c\C-r" 'revert-all-buffers)
(global-set-key "\C-\M-g" 'compile)
;; kill current buffer
(global-set-key "\C-xc" 'kill-this-buffer)
;; Mark regions
(global-set-key (kbd "C-M-2") 'set-mark-command)
;(global-set-key "\C-2" 'set-mark)

;; find file at cursor point
(global-set-key "\C-x\C-g" 'find-file-at-point)
(global-set-key "\C-xg" 'find-function)

;; prefer re version
(global-set-key "\M-%" 'query-replace-regexp)

;; comment or uncomment region
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region)

;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-3") 'split-window-horizontally ) ; split pane side by side
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane

;; for os whose alt-x is stoken
(global-set-key [(meta n)] 'execute-extended-command)

;; use ibuffer over buffer
(defalias 'list-buffers 'ibuffer)

;; quick buffer switch
(global-set-key (kbd "<C-S-tab>") 'wg-previous-buffer)
(global-set-key (kbd "<C-tab>") 'wg-next-buffer)
    
;; fix confliction with the shortcut of input mothod switch
(global-set-key (kbd "M-SPC") 'set-mark-command)
 
;; jump backward/forward by a symbol instead of word
;; like foo-bar fooBar
(global-set-key (kbd "M-b") 'backward-symbol)
(global-set-key (kbd "M-f") 'forward-symbol) 

;; rectangle/vertical insert
(global-set-key "\C-xri" 'string-insert-rectangle)

;; bind buffer to window 
(global-set-key "\C-c\C-b" 'toggle-window-dedicated)

;; fix enter key in -nw mode
;(global-set-key (kbd "RET") [return])

;; open the coresponding include or src file
(global-set-key "\C-c\C-f" 'open-include-or-src-file)

(provide 'my-key-binding)
;;; my-key-binding.el ends here

