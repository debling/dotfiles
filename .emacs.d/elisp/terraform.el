;; -*- lexical-binding: t; -*-


(use-package terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package company-terraform
  :hook (terraform-mode . company-terraform-init))

(provide 'terraform)
;;; terraform.el ends here
