;; -*- lexical-binding: t; -*-

(let ((file-name-handler-alist nil))

  (setq load-prefer-newer t
	xterm-query-timeout nil
	package-archives '(("org"       . "http://orgmode.org/elpa/")
			   ("gnu"       . "http://elpa.gnu.org/packages/")
			   ("melpa"     . "http://melpa.org/packages/"))
	fill-column 80
	vc-follow-symlinks t
	word-wrap t
	truncate-lines nil
	backup-directory-alist		'(("." . "~/.cache/emacs/backup/"))
	auto-save-file-name-transforms 	'((".*" "~/.cache/emacs/autosave/" t))
	delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t
	scroll-conservatively 100
	dired-dwim-target t
	show-trailing-whitespace t
	user-mail-address "d.ebling8@gmail.com"
	user-full-name "Denílson dos Santos Ebling"
	indent-tabs-mode nil
	custom-file "~/.emacs.d/custom.el"
	scroll-margin 5
;; package-quickstart t
	inhibit-x-resources t
	native-comp-async-report-warnings-errors nil)


  ;; (eval-when-compile
  ;;   (package-initialize))

  (defvar bootstrap-version)
  (let ((bootstrap-file
	 (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
	(bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	   'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

  (straight-use-package 'use-package)
  (setq straight-use-package-by-default t)
  (straight-use-package 'delight)

  ;; (unless (package-installed-p 'use-package)
  ;;   (package-refresh-contents)
  ;;   (progn
  ;;     (package-install 'use-package)
  ;;     (package-install 'delight)))
  (setq use-package-always-ensure t)

  ;; (eval-when-compile
  ;;   (require 'use-package))
  ;; (require 'delight)
  ;; (require 'bind-key)

  ;; (setq-default use-package-enable-imenu-support t)

  (set-charset-priority 'unicode)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)
	locale-coding-system   'utf-8)
  (set-terminal-coding-system  'utf-8)
  (set-keyboard-coding-system  'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system        'utf-8)

  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (save-place-mode 't)

  (global-so-long-mode 1)

  (column-number-mode 1)

  (defalias 'yes-or-no-p 'y-or-n-p)

  (set-register ?e '(file . "~/.emacs.d/init.el"))
  (set-register ?n '(file . "/etc/nixos/configuration.nix"))

  (use-package delight
    :config
    (delight '((abbrev-mode)
	       (auto-revert-mode)))
    (delight 'auto-revert-mode))

 (use-package autorevert
   :delight auto-revert-mode)

  (use-package which-key
    :delight
    :config (which-key-mode 1))

  (use-package undo-tree
    :delight
    :config
    (setq undo-tree-auto-save-history t
	  undo-tree-history-directory-alist `(("." . ,"/tmp/emacs/undo/"))
	  undo-tree-visualizer-timestamps t
	  undo-tree-visualizer-diff t
	  evil-undo-system 'undo-tree)
    (global-undo-tree-mode 1))

  (use-package recentf
    :config
    (setq recentf-save-file (recentf-expand-file-name "~/.cache/emacs/recentf"))
    (recentf-mode 1))

  (use-package try
    :defer t)

  (use-package page-break-lines
    :delight
    :config (global-page-break-lines-mode))

  (use-package doom-themes
    :defer t
    :defines display-line-numbers-type doom-gruvbox-dark-variant
    :hook ((term-mode   . dse/disable-line-numbers)
	   (eshell-mode . dse/disable-line-numbers)
	   (vterm-mode  . dse/disable-line-numbers)
	   (after-init  . dse/apply-theme)
	   (shell-mode  . dse/disable-line-numbers))
    :init
    (defun dse/apply-theme ()
      (setq doom-gruvbox-dark-variant "hard"
	    doom-gruvbox-light-variant "hard")
      (load-theme 'doom-gruvbox-light t)
      (doom-themes-org-config)
      (let ((font "JetBrains Mono"))
	(setq default-frame-alist `((vertical-scroll-bars)
				    (font . ,(concat font "-14"))))
	(set-face-attribute 'default            nil :font font :height 140)
	(set-face-attribute 'mode-line          nil :font font :height 100)
	(set-face-attribute 'mode-line-inactive nil :font font :height 100)
	;; (set-face-attribute 'default            nil :background "#111213")
	;; (set-face-attribute 'mouse              nil :background "white")
	;; (set-face-attribute 'default            nil :foreground "#3c3836")
	(set-face-attribute 'font-lock-constant-face nil :weight 'bold)

	(set-face-attribute 'font-lock-builtin-face nil :slant 'italic)

	(set-face-attribute 'font-lock-function-name-face nil
			    :weight 'bold
			    :slant 'italic)
	)  ; 5% darker
      (setq display-line-numbers-type 'relative)
      (scroll-bar-mode -1)
      (blink-cursor-mode -1)
      (global-hl-line-mode)
      (toggle-indicate-empty-lines)
      (global-display-line-numbers-mode))
    (defun dse/disable-line-numbers ()
      (display-line-numbers-mode -1)
      (setq-local scroll-margin 0)
      (setq-local indicate-empty-lines nil)))

  (global-set-key (kbd "C-x e") 'eshell)
  (global-set-key (kbd "C-x t") 'vterm)
  (global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)

  (setq dired-recursive-copies 'always
	dired-listing-switches "-alhv --group-directories-first"
	dired-hide-details-mode 't)

  (use-package general
    :config
    (general-create-definer leader-key
      :prefix "SPC")
    (leader-key
      :states 'normal
      :keymaps 'override
      "p"    project-prefix-map
      "gg" #'magit-status
      "ff" #'find-file
      "fr" #'ranger
      "x"  #'counsel-M-x
      "k"  #'kill-current-buffer
      "t"  #'counsel-semantic-or-imenu
      "b"  #'counsel-switch-buffer
      "mm" #'emms
      "mx" #'emms-pause
      "mX" #'emms-stop
      "mr" #'emms-random
      "mh" #'emms-seek-backward
      "mH" #'emms-next
      "ml" #'emms-seek-forward
      "mL" #'emms-previous
      "ea" #'eglot-code-actions))

  (use-package ranger
    :commands (ranger)
    :config
    (setq ranger-cleanup-eagerly t
	  ranger-parent-depth 0
	  ranger-max-preview-size 1
	  ranger-dont-show-binary t
	  ranger-preview-delay 0.040
	  ranger-excluded-extensions '("mkv" "iso" "mp4")))

  (use-package direnv
    :config
    (direnv-mode))

  (use-package langtool
    :config
    (setq langtool-http-server-host "localhost"
	  langtool-http-server-port 8081
	  langtool-default-language "pt-BR"
	  langtool-mother-tongue    "pt-BR"))

  (add-hook 'delete-terminal-functions 'recentf-save-list)

  (use-package poly-R)

  (require 'lang-general "/home/dse/.emacs.d/elisp/lang-general")
  (require 'completion-engine "/home/dse/.emacs.d/elisp/completion-engine")
  (require 'editing "/home/dse/.emacs.d/elisp/editing")
  (require 'lang-c "/home/dse/.emacs.d/elisp/lang-c")
  (require 'lang-clojure "/home/dse/.emacs.d/elisp/lang-clojure")
  (require 'lang-elisp "/home/dse/.emacs.d/elisp/lang-elisp")
  (require 'lang-go "/home/dse/.emacs.d/elisp/lang-go")
  (require 'lang-haskell "/home/dse/.emacs.d/elisp/lang-haskell")
  (require 'lang-java "/home/dse/.emacs.d/elisp/lang-java")
  (require 'lang-latex "/home/dse/.emacs.d/elisp/lang-latex")
  (require 'lang-markdown "/home/dse/.emacs.d/elisp/lang-markdown")
  (require 'lang-misc "/home/dse/.emacs.d/elisp/lang-misc")
  (require 'lang-nix "/home/dse/.emacs.d/elisp/lang-nix")
  (require 'lang-org "/home/dse/.emacs.d/elisp/lang-org")
  (require 'lang-python "/home/dse/.emacs.d/elisp/lang-python")
  (require 'lang-shell "/home/dse/.emacs.d/elisp/lang-shell")
  (require 'lang-sql "/home/dse/.emacs.d/elisp/lang-sql")
  (require 'lang-web "/home/dse/.emacs.d/elisp/lang-web")
  (require 'mail-config "/home/dse/.emacs.d/elisp/mail-config")
  (require 'project-management "/home/dse/.emacs.d/elisp/project-management")
  (require 'utils "/home/dse/.emacs.d/elisp/utils")
  (require 'window-management "/home/dse/.emacs.d/elisp/window-management")

  (require 'terraform "/home/dse/.emacs.d/elisp/terraform")

  (load "~/.emacs.d/custom.el" 'noerror))

(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))
