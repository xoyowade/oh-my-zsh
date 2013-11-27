;;; my-sh-mode.el ---

;; Author: zwxiao
;; Contact: zwxiao@gmail.com

(provide 'my-sh-mode)

(defun my-sh-hook ()
  (interactive)
  (setq sh-basic-offset 2
        sh-indentation 2))

(add-hook 'sh-mode-hook 'my-sh-hook)

;;; my-sh-mode.el ends here
