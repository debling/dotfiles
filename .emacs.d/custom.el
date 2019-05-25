(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#81a2be" "#c5c8c6"])
 '(ansi-term-color-vector
   [unspecified "#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#586e75"] t)
 '(beacon-color "#dc322f")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(gdb-many-windows t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#41728e"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(magit-commit-arguments (quote ("--verbose" "--gpg-sign=CCBC8AA1AF062142")))
 '(magit-diff-use-overlays nil)
 '(magit-remote-arguments (quote ("-f")))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("/home/dse/Org/Agenda/AFazeres.org")))
 '(package-selected-packages
   (quote
    (company-anaconda pip-requirements live-py-mode anaconda-mode ess js2-mode restclient-test company-restclient nix-update nix-sandbox nix-sanbox nix-buffer nix-bufer company-nixos-options company-nix-options editorconfig helm-nixos-options nix-mode evil-collection zoom magit counsel-projectile impatient-mode company-web emmet-mode tide typescript-mode sql-indent sqlup-mode company-shell geiser openwith htmlize org-bullets edit-indirect company-auctex lsp-java hindent intero haskell-mode olivetti nlinum-relative rainbow-delimiters company-statistics yasnippet-snippets dap-mode company-lsp lsp-ui eros common-lisp-snippets flycheck-clojure cider clojure-snippets clojure-mode-extra-font-locking clojure-mode ccls xclip auto-sudoedit evil-mc avy evil-smartparens evil-org evil counsel-gtags counsel ivy-xref dashboard solarized-theme page-break-lines try undo-tree which-key auto-compile web-mode-edit-element company-php plantuml-mode company-go slime-company sendmode use-package-ensure-system-package org-projectile persp-projectile use-package async delight dap-java edit-inditect doom-thems flucheck-clojure clojure-mode-extra-font-lock litable color-theme-solarized auctex-latexmk php-auto-yasnippets company-reftex company-bibtex auctecx ac-html-bootstrap ac-html-angular common-lispcommon-lisp-snippets whitch-key nasm-mode dracula base16-themes graphviz-dot-mode org-pdfview org-ref flyspell-popup helm-themes phpunit ac-php ggtags disaster company-elisp sudo-edit org-plus-contrib helm-gtags dracula-theme diminish company-c-headers)))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Source Code pro" :slant normal :weight normal :height 1.0 :width normal))))
 '(mode-line ((t (:underline nil))))
 '(mode-line-inactive ((t (:underline nil))))
 '(org-document-title ((t (:inherit default :weight bold :font "Source Sans pro" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :font "Source Sans pro" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :font "Source Sans pro" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :font "Source Sans pro" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :font "Source Sans pro" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :font "Source Sans pro"))))
 '(org-level-6 ((t (:inherit default :weight bold :font "Source Sans pro"))))
 '(org-level-7 ((t (:inherit default :weight bold :font "Source Sans pro"))))
 '(org-level-8 ((t (:inherit default :weight bold :font "Source Sans pro"))))
 '(persp-selected-face ((t (:foreground "foreground" :italic t :underline t))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 110 :weight normal)))))
