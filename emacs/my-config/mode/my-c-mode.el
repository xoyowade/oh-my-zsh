;;; my-c-mode.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: c-mode.el,v 0.0 2009/04/17 02:54:15 zwxiao Exp $
(provide 'my-c-mode)

;; ccmode: these commands got from caole's .emacs file
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;; c/c++ editing style
(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;; hungry-delete and auto-newline
  (c-toggle-hungry-state 1)
  (hs-minor-mode)
  (setq c-basic-offset 4)
  ;; binding key
  (define-key c-mode-base-map (kbd "C-c h") 'hs-hide-block)
  (define-key c-mode-base-map (kbd "C-c u") 'hs-show-block)
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  ;;(define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  ;;(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  ;;(define-key c-mode-base-map [(meta ?/)] 'hippie-expand)
  (define-key c-mode-base-map [(meta ?/)] 'xref-completion)
  (define-key c-mode-base-map [(shift f6)] 'xref-pop-and-return)
  (define-key c-mode-base-map [(f6)] 'xref-push-and-goto-definition)

  ;; preprocessing setttings
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
  ;; show trial whitespace
  (setq show-trailing-whitespace t)
  ;; comment multi-line start with *
  (setq comment-multi-line t)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
;;; my-c-mode.el ends here
