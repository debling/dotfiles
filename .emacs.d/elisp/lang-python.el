(use-package elpy
  :hook (after-init . elpy-enable)
  :config
  (setq python-shell-interpreter "ipython"
	python-shell-interpreter-args "-i --simple-prompt"))

(provide 'lang-python)
;;; lang-python.el ends here
