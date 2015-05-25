;; desktop session tweaks based on my-desktop
;; (http://scottfrazersblog.blogspot.com/2009/12/emacs-named-desktop-sessions.html)
;; Author: Zhiwei Xiao 2012-4-9

(require 'desktop)

(defvar my-desktop-session-dir 
  (expand-file-name "~/.emacs.d/desktop/")
  "*Directory to save desktop sessions in")

(defvar my-desktop-session-name-hist nil
  "Desktop session name history")

(defvar my-desktop-default-session-name "default"
  "The default session name")

(defun my-desktop-save-as (&optional name)
  "Save desktop by name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session" t)))
  (when name
    (let ((dirname (expand-file-name name my-desktop-session-dir)))
      (make-directory dirname t)
      (desktop-save dirname t)
      (message (concat "Session saved as " name ".")))))

(defun my-desktop-save ()
  "Save current desktop"
  (interactive)
  (my-desktop-save-as (my-desktop-get-current-name)))

(defun my-desktop-new ()
  "Save current desktop and create a new desktop."
  (interactive)
  (call-interactively 'my-desktop-save)
  (desktop-clear)
  (setq desktop-dirname nil)
  (call-interactively 'my-desktop-save-as))

(defun my-desktop-read (&optional name)
  "Read desktop by name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Read session" t)))
  (when name
    (desktop-clear)
    (desktop-read (expand-file-name name my-desktop-session-dir))))

(defun my-desktop-save-and-read ()
  "Save current desktop and read a desktop."
  (interactive)
  (my-desktop-save)
  (call-interactively 'my-desktop-read))

(defun my-desktop-destroy (&optional name)
  "Destroy desktop by name."
  (interactive)
  (setq current-name (my-desktop-get-current-name))
  (unless name
    (setq name (my-desktop-get-session-name "Destroy session" t)))

  (if (string= name my-desktop-default-session-name)
      (message "The default desktop cannot be destroyed.")
    (let ((dirname (expand-file-name name my-desktop-session-dir)))
      (setq desktop-dirname dirname)
      (desktop-remove)
      (delete-directory dirname t)
      (message (concat "Session " name " has been destroyed."))
      ; read the default session after destroying current session
      (if (string= current-name name)
	  (my-desktop-read my-desktop-default-session-name)
	(setq desktop-dirname (file-name-as-directory 
			       (expand-file-name 
				current-name my-desktop-session-dir)))))))

(defun my-desktop-name ()
  "Return the current desktop name."
  (interactive)
  (let ((name (my-desktop-get-current-name)))
    (if name
        (message (concat "Desktop name: " name))
      (message "No named desktop loaded"))))

(defun my-desktop-get-current-name ()
  "Get the current desktop name."
  (when desktop-dirname
    (let ((dirname (directory-file-name desktop-dirname)))
      (when (string= (file-name-directory dirname) my-desktop-session-dir)
        (file-name-nondirectory dirname)))))

(defun my-desktop-get-session-name (prompt &optional use-default)
  "Promt the user to enter a session name."
  (let* ((default (and use-default 
		       my-desktop-default-session-name 
		       (my-desktop-get-current-name)))
         (full-prompt (concat prompt (if default
                                         (concat " (default: " default "): ")
                                       ": "))))
    (completing-read full-prompt (and (file-exists-p my-desktop-session-dir)
                                      (directory-files my-desktop-session-dir))
                     nil nil nil my-desktop-session-name-hist default)))

(let ((default-dir (concat my-desktop-session-dir 
				 my-desktop-default-session-name)))
  (unless (file-directory-p default-dir) (make-directory default-dir))
  (setq desktop-path (list "." default-dir)))

(global-set-key "\C-cds" 'my-desktop-save)
(global-set-key "\C-cda" 'my-desktop-save-as)
(global-set-key "\C-cdn" 'my-desktop-new)
(global-set-key "\C-cdr" 'my-desktop-save-and-read)
(global-set-key "\C-cdd" 'my-desktop-destroy)
(global-set-key "\C-cdi" 'my-desktop-name)

(provide 'my-desktop)
