;;; my-xcscope.el ---

(provide 'my-xcscope)

;; cscope settings
(require 'xcscope)
(setq cscope-use-face nil)

; fix the 'enter' key issue on -nw mode
; remapping the 'enter' key as kbd "RET" or "/r" would cause failing to enter when editing python/make file
(define-key cscope-list-entry-keymap (kbd "RET") 'cscope-select-entry-other-window)

;; for large project, disable auto update 
;(setq cscope-do-not-update-database t)
;;; my-xcscope.el ends here
