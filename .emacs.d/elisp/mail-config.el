;; -*- lexical-binding: t; -*-

(use-package sendmail
  :mode ("/neomutt-.*" . mail-mode)
  :hook ((mail-mode . turn-on-auto-fill)
	 (mail-mode . flyspell-mode))
  :bind (:map mail-mode-map
	      ("C-c C-c" . mail-save-exit))
  :config
  (setq mail-header-separator "")
  (defun mail-save-exit ()
    "Save buffer and exits."
    (interactive)
    (save-buffer)
    (server-edit)))

(provide 'mail-config)
;;; mail-config.el ends here
