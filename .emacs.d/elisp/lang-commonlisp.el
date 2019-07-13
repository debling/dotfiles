;; -*- lexical-binding: t; -*-

(use-package slime
  :hook (slime-mode . slime-maybe-autoconnect)
  :bind (:map slime-mode-map
	      ("C-c C-q" . slime-repl-quit))
  :config
  (slime-setup '(slime-fancy slime-indentation slime-sbcl-exts slime-company))
  (use-package slime-company)

  (setq inferior-lisp-program "/usr/bin/sbcl"
	slime-contribs '(slime-fancy)
	slime-auto-start 'ask
	slime-lisp-implementations '((sbcl ("sbcl"))))

  (defun slime-maybe-autoconnect ()
    (unless (slime-connected-p)
      (save-excursion
	(slime)
	(let ((this-win (window-buffer))
	      (prev-win (window-buffer (previous-window))))
	  (set-window-buffer (selected-window) prev-win)
	  (set-window-buffer (previous-window) this-win)
	  (select-window (previous-window)))))))


(use-package common-lisp-snippets)

(provide 'lang-commonlisp)
;;; lang-commonlisp.el ends here
