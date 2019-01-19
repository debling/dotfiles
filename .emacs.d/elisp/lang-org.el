(use-package org
  :hook (org-mode . org-indent-mode)
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :config
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>")		'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>")	'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>")		'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>")	'evil-previous-visual-line)
  (setq org-directory			"~/Org/"
	org-plantuml-jar-path		"~/.emacs.d/plantuml.jar"
	org-confirm-babel-evaluate	nil
	org-log-reschedule		t
	org-log-done			t
        org-default-notes-file		(concat org-directory "Agenda/AFazeres.org")
        org-agenda-files		(list "~/Org/Agenda")
        org-src-fontify-natively	t
	org-hide-emphasis-markers	t
	org-capture-templates		'(("t" "TODO" entry (file "~/Org/Agenda/AFazeres.org")
					   "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
					  ("n" "Anotação" entry (file "~/Org/Agenda/AFazeres.org")
					   "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
					  ("p" "Ligação telefónica" entry (file "~/git/org/refile.org")
					   "* LIGAÇÂO para %? :Ligação:\n%U" :clock-in t :clock-resume t)
					  ("E" "Evento" entry (file "~/Org/Agenda/Eventos.org")
					   "* %? :EVENTO:\n%U" :clock-in t :clock-resume t)))
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
