;; -*- lexical-binding: t; -*-

(use-package cc-mode
  :bind (:map c-mode-base-map
	      ("C-x C-e" . compile))
  :config
  (setq c-default-style "k&r"
	sp-escape-quotes-after-insert nil))
(use-package ccls
  :hook ((c-mode c++-mode) . ccls/enable)
  :ensure-system-package (ccls . "yay --noconfirm -S ccls compiledb")
  :config
  (setq ccls-initialization-options '(:cacheDirectory "/tmp/ccls"))
  (defun ccls/enable ()
    (require 'ccls)
    (lsp)
    (make-local-variable 'company-lsp-cache-candidates)
    (make-local-variable 'lsp-enable-indentation)
    (setq company-lsp-cache-candidates nil
	  lsp-enable-indentation nil)))

(add-hook 'c-mode-hook
	  (lambda ()
	    (unless (or (file-exists-p "Makefile") (file-exists-p "MakeFile"))
              (set (make-local-variable 'compile-command)
		   (let ((file (file-name-nondirectory buffer-file-name)))
		     (concat "clang -g -Wall -Wextra -o " (file-name-sans-extension file) " " file))))))
(add-hook 'c++-mode-hook
	  (lambda ()
	    (unless (or (file-exists-p "Makefile") (file-exists-p "MakeFile"))
              (set (make-local-variable 'compile-command)
		   (let ((file (file-name-nondirectory buffer-file-name)))
		     (concat "clang++ -g -Wall -Wextra -o " (file-name-sans-extension file) " " file))))))

(provide 'lang-c)
;;; lang-c.el ends here
