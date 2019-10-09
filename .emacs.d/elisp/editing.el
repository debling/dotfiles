;; -*- lexical-binding: t; -*-

(use-package evil
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil
	evil-want-C-u-scroll t)
  :config
  (evil-global-set-key 'normal (kbd "çh") 'help)
  (evil-mode)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

  (defvar leader-map (make-sparse-keymap)
    "Keymap for \"leader key\" shortcuts.")

  (define-key evil-normal-state-map (kbd "SPC") leader-map)

  (evil-select-search-module 'evil-search-module 'evil-search))

(use-package evil-collection
  :after evil
  :defines evil-collection-company-use-tng
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package evil-org
  :after org
  :functions evil-org-agenda-set-keys
  :hook ((org-mode . evil-org-mode)
	 (evil-org-mode-hook . evil-org-set-key-theme))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package smartparens
  :delight
  :functions evil-define-minor-mode-key
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (evil-define-minor-mode-key 'normal 'smartparens-mode
    (kbd "çs") 'sp-forward-slurp-sexp
    (kbd "çb") 'sp-forward-barf-sexp
    (kbd "çS") 'sp-backward-slurp-sexp
    (kbd "çB") 'sp-backward-barf-sexp
    (kbd "çr") 'sp-raise-sexp
    (kbd "ç+") 'sp-join-sexp
    (kbd "ç-") 'sp-split-sexp
    (kbd "çwr") 'sp-wrap-round
    (kbd "çwc") 'sp-wrap-curly
    (kbd "çws") 'sp-wrap-square)
    (use-package evil-smartparens
      :delight
      :hook (smartparens-mode . evil-smartparens-mode)))

(use-package avy
  :commands (avy-goto-char-2 avy-pop-mark)
  :bind (:map evil-normal-state-map
	      ("\\" . avy-goto-char)
	      ("|" . avy-pop-mark)))

(use-package evil-mc
  :delight
  :config (global-evil-mc-mode 1))

(defun split-and-follow-horizontally ()
  "Split horizontally and switch to that window."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  "Split vertically and switch to that window."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package auto-sudoedit
  :delight
  :config (auto-sudoedit-mode 1))

(use-package xclip
  :config (xclip-mode 1))

(global-hl-line-mode t)

(provide 'editing)
;;; editing.el ends here
