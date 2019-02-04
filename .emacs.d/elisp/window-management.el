;; -*- lexical-binding: t; -*-

(use-package perspective
  :hook (after-init . persp-mode)
  :bind (:map projectile-command-map
	      ("p" . projectile-persp-switch-project))
  :config
  (use-package persp-projectile))

(use-package windmove
  :bind (:map evil-normal-state-map
	      ("C-h" . windmove-left)
	      ("C-j" . windmove-down)
	      ("C-k" . windmove-up)
	      ("C-l" . windmove-right)))

(use-package zoom
  :delight
  :hook (after-init . zoom-mode))

(provide 'window-management)
;;; buffer-management ends here
