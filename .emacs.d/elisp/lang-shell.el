;; -*- lexical-binding: t; -*-

(use-package company-shell
  :hook
  (sh-mode . shell-company-backends)
  :config
  (defun shell-company-backends ()
    (interactive)
    (add-to-list (make-local-variable 'company-backends) '(company-shell
							   company-shell-env))))
(provide 'lang-shell)
;;; lang-shell.el ends here
