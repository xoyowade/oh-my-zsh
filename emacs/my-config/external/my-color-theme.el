;;; my-color-theme.el ---

(provide 'my-color-theme)

;; color-theme settings
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (if ((display-color-cells) 20)
	 (color-theme-tty-dark)
       (color-theme-arjen))
))

;;; my-color-theme.el ends here
