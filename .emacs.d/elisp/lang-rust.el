;; -*- lexical-binding: t; -*-

(use-package toml-mode)

(use-package rust-mode
  :config (setq rust-format-on-save t))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package racer
  :hook ((rust-mode . racer-mode)
	 (racer-mode . eldoc-mode)))

(provide 'lang-rust)
;;; lang-rust.el ends here
