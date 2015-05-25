;;; my-redo.el ---

(provide 'my-redo)

;; redo settings
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key [(f5)] 'undo) ; default ctrl+/
(global-set-key [(shift f5)] 'redo) ; default ctrl+?
;;; my-redo.el ends here
