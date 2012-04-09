;;; my-color-theme.el ---

(provide 'my-color-theme)

;; color-theme settings
(require 'color-theme)
(require 'color-theme-solarized)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (if (< (display-color-cells) 20)
	   (color-theme-tty-dark)
       (color-theme-solarized-light))
;      (color-theme-billw))
))

;; font
; set only under x-window
(when (display-graphic-p)
  (set-default-font "Mono-14")
  ; Chinese font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
		      charset
		      "Hiragino Sans GB-18")))

(setq-default line-spacing 3)

;;; my-color-theme.el ends here
