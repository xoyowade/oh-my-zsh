;; start emacs server to enable emacsclient to send file
(server-start)

;; set when terminal fails to encode keyboard code
;(set-keyboard-coding-system nil)
(put 'upcase-region 'disabled nil)

;; backup files
(setq backup-directory-alist '(("" . "~/.emacs.d/.backups")))

;; Desktop save mode
(desktop-save-mode t)
;; restore only 10 buffers at first, others will be loaded lazily
(setq desktop-restore-eager 10)

;; ------ text processing ------ ;;
;; Highlight FIXME, TODO and BUG
(font-lock-add-keywords nil
			'(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
;; Syntax highlight
(global-font-lock-mode t)
;; set the search range of semantic for project ;-)
(setq semanticdb-project-roots 	(list(expand-file-name "/")))
;; show the matched parenthese, that's cool
(show-paren-mode t)
;; set the highlight current line minor mode (so ungly!!)
;; (global-hl-line-mode 1)
;; (set-face-attribute hl-line-face nil :underline t)

;; instead of yes-or-no, I like to input y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; auto expand settings, make it...
(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
      '(
	senator-try-expand-semantic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-expand-list
	try-expand-list-all-buffers
	try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

;; make
(setq compile-command "make -C ")

;; woman
(setq woman-use-own-frame nil)

;; linum
(global-linum-mode t)

(provide 'my-buildin)
