;; start emacs server to enable emacsclient to send file
(server-start)

;; set when terminal fails to encode keyboard code
;(set-keyboard-coding-system nil)
(put 'upcase-region 'disabled nil)

;; backup files
(setq backup-directory-alist '(("" . "~/.emacs.d/.backups")))

;; ;; override stale lock
;; (defun emacs-process-p (pid)
;;   "If pid is the process ID of an emacs process, return t, else nil.
;; Also returns nil if pid is nil."
;;   (when pid
;;     (let ((attributes (process-attributes pid)) (cmd))
;;       (dolist (attr attributes)
;;         (if (string= "comm" (car attr))
;;             (setq cmd (cdr attr))))
;;       (if (and cmd (or (string= "emacs" cmd) (string= "emacs.exe" cmd))) t))))

;; (defadvice desktop-owner (after pry-from-cold-dead-hands activate)
;;   "Don't allow dead emacsen to own the desktop file."
;;   (when (not (emacs-process-p ad-return-value))
;;     (setq ad-return-value nil)))
;; ;; restore only 10 buffers at first, others will be loaded lazily
;; (setq desktop-restore-eager 10)
;; ;; Desktop save mode
;; (desktop-save-mode t)

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

;; it's more comfortable to handle long lines in visual line mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(global-visual-line-mode 1)

;; dont't show welcome screen for me, thank you!
(setq inhibit-startup-message t)

(provide 'my-buildin)
