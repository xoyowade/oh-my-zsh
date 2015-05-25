(require 'p4)

;; prevent "path is not under client's root" error.
(setq p4-follow-symlinks t)

(provide 'my-p4)
