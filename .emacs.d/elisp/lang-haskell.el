;; -*- lexical-binding: t; -*-

;; haskell-mode configuration
;; https://github.com/haskell/haskell-mode

(use-package haskell-mode
  ;; haskell-mode swaps `C-m' and `C-j' behavior. Revert it back
  :hook ((haskell-mode . haskell-indentation-mode)
	 (haskell-mode . interactive-haskell-mode))
  :bind (:map haskell-mode-map
              ("C-m" . newline)
              ("C-j" . electric-newline-and-maybe-indent))
  :config (setq haskell-process-log t))

(use-package dante
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

;; hindent - format haskell code automatically
;; https://github.com/chrisdone/hindent
(use-package hindent)

(use-package dante
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

;; hindent - format haskell code automatically
;; https://github.com/chrisdone/hindent
(use-package hindent
  :hook (haskell-mode . hindent-mode)
  :delight
  :config
  ;; reformat the buffer using hindent on save
  (setq hindent-reformat-buffer-on-save t))

(provide 'lang-haskell)
;;; lang-haskell.el ends here
