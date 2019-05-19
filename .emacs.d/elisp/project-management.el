;; -*- lexical-binding: t; -*-

(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :delight '(:eval (concat " [" (projectile-project-name) ":" (symbol-name (projectile-project-type)) "]"))
  :config
  (projectile-mode 1)
  (setq projectile-completion-system 'ivy)
  (use-package org-projectile
    :bind (("C-c n p" . org-projectile-project-todo-completing-read)
           ("C-c c" . org-capture))
    :config
    (org-projectile-per-project)
    (setq org-projectile-per-project-filepath "TODO.org"
	  org-agenda-files (append org-agenda-files (org-projectile-todo-files))
	  org-projectile-capture-template "* TODO %?\n%U\n%a\n"
	  org-confirm-elisp-link-function nil)
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(use-package counsel-projectile
  :bind
  ("C-x v" . counsel-projectile)
  ("C-x c p" . counsel-projectile-ag)
  :config
  (counsel-projectile-mode 1))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w"))

(provide 'project-management)
;;; project-management ends here
