;; -*- lexical-binding: t; -*-

(use-package evil
  :functions (evil-global-set-key evil-define-minor-mode-key)
  :init
  (setq evil-want-integration        t
	evil-want-keybinding         nil
	evil-want-C-u-scroll         t
	evil-want-change-word-to-end nil)
  :config
  (evil-mode)
  (global-set-key (kbd "C-h") (kbd "<backspace>"))
  (global-set-key (kbd "C-j") (kbd "RET"))

  (evil-define-key 'normal 'global
    (kbd "C-M-h") #'enlarge-window-horizontally
    (kbd "C-M-l") #'shrink-window-horizontally
    (kbd "C-M-j") #'shrink-window
    (kbd "C-M-k") #'enlarge-window
    (kbd "çh")    #'help))

(use-package evil-collection
  :after evil
  :defines evil-collection-company-use-tng
  :config
  (setq evil-collection-mode-list (delete 'edbi (delete 'evil-mc evil-collection-mode-list))
	evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package undo-tree
  :delight)

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-org
  :delight
  :after org
  :functions evil-org-agenda-set-keys
  :hook ((org-mode . evil-org-mode)
	 (evil-org-mode-hook . evil-org-set-key-theme))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package smartparens
  :delight
  :after evil
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

(use-package evil-mc
  :delight
  :after evil
  :config
  (global-evil-mc-mode 1))

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

(use-package evil-commentary
  :delight
  :config (evil-commentary-mode))

(provide 'editing)
;;; editing.el ends here
