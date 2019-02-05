;; -*- lexical-binding: t; -*-

(use-package evil
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil)
  :config
  (evil-mode)
  (setq evil-search-module 'evil-search))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  (evil-org-mode-hook . evil-org-set-key-theme)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package smartparens
  :delight
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
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
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package auto-sudoedit
  :delight
  :config (auto-sudoedit-mode 1))

(use-package xclip
  :ensure-system-package xclip
  :config (xclip-mode 1))

(global-hl-line-mode t)

(provide 'editing)
;;; editing.el ends here
