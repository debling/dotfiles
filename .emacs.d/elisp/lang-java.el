(use-package lsp-java
  :after lsp
  :config
  (add-hook 'java-mode-hook #'lsp)
  (setq lsp-java-completion-guess-arguments t))

(use-package dap-java
  :ensure nil)

(provide 'lang-java)
;;; lang-java.el ends here
