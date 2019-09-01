;; -*- lexical-binding: t; -*-

(use-package erlang
  :config
  (setq erlang-compile-extra-opts '((i . "../include"))
	flycheck-erlang-include-path '("../include")
	flycheck-erlang-library-path '())
  (use-package company-erlang
    :config
    (add-hook 'erlang-mode-hook #'company-erlang-init)))

(use-package edts)

(provide 'lang-erlang)
;;; lang-erlang.el ends here
