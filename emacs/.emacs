;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Red Hat Linux default .emacs initialization file  ; -*- mode: emacs-lisp -*-
;; Just make It, make, make, make...!
;; Author: Liwei Yuan 2009-4-17
;; Author: Zhiwei Xiao 2011-11-5
;; Contact: zwxiao@gmail.com
;; There are three directories: external, mode and global
;; External: external package settings, such as cedet and xref
;; Mode: mode related settings, including key bindings, such as c-mode
;; Global: emacs global settings, such as emacs window size and style and global key bindings
;; NOTE: each configuration file is started with "my-" preffix in order to avoid conflict name(e.g. two redo.el files)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load my personal settings from conig                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq base-path "~/.emacshome/")
(setq base-load-path "~/.emacshome/my-plugin/")
(setq base-config-path "~/.emacshome/my-config/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; step 1: add all load and exec pathes                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path base-load-path)
(add-to-list 'load-path (concat base-load-path "cscope-15.7a"))
(add-to-list 'load-path (concat base-load-path "color-theme-6.6.0"))
(add-to-list 'load-path (concat base-load-path "emacs-color-theme-solarized"))
(add-to-list 'load-path (concat base-load-path "ecb-2.40.1"))
(add-to-list 'load-path (concat base-load-path "cedet-1.0/common"))
;(add-to-list 'load-path (concat base-load-path "slime"))
;(add-to-list 'load-path (concat base-load-path "slime/contrib"))
(add-to-list 'load-path (concat base-load-path "auto-complete"))
(add-to-list 'load-path (concat base-load-path "org-7.7/lisp"))
(add-to-list 'load-path (concat base-load-path "org-7.7/contrib/lisp"))
(add-to-list 'load-path (concat base-load-path "rinari"))
(add-to-list 'load-path (concat base-load-path "workgroups"))
(add-to-list 'load-path (concat base-load-path "yasnippet"))
(add-to-list 'load-path (concat base-load-path "undo-tree"))
(add-to-list 'load-path (concat base-load-path "p4.el"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; step 2: load external package settings                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat base-config-path "external"))
(require 'my-color-theme)
;; (require 'my-ecb)
;; (require 'my-cedet)
(require 'my-redo)
(require 'my-xcscope)
;(require 'my-slime)
(require 'my-auto-complete)
(require 'my-flymake)
(require 'my-org)
(require 'ido)
(ido-mode t)
(require 'my-octopress)
;(require 'my-workgroups)
;; (require 'my-desktop)
(require 'my-yasnippet)
;(require 'my-p4)
(require 'my-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; step 3: load modes settings                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat base-config-path "mode"))
(require 'my-c-mode)
(require 'my-c++-mode)
(require 'my-cperl-mode)
(require 'my-other-mode-alias)
(require 'my-md-mode)
(require 'my-sh-mode)
(require 'my-compile-log-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; step 4: load global settings                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat base-config-path "global"))
(require 'my-key-binding)
(require 'my-utils)
(require 'my-window-style)
(require 'my-buildin)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; step 4: load system specified settings                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond ((string-equal system-type "windows-nt") (require 'sys-windows))
      ((string-equal system-type "darwin") (require 'sys-macosx))
      (t (require 'sys-linux)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-auto-activate t)
 '(ecb-options-version "2.32")
 '(ecb-source-path (quote ("~/xoyo/arm/vivi" "~/xoyo/arm/linux-2.6.29")))
 '(make-backup-files nil)
 '(safe-local-variable-values (quote ((TeX-auto-parse-length . 99999) (TeX-auto-save) (delete-old-versions . t))))
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(require 'my-workgroups)
