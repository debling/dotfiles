;; -*- lexical-binding: t; -*-

(use-package nix-mode
  :commands nix-eshell nix-unpack nix-repl
  :bind (:map nix-mode-map
	      ("C-c C-o" . helm-nixos-options)
	      ("C-. u" . nix-update-fetch))
  :config
  (nix-prettify-global-mode 1)

  (use-package nixos-options)

  (use-package company-nixos-options
    :after nixos-options
    :hook (nix-mode . company-nix-setup)
    :config
    (defun company-nix-setup ()
      (add-to-list (make-local-variable 'company-backends)
		   'company-nixos-options)))

  (use-package helm-nixos-options
    :after nixos-options
    :commands helm-nixos-options)

  (use-package nix-update
    :commands nix-update-fetch)

  (use-package nix-buffer)
  (use-package nix-sandbox))

(provide 'lang-nix)
;;; lang-nix.el ends here
