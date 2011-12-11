;;; my-c++-mode.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: c++-mode.el,v 0.0 2009/04/17 02:59:11 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'c++-mode)

;;; Code:

(provide 'my-c++-mode)

;; c++ editing style
(defun my-c++-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
  ;; (define-key c++-mode-map [f3] 'replace-regexp)
)

(add-hook 'c++-mode-common-hook 'my-c++-mode-common-hook)

(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.H\\'" . c++-mode))
;;; my-c++-mode.el ends here
