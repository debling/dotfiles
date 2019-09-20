(use-package plantuml-mode
  :config
  (use-package flycheck-plantuml
    :config
    (setq flycheck-plantuml-executable "/home/dse/plantuml.jar")
      (flycheck-plantuml-setup)))

(use-package nginx-mode
  :config
  (use-package company-nginx
    :config
    (eval-after-load 'nginx-mode
      '(add-hook 'nginx-mode-hook #'company-nginx-keywords))))

(use-package mutt-mode)

(provide 'lang-misc)
;;; lang-misc.el ends here
