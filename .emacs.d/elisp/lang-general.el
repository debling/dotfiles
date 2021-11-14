;; -*- lexical-binding: t; -*-

(c-set-offset 'case-label '+)

(use-package editorconfig
  :delight
  :config (editorconfig-mode))

(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode))

(use-package flyspell
  :delight
  :hook (text-mode . flyspell-mode)
  :bind ("<f8>" . switch-dictionary)
  :config
  (setq ispell-program-name "aspell"
	ispell-extra-args '("--sug-mode=ultra" "--run-together")
	ispell-dictionary "pt_BR"
	ispell-alternate-dictionary "/home/dse/repos/IntelliJ.Portuguese.Brazil.Dictionary/portuguese-brazil.dic")
  (defun switch-dictionary()
    (interactive)
    (let* ((dic ispell-current-dictionary)
	   (change (if (string= dic "pt_BR") "en_US" "pt_BR")))
      (ispell-change-dictionary change)
      (message "Dictionary switched from %s to %s" dic change)))
  (defun flyspell-buffer-after-pdict-save (&rest _)
    (flyspell-buffer))
  (advice-add 'ispell-pdict-save :after #'flyspell-buffer-after-pdict-save))

(use-package yasnippet
  :commands (yas-global-mode yas-minor-mode)
  :delight yas-minor-mode
  :init
  (progn
    (defvar yas-global-mode nil)
    (use-package yasnippet-snippets :defer t)

    (defun maple/load-yasnippet ()
      (unless yas-global-mode (yas-global-mode 1))
      (yas-minor-mode 1))
    (add-hook 'prog-mode-hook 'maple/load-yasnippet)
    ))


(use-package company
  :delight
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)
	      ("C-j" . nil)
	      ("C-k" . nil)
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("SPC" . nil)
	      ("TAB" . nil))
  :config
  ;; (setq company-idle-delay                0.3
  ;; 	company-minimum-prefix-length     0
  ;; 	company-require-match             nil)
  (use-package company-statistics
    :hook (company-mode . company-statistics-mode)))

(use-package rainbow-delimiters
  :hook (prog-mode .  rainbow-delimiters-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package eldoc
  :delight
  :config
  (global-eldoc-mode 1))

(require 'ansi-color)
(defun colorize-compilation ()
  (when (eq major-mode 'compilation-mode)
    (ansi-color-apply-on-region compilation-filter-start (point-max))))
(add-hook 'compilation-filter-hook 'colorize-compilation)
(setq compilation-scroll-output t)

(use-package executable
  :ensure nil
  :defer t
  :hook
  ((after-save . executable-make-buffer-file-executable-if-script-p)))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(provide 'lang-general)
;;; lang-general.el ends here
