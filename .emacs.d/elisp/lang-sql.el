(use-package sqlup-mode
  :delight)
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-inderactive-mode-hook 'sqlup-mode)

(use-package sql-indent
  :delight)
  (add-hook 'sql-mode-hook 'sqlind-minor-mode)
  (add-hook 'sql-inderactive-mode-hook 'sqlind-minor-mode)

(provide 'lang-sql)
;;; lang-sql ends here
