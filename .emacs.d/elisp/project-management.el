;; -*- lexical-binding: t; -*-

(declare-function project-root "project")

(defun project-run-vterm ()
  "Invoke `vterm' in the project's root.
Switch to the project specific term buffer if it already exists.
Adapted from projectile to work with project.el"
  (interactive)
  (let* ((project (if (project-current)
		      (project-root (project-current))
		    default-directory))
	 (buffer (concat "*" (file-name-nondirectory
			      (directory-file-name project))
			 "-vterm*")))
    (unless (buffer-live-p (get-buffer buffer))
      (unless (require 'vterm nil 'noerror)
	(error "Package 'vterm' is not available"))
      (let ((default-directory project))
	(vterm buffer)))
    (switch-to-buffer buffer)))

(define-key project-prefix-map "t" #'project-run-vterm)

(use-package magit
  :commands (magit-status)
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  (use-package evil-magit
    :config (evil-magit-init))
  (use-package magit-todos)
  (require 'magit-extras))

  (use-package hl-todo
    :config (global-hl-todo-mode))

(provide 'project-management)
;;; project-management ends here
