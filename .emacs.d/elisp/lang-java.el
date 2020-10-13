;; -*- lexical-binding: t; -*-

;;; Code:
(defconst jdt-jar-path "/home/dse/.emacs.d/jdt/plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.jar")
(defconst jdt-extra-jvm-args '("-noverify"
			       "-javaagent:/home/dse/.emacs.d/lombok.jar"
			       "-Xbootclasspath/a:/home/dse/.emacs.d/lombok.jar"
			       "--add-modules=ALL-SYSTEM"
			       "--add-opens"
			       "java.base/java.util=ALL-UNNAMED"
			       "--add-opens"
			       "java.base/java.lang=ALL-UNNAMED"))

(defun my-eclipse-jdt-contact (interactive)
    "Contact with the jdt server.
If INTERACTIVE, prompt user for details."
    (let* ((cp (getenv "CLASSPATH"))
	   (contact (unwind-protect (progn
				      (setenv "CLASSPATH" jdt-jar-path)
				      (eglot--eclipse-jdt-contact interactive))
		      (setenv "CLASSPATH" cp)))
	   (jdt-class (car contact))
	   (args (cddr contact)))
      (append (list jdt-class "/etc/jdk/jdk11/bin/java")
	      jdt-extra-jvm-args args)))

(defun dart-lsp-contact (interactive)
  (list (executable-find "dart")
        (concat (file-name-directory (nix-executable-find nil "dart"))
                "snapshots/analysis_server.dart.snapshot")
        "--lsp"
        "--client-id=emacs.eglot"))

(use-package dart-mode
  :hook (dart-mode . eglot-ensure))

(use-package flutter
  :after dart-mode
  :bind (:map evil-normal-state-map
              ("SPC r" . #'flutter-run-or-hot-reload)))


(use-package eglot
  :hook (java-mode . eglot-ensure)
  :functions eglot--eclipse-jdt-contact
  :config
  (add-to-list 'eglot-server-programs '(java-mode . my-eclipse-jdt-contact))
  (add-to-list 'eglot-server-programs '(dart-mode . dart-lsp-contact)))

(use-package java-snippets
  :defer t
  :after yasnippet)
(use-package javadoc-lookup)

(provide 'lang-java)
;;; lang-java.el ends here
