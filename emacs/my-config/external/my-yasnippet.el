(provide 'my-yasnippet)
(require 'yasnippet)
(setq base-path "~/.emacshome/")
(setq yas-snippet-dirs
      `(,(concat base-path ".snippets")   ;; personal snippets
	,(concat base-load-path "yasnippet/snippets")   ;; default snippets
        ))
(setq yas-triggers-in-field t)
(yas-global-mode 1)
;; to fix the bug that not loading templates of cc-mode for open buffers
(call-interactively 'yas-reload-all)
