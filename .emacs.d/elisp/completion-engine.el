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

(provide 'completion-engine)
;;; completion-engine.el ends here
