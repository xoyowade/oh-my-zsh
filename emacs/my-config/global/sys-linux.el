(provide 'linux)

;; for X Window
;; (defun fullscreen ()
;;       (interactive)
;;       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

;; for Emacs 23
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
(global-set-key (kbd "M-RET") 'toggle-fullscreen)
(toggle-fullscreen)
