;; -*- lexical-binding: t; -*-

(use-package tex
  :ensure auctex
  :commands (company-auctex-init)
  :hook ((TeX-mode . flycheck-mode)
	 (TeX-mode . turn-on-reftex)
	 (TeX-mode . latex-math-mode)
	 (TeX-mode . tex-company-setup)
	 (TeX-mode . auctex-latexmk-setup))
  :config
  (setq TeX-auto-save		t
	TeX-parse-self		t
	TeX-save-query		nil
	TeX-PDF-mode		t
	TeX-command-default	"latexmk"
	TeX-view-program-list	'(("Evince" "zathura -P %(outpage) %o"))
	LaTeX-default-author	user-full-name)
  (add-to-list 'TeX-view-program-selection '(output-pdf "Zathura"))
  (use-package auctex-latexmk
    :commands (auctex-latexmk-setup)
    :config
    (setq auctex-latexmk-inherit-TeX-PDF-mode t))
  (use-package company-auctex)

  (use-package reftex
    :commands (turn-on-reftex)
    :config
    (setq reftex-default-bibliography '("/home/dse/Documents/Bibrefs/main.bib")
	  reftex-plug-into-AUCTeX t))
  (use-package company-reftex)

  (use-package bibtex-utils)
  (use-package company-bibtex
    :config
    (setq company-bibtex-bibliography '("/home/dse/Documents/Bibrefs/main.bib")))

  (use-package company-math)

  (defun tex-company-setup ()
    "docstring"
    (add-to-list (make-local-variable 'company-backends) '(company-math company-reftex company-bibtex))))

(provide 'lang-latex)
;;; lang-latex.el ends here
