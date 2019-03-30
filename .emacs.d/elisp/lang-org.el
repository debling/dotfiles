;; -*- lexical-binding: t; -*-

(use-package org
  :hook (org-mode . org-indent-mode)
  :bind (("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture))
  :config
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>")		'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>")	'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>")		'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>")	'evil-previous-visual-line)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
  (setq org-directory			"~/Org/"
	org-plantuml-jar-path		(replace-regexp-in-string "\n$" ""
								  (shell-command-to-string "cat $(which plantuml) | cut -d \"'\" -f2 | sed 1d"))
	plantuml-jar-path               org-plantuml-jar-path
	flycheck-plantuml-executable    org-plantuml-jar-path
	org-confirm-babel-evaluate	nil
	org-log-reschedule		t
	org-log-done			t
        org-default-notes-file		(concat org-directory "notes.org")
        org-agenda-files		(list (concat org-directory "todo.org"))
        org-src-fontify-natively	t
	org-hide-emphasis-markers	t
	org-capture-templates		'(("t" "TODO" entry (file "~/Org/todo.org")
					   "* TODO %?\n%U" :empty-lines 1)
					  ("n" "Note" entry (file "~/Org/notes.org")
					   "* %? :NOTE:\n%U\n%a\n" :empty-lines 1)))
  (when (window-system)
    (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans pro"))
				 ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
				 (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
	   (headline           `(:inherit default :weight bold)))

      (custom-theme-set-faces
       'user
       `(org-level-8 ((t (,@headline ,@variable-tuple))))
       `(org-level-7 ((t (,@headline ,@variable-tuple))))
       `(org-level-6 ((t (,@headline ,@variable-tuple))))
       `(org-level-5 ((t (,@headline ,@variable-tuple))))
       `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
       `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
       `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
       `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
       `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))))
  ;;; org-plus-contrib config
    (org-babel-do-load-languages 'org-babel-load-languages '((emacs-lisp . t)
                                                             (shell . t)
                                                             (python . t)
                                                             (C . t)
                                                             (sql . t)
							     (dot . t)
							     (plantuml . t)
							     (haskell . t)
							     (clojure . t)
							     (calc . t))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))
(use-package htmlize)
(use-package openwith
  :config
  (openwith-mode t)
  (setq openwith-associations '(("\\.pdf\\'" "zathura" (file)))))


(provide 'lang-org)
