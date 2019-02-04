;; -*- lexical-binding: t; -*-

(use-package ivy
  :delight
  :config
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")
  (ivy-mode 1))

(use-package ivy-xref
    :config
    (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package counsel
  :delight
  :config (counsel-mode 1))

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
  (evil-define-key 'evil-normal-state 'counsel-gtags-mode-map (kbd "gd") 'counsel-gtags-dwim)
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-gtags)))

(provide 'completion-engine)
;;; completion-engine.el ends here
