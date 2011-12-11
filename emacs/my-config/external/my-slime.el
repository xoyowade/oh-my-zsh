;;; my-slime.el --- 

(provide 'my-slime)
(require 'slime)

(setq slime-lisp-implementations
      '((mit-scheme ("mit-scheme") :init mit-scheme-init)))
 
(defun mit-scheme-init (file encoding)
  (format "%S\n\n"
          `(begin
            (load-option 'format)
            (load-option 'sos)
            (eval 
             '(construct-normal-package-from-description
               (make-package-description '(swank) '(()) 
                                         (vector) (vector) (vector) false))
             (->environment '(package)))
            (load ,(expand-file-name 
                    (concat base-load-path "slime/contrib/swank-mit-scheme.scm") ; <-- insert your path
                    slime-path)
                  (->environment '(swank)))
            (eval '(start-swank ,file) (->environment '(swank))))))
 
(defun mit-scheme ()
  (interactive)
  (slime 'mit-scheme))
 
(defun find-mit-scheme-package ()
  (save-excursion
    (let ((case-fold-search t))
      (and (re-search-backward "^[;]+ package: \\((.+)\\).*$" nil t)
           (match-string-no-properties 1)))))
 
(setq slime-find-buffer-package-function 'find-mit-scheme-package)

(setq inferior-lisp-program "/usr/local/bin/mit-scheme") ; your Lisp system
(add-to-list 'load-path (concat base-load-path "slime")) ; your SLIME directory
(add-to-list 'load-path (concat base-load-path "slime/contrib"))
;(require 'slime-autoloads)
(setq slime-protocol-version 'ignore) ; ignore the 'swank & slime versions differ' warnning
(slime-setup)


;;; my-slime.el ends here
