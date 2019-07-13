;; -*- lexical-binding: t; -*-

(use-package lsp-java
  :after lsp
  :config
  (add-hook 'java-mode-hook #'lsp)
  (setq lsp-java-completion-guess-arguments t)
  (require 'lsp-java-boot)

  ;; to enable the lenses
  (add-hook 'lsp-mode-hook #'lsp-lens-mode)
  (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode))

(use-package dap-java
  :ensure nil)

(provide 'lang-java)
;;; lang-java.el ends here
