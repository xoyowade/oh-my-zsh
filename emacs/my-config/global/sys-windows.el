(provide 'sys-windows)

(message "Windows detected.")

(set-face-font 'default "Monaco-14")

;; Maximize windows
(defun w32-maximize-frame ()
    "Maximize the current frame"
      (interactive)
        (w32-send-sys-command 61488))
 
(add-hook 'window-setup-hook 'w32-maximize-frame t)

(setq make-backup-files nil)

(setq dropbox-base-dir "d:/My Documents/My Dropbox")
