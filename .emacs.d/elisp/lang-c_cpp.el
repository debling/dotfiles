(use-package cc-mode
  :hook (c-mode . c-company-backends)
  :bind (:map c-mode-base-map
	      ("C-x C-e" . compile))
  :config
  (setq c-default-style "k&r"
	sp-escape-quotes-after-insert nil))

  (use-package irony
    :delight
    :hook ((prog-mode . irony-on)
	   (irony-mode . irony-cdb-autosetup-compile-options))
    :config
    (use-package irony-eldoc
      :hook irony-mode)
    (use-package company-irony)
    (use-package company-irony-c-headers)
    (defun irony-on ()
      (when (member major-mode irony-supported-major-modes)
	(irony-mode 1))))
  (defun c-company-backends ()
    (company-irony-setup-begin-commands)
    (add-to-list (make-local-variable 'company-backends) '(company-irony-c-headers company-irony)))

(use-package semantic
  :config
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (global-semantic-idle-local-symbol-highlight-mode 1)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode)
  :hook (c-mode . semantic-mode))

(use-package flycheck-clang-analyzer
  :after flycheck
  :hook ((c-mode-hook . flycheck-mode)
	 (c++-mode-hook . flycheck-mode))
  :config
  (flycheck-clang-analyzer-setup))

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (when (and
         (buffer-live-p buffer)
         (string-match "compilation" (buffer-name buffer))
         (string-match "finished" string)
         (not
          (with-current-buffer buffer
            (goto-char (point-min))
            (search-forward "warning" nil t))))
    (run-with-timer 0.8 nil
                    (lambda (buf)
		      (bury-buffer buf)
		      (switch-to-prev-buffer (get-buffer-window buf) 'kill))
                    buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)


(add-hook 'c-mode-hook
	  (lambda ()
	    (unless (or (file-exists-p "Makefile") (file-exists-p "MakeFile"))
              (set (make-local-variable 'compile-command)
		   (let ((file (file-name-nondirectory buffer-file-name)))
		     (concat "gcc -g -Wall -Wextra -o " (file-name-sans-extension file) " " file))))))
(add-hook 'c++-mode-hook
	  (lambda ()
	    (unless (or (file-exists-p "Makefile") (file-exists-p "MakeFile"))
              (set (make-local-variable 'compile-command)
		   (let ((file (file-name-nondirectory buffer-file-name)))
		     (concat "g++ -g -Wall -Wextra -o " (file-name-sans-extension file) " " file))))))

(provide 'lang-c)
;;; lang-c.el ends here
