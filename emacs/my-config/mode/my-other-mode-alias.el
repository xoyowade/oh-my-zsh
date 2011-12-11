;;; my-other-mode-alias.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: other-mode-alias.el,v 0.0 2009/04/17 05:06:30 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'other-mode-alias)

;;; Code:

(provide 'my-other-mode-alias)

;; set the mode-alias list
(require 'css-mode)
; loads ruby mode when a .rb file is opened.
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)

(add-to-list 'auto-mode-alist '(".rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '(".rhtml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile"  . makefile-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefrag"  . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.mk\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
;;; my-other-mode-alias.el ends here
