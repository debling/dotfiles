(use-package plantuml-mode
  :config
  (use-package flycheck-plantuml
    :config
    (setq flycheck-plantuml-executable "/home/dse/plantuml.jar")
      (flycheck-plantuml-setup)))

(provide 'lang-misc)
;;; lang-misc.el ends here
