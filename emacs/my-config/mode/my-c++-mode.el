;;; my-c++-mode.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: c++-mode.el,v 0.0 2009/04/17 02:59:11 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'c++-mode)

;;; Code:

(provide 'my-c++-mode)

(require 'google-c-style)

;; c++ editing style
(defun my-c++-mode-hook()
  (c-set-offset 'access-label '-) ; public/private label
  (setq tab-width 4 indent-tabs-mode nil)
  (setq c-basic-offset 4)
  ;(c-set-style "bsd")
  ;; (define-key c++-mode-map [f3] 'replace-regexp)

  ;; auto load which funtion mode
  (which-func-mode t)
)

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.H\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
;;; my-c++-mode.el ends here
