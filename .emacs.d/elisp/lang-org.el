;; -*- lexical-binding: t; -*-
(use-package org
  :hook ((org-mode . org-indent-mode)
	 (org-babel-after-execute . org-redisplay-inline-images))
  :bind (("C-c l" . org-store-link)
	 ("C-c a" . org-agenda))
  :after evil
  :delight org-indent-mode
  :functions (evil-define-key)
  :defines (org-plantuml-jar-path
	    flycheck-plantuml-executable
	    org-capture-templates
	    evil-normal-state-map
	    evil-motion-state-map)
  :config
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>")	 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>")	 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle
    (kbd "SPC l c") 'org-cliplink
    (kbd "SPC l s") 'org-download-screenshot)

  (setq org-latex-pdf-process          '("latexmk -shell-escape -bibtex -f -pdf %f")
	reftex-default-bibliography    '("~/Documents/bibliography/references.bib")
	bibtex-completion-bibliography '("~/Documents/bibliography/references.bib")
	org-directory			"~/Org/"
	org-plantuml-jar-path           "~/.local/jar/plantuml.jar"
	flycheck-plantuml-executable    org-plantuml-jar-path
	org-confirm-babel-evaluate	nil
	org-log-reschedule		t
	org-log-done			t
	org-default-notes-file		(concat org-directory "notes.org")
	org-agenda-files		(list (concat org-directory "todo.org"))
	org-src-fontify-natively	t
	org-pretty-entities             t
	org-hide-emphasis-markers	t
	org-export-with-smart-quotes    t
	org-capture-templates		'(("p" "TODO - Personal" entry (file+headline "~/Org/todo.org" "Personal")
					   "* TODO [#B] %?\n%U" :clock-in t :clock-resume t :empty-lines 1)
					  ("w" "TODO - Work" entry (file+headline "~/Org/todo.org" "Work")
					   "* TODO [#B] %?\n%U" :clock-in t :clock-resume t :empty-lines 1)
					  ("u" "TODO - Uni" entry (file+headline "~/Org/todo.org" "University")
					   "* TODO [#B] %?\n%U" :clock-in t :clock-resume t :empty-lines 1)
					  ("n" "Note" entry (file "~/Org/notes.org")
					   "* %? :NOTE:\n%U\n%a\n" :empty-lines 1)
					  ("j" "Journal" entry (file+datetree "~/Org/jornal.org")
					   "* %?\n%U\n" :clock-resume t)))

  ;;; org-plus-contrib config
  (org-babel-do-load-languages 'org-babel-load-languages '((emacs-lisp . t)
							   (shell . t)
							   (python . t)
							   (C . t)
							   (sql . t)
							   (java . t)
							   (dot . t)
							   (plantuml . t)
							   (haskell . t)
							   (clojure . t)
							   (calc . t)))

  (use-package org-bullets
    :hook (org-mode . org-bullets-mode)))
(use-package htmlize)
(use-package openwith
  :config
  (openwith-mode t)
  (setq openwith-associations '(("\\.pdf\\'" "zathura" (file)))))

(use-package org-cliplink)

(use-package org-ref
  :defer t
  :after org-mode
  :config
  (setq org-ref-bibliography-notes "~/Documents/bibliography/notes.org"
	org-ref-default-bibliography '("~/Documents/bibliography/references.bib")
	org-ref-pdf-directory "~/Documents/bibliography/bibtex-pdfs/"
	bibtex-completion-bibliography "~/Documents/bibliography/references.bib"
	bibtex-completion-library-path "~/Documents/bibliography/bibtex-pdfs/"))

(use-package noflet)

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame."
  (if (equal "org-capture-popup" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-destroy
    (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame."
  (if (equal "org-capture-popup" (frame-parameter nil 'name))
      (delete-frame)))

(defun dse/org-capture-popup ()
  "Make a new frame and run `org-capture' with no splits."
  (interactive)
  (select-frame-set-input-focus (make-frame '((name . "org-capture-popup"))))
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
    (org-capture)))

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process '( "latexmk -shell-escape -bibtex -f -pdf %f"))

(use-package ox-reveal
  :config
  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))

(provide 'lang-org)
;;; lang-org.el ends here
