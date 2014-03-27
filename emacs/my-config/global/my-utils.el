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
  (interactive) (revert-buffer t t)
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

