;; -*- lexical-binding: t; -*-

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :config (use-package edit-indirect))

(use-package markdownfmt)

(use-package markdown-mode+)

(use-package markdown-toc)

(provide 'lang-markdown)
;;; lang-markdown.el ends here
