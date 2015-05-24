(require 'workgroups)
;; Your settings here

;(wg-load "~/.emacs.d/workgroups/code")
;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

;; Change prefix key (before activating WG)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
(provide 'my-workgroups)

; workgroups2
;(require 'workgroups2)
;
;(setq wg-prefix-key (kbd "C-c w"))
;
;;; Change workgroups session file
;(setq wg-session-file "~/.emacs.d/.emacs_workgroups")
;
;;; Set your own keyboard shortcuts to reload/save/switch WGs:
;;; "s" == "Super" or "Win"-key, "S" == Shift, "C" == Control
;(global-set-key (kbd "<pause>")     'wg-reload-session)
;(global-set-key (kbd "C-S-<pause>") 'wg-save-session)
;(global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
;(global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)
;
;;; What to do on Emacs exit / workgroups-mode exit?
;(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
;(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil
;
;;; Mode Line changes
;;; Display workgroups in Mode Line?
;(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
;(setq wg-flag-modified t)                 ; Display modified flags as well
;(setq wg-mode-line-decor-left-brace "["
;      wg-mode-line-decor-right-brace "]"  ; how to surround it
;            wg-mode-line-decor-divider ":")
;
;(workgroups-mode 1)   ; put this one at the bottom of .emacs
(provide 'my-workgroups)
