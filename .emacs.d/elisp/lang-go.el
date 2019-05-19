;; -*- lexical-binding: t; -*-

(use-package go-mode
  :hook (go-mode . go-company-fmt-hooh)
  :config
  (use-package company-go)
  (defun go-company-fmt-hooh ()
    (add-to-list (make-local-variable 'company-backends) 'company-go)
    (add-hook (make-local-variable 'before-save-hook) 'gofmt-before-save))
  (setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go run"))
  (local-set-key (kbd "M-.") 'godef-jump))

(provide 'lang-go)
;;; lang-go.el ends here
