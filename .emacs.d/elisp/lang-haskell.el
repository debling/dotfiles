;; haskell-mode configuration
;; https://github.com/haskell/haskell-mode

(use-package haskell-mode
  ;; haskell-mode swaps `C-m' and `C-j' behavior. Revert it back
  :ensure-system-package ghc
  :hook (haskell-mode . haskell-indentation-mode)
  :bind (:map haskell-mode-map
              ("C-m" . newline)
              ("C-j" . electric-newline-and-maybe-indent)))

;; intero-mode for a complete IDE solution to haskell
;; commercialhaskell.github.io/intero
(use-package intero
  :ensure-system-package stack
  :hook ((haskell-mode . intero-mode)
	 (intero-mode . intero-company-backend)
	 (intero-repl-mode . intero-company-backend))
  :config
  (defun intero-company-backend ()
    (add-to-list (make-local-variable 'company-backends) '(company-intero))))

;; hindent - format haskell code automatically
;; https://github.com/chrisdone/hindent
(use-package hindent
  :ensure-system-package hindent
  :hook (haskell-mode . hindent-mode)
  :delight
  :config
  ;; reformat the buffer using hindent on save
  (setq hindent-reformat-buffer-on-save t))

(provide 'lang-haskell)
;;; lang-haskell.el ends here
