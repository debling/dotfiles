;; -*- lexical-binding: t; -*-

(use-package plantuml-mode
  :hook (plantuml-mode . dse/compile-plantuml)
  :config
  (setq plantuml-default-exec-mode 'executable
	plantuml-output-type       "png")
  (use-package flycheck-plantuml)
  (flycheck-plantuml-setup)
  (defun dse/compile-plantuml ()
    (set (make-local-variable 'compile-command)
	 (concat (nix-executable-find nil "previewpuml")
		 (shell-quote-argument buffer-file-name)))))

(use-package nginx-mode
  :config
  (use-package company-nginx
    :config
    (eval-after-load 'nginx-mode
      '(add-hook 'nginx-mode-hook #'company-nginx-keywords))))

(use-package mutt-mode)

(use-package ess)


(use-package docker)
(use-package dockerfile-mode)
(use-package docker-compose-mode)
(use-package docker-tramp)

(provide 'lang-misc)
;;; lang-misc.el ends here
