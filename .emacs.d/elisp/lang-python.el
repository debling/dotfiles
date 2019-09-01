;; -*- lexical-binding: t; -*-

(use-package elpy
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (setq python-shell-interpreter "ipython"
	python-shell-interpreter-args "-i --simple-prompt"
	elpy-rpc-backend "jedi"))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (setq flycheck-python-flake8-executable "flake8"))

  ;; enable autopep8 formatting on save
(use-package py-autopep8
  :hook (elpy-mode . py-autopep8-enable-on-save))

(use-package pip-requirements
  :config
  (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup))

(use-package py-isort
  :hook (before-save-hook . py-isort-before-save))

(use-package importmagic
  :hook (python-mode . importmagic-mode))

(provide 'lang-python)
;;; lang-python.el ends here
