;; -*- lexical-binding: t; -*-

(use-package clojure-mode)

(use-package clojure-mode-extra-font-locking)

(use-package clojure-snippets
  :defer t
  :after cider)

(use-package cider
  :hook ((company-completion-started . custom/set-company-maps)
	 (company-completion-finished . custom/unset-company-maps)
	 (company-completion-cancelled . custom/unset-company-maps))
  :config
  (setq cider-repl-display-help-banner nil
	cider-repl-prompt-function #'cider-repl-prompt-abbreviated
	cider-repl-history-file (expand-file-name "~/.cache/emacs/cider_history"))

  (defun custom/unset-company-maps (&rest unused)
    "Set default mappings (outside of company).
    Arguments (UNUSED) are ignored."
    (general-def
      :states 'insert
      :keymaps 'override
      "<down>"  nil
      "<up>"    nil
      "RET"     nil
      [return]  nil
      "C-n"     nil
      "C-p"     nil
      "C-j"     nil
      "C-k"     nil
      "C-h"     nil
      "C-u"     nil
      "C-d"     nil
      "C-s"     nil
      "C-S-s"   nil
      "C-SPC"   nil
      "TAB"     nil
      [tab]     nil
      [backtab] nil))

  (defun custom/set-company-maps (&rest unused)
    "Set maps for when you're inside company completion.
     Arguments (UNUSED) are ignored."
    (general-def
      :states 'insert
      :keymaps 'override
      "<down>" #'company-select-next
      "<up>" #'company-select-previous
      "RET" #'company-complete
      [return] #'company-complete
      "C-w"     nil  ; don't interfere with `evil-delete-backward-word'
      "C-n"     #'company-select-next
      "C-p"     #'company-select-previous
      "C-h"     #'company-show-doc-buffer
      "C-u"     #'company-previous-page
      "C-d"     #'company-next-page
      "C-s"     #'company-filter-candidates
      "C-S-s"   #'counsel-company
      "C-SPC"   #'company-complete-common
      "TAB"     #'company-complete-common-or-cycle
      [tab]     #'company-complete-common-or-cycle
      [backtab] #'company-select-previous))
  (flycheck-clojure-setup) )

(use-package flycheck-clojure
  :defer t
  :commands (flycheck-clojure-setup)               ;; autoload
  :config
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(use-package flycheck-pos-tip
  :after flycheck)

(use-package clj-refactor
  :defer t
  :after cider)

(provide 'lang-clojure)
;;; lang-clojure.el ends here
