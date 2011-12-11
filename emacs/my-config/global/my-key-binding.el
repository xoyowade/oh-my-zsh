;;; my-key-binding.el ---

;; Author: zwxiao@ppidellsc1420
;; Contact: zwxiao@gmail.com
;; Version: $Id: key-binding.el,v 0.0 2009/04/17 04:48:09 zwxiao Exp $

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'key-binding)

;;; Code:

(provide 'my-key-binding)

(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command))
)

;; indent and complete style
(global-set-key [(control tab)] 'my-indent-or-complete)
;; goto one line
(global-set-key [(meta g)] 'goto-line)
;; Set up the delete key 
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
(global-set-key "\C-R" 'revert-buffer)
(global-set-key "\C-\M-g" 'compile)
;; Marking regions by C-2
(global-set-key (kbd "C-2") 'set-mark-command)
;(global-set-key "\C-2" 'set-mark)

;;; my-key-binding.el ends here
