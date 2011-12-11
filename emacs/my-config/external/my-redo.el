;;; my-redo.el ---

(provide 'my-redo)

;; redo settings
(require 'redo+)
(global-set-key [(f5)] 'undo)
(global-set-key [(shift f5)] 'redo)
;;; my-redo.el ends here
