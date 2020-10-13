;; -*- lexical-binding: t; -*-

;;; Code:

(use-package ivy
  :delight
  :config
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d ")
  (ivy-mode 1))

(use-package ivy-xref
  :defines evil-normal-state-map
  :bind (:map evil-normal-state-map
	      ("g d" . xref-find-definitions))
  :config
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package counsel
  :delight
  :config (counsel-mode 1)
  :commands (counsel-semantic-or-imenu
	     counsel-switch-buffer
	     counsel-find-file
	     counsel-org-capture
	     counsel-dired
	     consel-M-x)
  :bind (:map evil-normal-state-map
	      ("C-c c" . counsel-org-capture)
	      ("C-x d" . counsel-dired)
	      ("C-x C-r" . counsel-recentf)))

(use-package helm
  :defer t
  :defines helm-ff-keep-cached-candidates
  :config
  (setq helm-ff-keep-cached-candidates nil))

(provide 'completion-engine)
;;; completion-engine.el ends here
