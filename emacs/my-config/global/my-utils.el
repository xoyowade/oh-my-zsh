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

