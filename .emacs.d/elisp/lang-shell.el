;; -*- lexical-binding: t; -*-

(use-package company-shell
  :hook ((sh-mode . shell-company-backends))
  :config
  (defun shell-company-backends ()
    (interactive)
    (add-to-list (make-local-variable 'company-backends) '(company-shell
							   company-shell-env
							   company-fish-shell))))
(use-package native-complete
  :config
  (native-complete-setup-bash))

(use-package load-bash-alias
  :ensure t
  :config
  (setq load-bash-alias-bashrc-file "~/.bash_aliases"))

(use-package counsel-tramp
  :config (setq tramp-default-method "ssh"))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode))

;; (use-package fish-completion
;;   :if (executable-find "fish")
;;   :hook (after-init . global-fish-completion-mode))


(use-package docker)

(add-hook 'term-mode-hook (lambda ()
  (setq-local global-hl-line-mode nil)))

(add-hook 'shell-mode-hook (lambda ()
  (setq-local global-hl-line-mode nil)))

(add-hook 'eshell-mode-hook (lambda ()
  (setq-local global-hl-line-mode nil)))

(provide 'lang-shell)
;;; lang-shell.el ends here
