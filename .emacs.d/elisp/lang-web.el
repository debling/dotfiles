;; -*- lexical-binding: t; -*-

(use-package web-mode
  :bind (("C-c ]" . emmet-next-edit-point)
	 ("C-c [" . emmet-prev-edit-point)
	 ("C-c o b" . browse-url-of-file))
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.phtml?\\'" . web-mode)
   ("\\.tpl\\.php\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode))
  :hook (web-mode . my-web-mode-hook)
  :config
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-code-indent-offset 2
	web-mode-auto-close-style 1
	web-mode-auto-quote-style 1
	web-mode-enable-auto-quoting t
	web-mode-enable-auto-pairing t
	web-mode-enable-current-element-highlight t)

  (use-package web-mode-edit-element
    :hook (web-mode . web-mode-edit-element-minor-mode))

  (with-eval-after-load "smartparens"
    (sp-local-pair 'web-mode "<" nil))

  (use-package emmet-mode
    :delight
    :hook (web-mode . emmet-mode)
    :config
    (setq emmet-move-cursor-between-quotes t))

  (use-package company-web)

  (defun my-web-mode-hook ()
    "Hook for `web-mode' config for company-backends."
    (add-to-list (make-local-variable 'company-backends)
		 'company-web-html)))

(use-package css-mode
  :config
  (defun my-css-mode-hook ()
    (add-to-list (make-local-variable 'company-backends)
		 '(company-css)))
  :hook (css-mode . my-css-mode-hook))
(use-package js2-mode
  :hook (js . lsp)
  :config (setq js2-strict-trailing-comma-warning nil))

(use-package typescript-mode
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode))
  :config
  (use-package ts-comint
    :config
    (setq ts-comint-program-command "/home/dse/.npm/bin/tsun"))
  (use-package tide))

(use-package restclient
  :hook (restclient . company-rest-setup)
  :config
  (use-package restclient-test)
  (use-package company-restclient)
  (defun company-rest-setup ()
    (add-to-list (make-local-variable 'company-backends) 'company-restclient)))

(provide 'lang-web)
;;; lang-web.el ends here
