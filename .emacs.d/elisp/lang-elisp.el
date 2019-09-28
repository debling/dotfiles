;; -*- lexical-binding: t; -*-

(use-package ielm
  :functions elisp-company-backends
  :bind (("C-c e i" . ielm)
	 ("C-c C-v C-w" . eval-and-replace))
  :hook ((emacs-lisp-mode . elisp-company-backends)
	 (ielm-mode . elisp-company-backends))
  :config
  (defun eval-and-replace ()
    "Replace the preceding sexp with its value."
    (interactive)
    (backward-kill-sexp)
    (condition-case nil
	(prin1 (eval (read (current-kill 0)))
	       (current-buffer))
      (error (message "Invalid expression")
	     (insert (current-kill 0)))))

  (defun elisp-company-backends ()
    (with-eval-after-load 'company-mode
      (add-to-list (make-local-variable 'company-backends) '(company-elisp)))))

(use-package eros
  :functions eros-mode
  :hook ((lisp-mode . eros-mode)
	 (emacs-lisp-mode . eros-mode)))


(provide 'lang-elisp)
;;; lang-elisp.el ends here
