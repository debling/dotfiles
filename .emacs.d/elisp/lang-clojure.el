;; -*- lexical-binding: t; -*-

(use-package clojure-mode)

(use-package clojure-mode-extra-font-locking)

(use-package clojure-snippets)

(use-package cider
  :config
  (setq cider-repl-display-help-banner nil))

(use-package flycheck-clojure
  :after flycheck
  :config (flycheck-clojure-setup))

(provide 'lang-clojure)
;;; lang-clojure.el ends here
