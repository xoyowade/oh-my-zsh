;;; my-cperl-mode.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: cperl-mode.el,v 0.0 2009/04/17 02:58:15 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'cperl-mode)

;;; Code:

(provide 'my-cperl-mode)
(require 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)

;; Perl mode
(defun my-cperl-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (define-key cperl-mode-map [(return)] 'newline-and-indent)
  (define-key cperl-mode-map [(backspace)] 'c-hungry-backspace)
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 4)
)

(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)

(add-to-list 'auto-mode-alist '("\\.pm\\'" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pl\\'" . cperl-mode))
;;; my-cperl-mode.el ends here
