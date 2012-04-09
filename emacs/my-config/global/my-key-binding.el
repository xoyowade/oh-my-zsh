;;; my-key-binding.el ---

;; Author: zwxiao
;; Contact: zwxiao@gmail.com
;; Version: $Id: key-binding.el,v 0.0 2009/04/17 04:48:09 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'key-binding)

;;; Code:

(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command))
  )

(defun revert-buffer-no-confirm ()
  "Refreshes buffer without confirmation."
  (interactive) (revert-buffer t t)
  (message "Refreshed buffer."))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
	(revert-buffer t t t) )))
  (message "Refreshed open buffers.") )

;; indent and complete style
(global-set-key [(control tab)] 'my-indent-or-complete)
;; goto one line
(global-set-key [(meta g)] 'goto-line)
;; Set up the delete key 
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
;; refresh file
(global-set-key "\C-\M-r" 'revert-buffer-no-confirm)
(global-set-key "\C-c\C-r" 'revert-all-buffers)
(global-set-key "\C-\M-g" 'compile)
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

(provide 'my-key-binding)
;;; my-key-binding.el ends here
