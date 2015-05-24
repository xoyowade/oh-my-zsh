;;; my-window-style.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: window-style.el,v 0.0 2009/04/17 03:01:57 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'window-style)

;;; Code:

(provide 'my-window-style)

;; set the emacs window when loaded
(setq default-frame-alist '((top . 0) (left . 0) (width . 1024) (height . 768)))
;;(defun w32-restore-frame  () "Restore a minimized frame()"  (interactive) (w32-send-sys-command 61728))
;;(defun w32-maximize-frame () "Maximzie the current frame()" (interactive) (w32-send-sys-command 61488))

;; turn on font-lock mode
(global-font-lock-mode t)

; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; no scroll bar
;(set-scroll-bar-mode nil)

;; scroll line by line
(setq scroll-step 1)

;; show trial whitespace
(setq show-trailing-whitespace t)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  (mouse-wheel-mode t)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions)
)

;; the following is the debugging settings using gdb
(setq gdb-many-windows t)
;; this enable gud many windows debug
;;(load-library "multi-gud.el")
;;(load-library "multi-gdb-ui.el")

;; cancel the bell... it is noisy..
(setq visible-bell t)
;; why not displaying time for
(display-time)
;; show me the column number...
(column-number-mode t)

;; speedup the scrolling in a large file
(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-maximum-decoration t)

;; I don't like toolbar that big...
(tool-bar-mode -1)
;; my-window-style.el ends here
