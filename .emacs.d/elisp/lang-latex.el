;; -*- lexical-binding: t; -*-

;; (use-package tex
;;   :ensure auctex
;;   :hook (LaTeX-mode . (latex-math-mode latex-company-backends))
;;   :config
;;   (setq TeX-auto-save t
;; 	TeX-parse-self t
;; 	TeX-save-query nil
;; 	reftex-plug-into-AUCTeX t
;; 	TeX-PDF-mode t))
;;   (use-package company-bibtex
;;     :config(setq company-bibtex-bibliography '("/home/debling/Documents/RefsBib/*.bib")))

;;   (use-package company-reftex)
;;   (use-package company-math)

(use-package tex
  :ensure auctex
  :config
 (setq TeX-auto-save t
    TeX-parse-self t
    TeX-save-query nil
    reftex-plug-into-AUCTeX t
    TeX-PDF-mode t)

 (use-package company-auctex
   :hook (latex-mode . company-auctex-init)))

(provide 'lang-latex)
;;; lang-latex.el ends here
