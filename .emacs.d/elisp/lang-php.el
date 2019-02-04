;; -*- lexical-binding: t; -*-

(use-package php-mode
  :mode
  ("\\.php\\'" . php-mode)
  :config
  (use-package company-php
    :after company
    :hook (php-mode . php-company-backends)
    :config
    (defun php-company-backends ()
     (add-to-list (make-local-variable 'company-backends) 'company-ac-php-backend))))

(provide 'lang-php)
