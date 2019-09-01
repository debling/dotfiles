;; -*- lexical-binding: t; -*-

(use-package company-shell
  :hook
  (sh-mode . shell-company-backends)
  :config
  (defun shell-company-backends ()
    (interactive)
    (add-to-list (make-local-variable 'company-backends) '(company-shell
							   company-shell-env))))
(use-package load-bash-alias
  :ensure t
  :config
  (setq load-bash-alias-bashrc-file "~/.bashrc"))

(use-package counsel-tramp
  :config (setq tramp-default-method "ssh"))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package docker)

(provide 'lang-shell)
;;; lang-shell.el ends here
