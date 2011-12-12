;;; my-color-theme.el ---

(provide 'my-color-theme)

;; color-theme settings
(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (if (< (display-color-cells) 20)
	 (color-theme-tty-dark)
      (color-theme-billw))
))

(set-default-font "Mono-12")

;;; my-color-theme.el ends here
