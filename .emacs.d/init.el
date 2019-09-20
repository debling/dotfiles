;; -*- lexical-binding: t; -*-


(let ((file-name-handler-alist nil)
      (gc-cons-threshold most-positive-fixnum))


  (package-initialize)

  (setq load-prefer-newer t
	xterm-query-timeout nil
	package--init-file-ensured t
	package-enable-at-startup nil
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
	scroll-margin 5)

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (setq-default use-package-always-ensure t)

  (eval-when-compile
    (require 'use-package))
  (require 'delight)
  (require 'bind-key)

  (add-to-list 'load-path (expand-file-name (concat user-emacs-directory "elisp")))
  (add-to-list 'term-file-aliases '("st-256color" . "xterm"))

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

  (column-number-mode 1)

  (defalias 'yes-or-no-p 'y-or-n-p)

  (set-register ?e '(file . "~/.emacs.d/init.el"))
  (set-register ?n '(file . "/etc/nixos/configuration.nix"))

  (use-package delight
    :config
    (delight 'abbrev-mode nil 'abbrev))

  (use-package auto-compile
    :config
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode))

  (use-package which-key
    :delight
    :config (which-key-mode 1))

  (use-package undo-tree
    :delight
    :config
    (setq undo-tree-auto-save-history t
	  undo-tree-history-directory-alist `(("." . ,"/tmp/emacs/undo/"))
          undo-tree-visualizer-timestamps t
          undo-tree-visualizer-diff t)
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

  (use-package leuven-theme
    :config
    (load-theme 'leuven t)
    (scroll-bar-mode -1)
    (add-to-list 'default-frame-alist '(font . "Source Code pro-16"))
    (toggle-indicate-empty-lines))

  (global-set-key (kbd "C-x e") 'eshell)

  (require 'editing)
  (require 'completion-engine)

  (require 'lang-c)
  (require 'lang-clojure)
  (require 'lang-commonlisp)
  (require 'lang-elisp)
  (require 'lang-erlang)
  (require 'lang-general)
  (require 'lang-go)
  (require 'lang-haskell)
  (require 'lang-java)
  (require 'lang-latex)
  (require 'lang-markdown)
  (require 'lang-nix)
  (require 'lang-org)
  (require 'lang-python)
  (require 'lang-scheme)
  (require 'lang-shell)
  (require 'lang-sql)
  (require 'lang-web)
  (require 'lang-misc)

  (require 'project-management)
  (require 'window-management)

  (require 'mail-config)

  (load "~/.emacs.d/custom.el" 'noerror))
