;; -*- lexical-binding: t; -*-

(defun dse/path-from-nix (pkg)
  (substring (shell-command-to-string (concat "nix-build '<nixpkgs>' --no-build-output -A "
					      pkg))
	     0
	     -1))

(setq langtool-http-server-host "localhost"
      langtool-http-server-port 8081
      langtool-mother-tongue "pt-BR")

  ;; (defmacro dse/require-with-path (feature file-path)
  ;;   `(require ,feature
  ;; 	      ,(expand-file-name (concat user-emacs-directory
  ;; 					 "elisp/"
  ;; 					 file-path))))


(provide 'utils)
;;; utils.el ends here
