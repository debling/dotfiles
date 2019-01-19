(use-package ielm
  :functions elisp-company-backends
  :bind ("C-c e i" . ielm)
  :hook ((emacs-lisp-mode . elisp-company-backends)
	 (ielm-mode . elisp-company-backends))
  :config
  (defun elisp-company-backends ()
    (with-eval-after-load 'company-mode
      (add-to-list (make-local-variable 'company-backends) '(company-elisp)))))

(use-package eros
  :functions eros-mode
  :hook ((lisp-mode . eros-mode)
	 (emacs-lisp-mode . eros-mode)))

(provide 'lang-elisp)
;;; lang-elisp.el ends here
