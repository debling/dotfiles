;; -*- lexical-binding: t; -*-

(use-package editorconfig
  :ensure t
  :hook (after-init . editorconfig-mode))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package flyspell
  :delight
  :hook ((prog-mode . flyspell-prog-mode)
	 (text-mode . flyspell-mode))
  :ensure-system-package ((aspell . aspell-pt) (aspell . aspell-en)(aspell))
  :bind ("<f8>" . switch-dictionary)
  :config
  (setq ispell-program-name "aspell"
	ispell-extra-args '("--sug-mode=ultra" "--run-together")
	ispell-dictionary "en_US")
  (defun switch-dictionary()
    (interactive)
    (let* ((dic ispell-current-dictionary)
	   (change (if (string= dic "pt_BR") "en_US" "pt_BR")))
      (ispell-change-dictionary change)
      (message "Dictionary switched from %s to %s" dic change)))
  (defun flyspell-buffer-after-pdict-save (&rest _)
    (flyspell-buffer))
  (advice-add 'ispell-pdict-save :after #'flyspell-buffer-after-pdict-save))

(use-package lsp-mode
  :commands lsp
  :bind (:map evil-normal-state-local-map
	      ("gd" . lsp-find-definition))
  :init
  (setq lsp-prefer-flymake nil))
(use-package lsp-ui
  :commands lsp-ui-mode
  :config (set-face-background 'lsp-ui-doc-background "#f4ebd7"))

(use-package dap-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package yasnippet
  :delight yas-minor-mode
  :hook ((term-mode-hook . (lambda()
			     (yas-minor-mode -1)))
	 (after-init . yas-global-mode))
  :config
  (use-package yasnippet-snippets))

(use-package company
  :hook (after-init . global-company-mode)
  :delight
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("SPC" . nil))
  :config
  (setq company-idle-delay 0.3
	company-minimum-prefix-length 0
	company-require-match nil)
  (company-tng-configure-default)
  (use-package company-statistics
    :hook (company-mode . company-statistics-mode)))

(use-package rainbow-delimiters
  :hook (prog-mode .  rainbow-delimiters-mode))

(use-package nlinum-relative
  :bind (:map evil-normal-state-map
	      ("<f7>" . nlinum-mode))
  :hook (nlinum-mode . nlinum-relative-on)
  :config
  (setq nlinum-format "%d ")
  (nlinum-relative-setup-evil))

(use-package olivetti
  :hook (text-mode . olivetti-mode)
  :config (setq-default olivetti-body-width 80))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package eldoc
  :delight
  :config
  (global-eldoc-mode 1))

(use-package counsel-gtags
  :after counsel
  :delight
  :bind (:map counsel-gtags-mode-map
	      ("M-t" . counsel-gtags-find-definition)
	      ("M-r" . counsel-gtags-find-reference)
	      ("M-s" . counsel-gtags-find-symbol)
	      ("M-," . counsel-gtags-go-backward))
  :hook ((c-mode c++-mode java-mode asm-mode ). counsel-gtags-mode)
  :config
  (evil-define-key 'evil-insert-state 'counsel-gtags-mode-map (kbd "gd") 'counsel-gtags-dwim)
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-gtags)))

(use-package subword
  :delight
  :config
  (global-subword-mode))

(setq compilation-finish-functions
      (lambda (_ str)
      	(when (not (string-match ".*exited abnormally.*" str))
      	  (progn
      	    (run-at-time "1.5 sec" nil
      			 (lambda ()
      			   (select-window (get-buffer-window (get-buffer-create "*compilation*")))
      			   (quit-window)))
      	    (message "No Compilation Errors!")))))

(require 'ansi-color)
(defun colorize-compilation ()
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation)

(provide 'lang-general)
;;; lang-general.el ends here
