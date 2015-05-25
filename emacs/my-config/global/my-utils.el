(provide 'my-utils)

;; eshell
(defalias 'eshell/vi 'find-file)
(defun eshell/clear ()
  "zwxiao's clear command under eshell"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; dos-unix text CRLF convertion
(defun dos-unix () (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun unix-dos () (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

(defun reload-dotemacs-file ()
  "reload your .emacs file without restarting Emacs"
  (interactive)
  (load-file "~/.emacs"))

(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command))
  )

(defun revert-buffer-no-confirm ()
  "Refreshes buffer without confirmation."
  (interactive) 
  (setq ori-filename buffer-file-name)
  (kill-this-buffer)
  ;(revert-buffer t t)
  (find-file ori-filename)
  (message "Refreshed buffer."))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
	(revert-buffer t t) )))
  (message "Refreshed open buffers.") )

(require 'thingatpt)
;; jump backward by a symbol
;; like foo-bar fooBar
(defun backward-symbol (arg)
  (interactive "p")
  (forward-symbol (- arg)))

;; Toggle window dedication

(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message 
   (if (let (window (get-buffer-window (current-buffer)))
	 (set-window-dedicated-p 
	  window (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))


(defun change-to-src-filename (fn)
  (setq new-fn 
	(when (string-match "/include/" fn)
	  (replace-match "/src/" nil nil fn)))
  (when (string-match ".h$" new-fn)
	  (replace-match ".cc" nil nil new-fn))
)

(defun change-to-include-filename (fn)
  (setq new-fn 
	(when (string-match "/src/" fn)
	  (replace-match "/include/" nil nil fn)))
  (when (string-match ".cc$" new-fn)
	  (replace-match ".h" nil nil new-fn))
)

(defun change-filename-include-or-src (fn)
  (if (string-match "/include/" fn)
      (change-to-src-filename fn)
      (change-to-include-filename fn))
)

(defun open-include-or-src-file ()
  "Open the coresponding include or src file"
  (interactive)
  (setq open-file-name (change-filename-include-or-src buffer-file-name))
  (if (file-exists-p open-file-name)
    (find-file open-file-name)
    (message (concat open-file-name " does not exist"))))
