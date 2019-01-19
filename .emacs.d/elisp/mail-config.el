(with-eval-after-load 'sendmail
  (add-to-list 'auto-mode-alist '("/neomutt-.*" . mail-mode))
  (add-hook 'mail-mode-hook 'turn-on-auto-fill)
  (add-hook 'mail-mode-hook 'flyspell-mode)
  (define-key mail-mode-map (kbd "C-c C-c") 'mail-save-exit)
  (setq mail-header-separator "")
  (defun mail-save-exit ()
    "Save buffer and exits."
    (interactive)
    (save-buffer)
    (server-edit)))

(use-package mu4e
  :ensure nil
  :ensure-system-package mu)
(require 'mu4e)
(require 'mu4e-contrib)
(require 'smtpmail)

(setq message-send-mail-function	'smtpmail-send-it
      send-mail-function		'smtpmail-send-it
      smtpmail-starttls-credentials	'(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server	"smtp.gmail.com"
      smtpmail-smtp-server		"smtp.gmail.com"
      smtpmail-smtp-service		587
      smtpmail-debug-info		t
      mail-user-agent			'mu4e-user-agent

      mu4e-maildir				(expand-file-name "~/.mail/d.ebling8")
      mu4e-drafts-folder			"/[Gmail]/Rascunhos"
      mu4e-sent-folder				"/[Gmail]/E-mails enviados"
      mu4e-trash-folder				"/[Gmail]/Lixeira"
      mu4e-refile-folder			"/Archive"
      mu4e-change-filenames-when-moving		t
      mu4e-get-mail-command			"mbsync -a"
      mu4e-html2text-command			"w3m -T text/html"
      mu4e-update-interval			600
      mu4e-headers-auto-update			t
      mu4e-compose-signature-auto-include	nil
      mu4e-change-filenames-when-moving		t

      mu4e-maildir-shortcuts '(("/Inbox"			.	?i)
				("/[Gmail]/E-mails enviados"	.	?s)
				("/[Gmail]/Lixeira"		.	?l)
				("/[Gmail]/Rascunhos"		.	?d)
				("/[Gmail]/Todos os e-mails"	.	?a))
;; show images
      mu4e-show-images		t
      mu4e-view-show-images	t
      mu4e-view-show-addresses	t
      mu4e-html2text-command	'mu4e-shr2text
;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* Stuff is inherited from emacs/message-mode
      mu4e-reply-to-address	"d.ebling8@gmail.com"
      user-mail-address		"d.ebling8@gmail.com"
      user-full-name		"Denílson dos Santos Ebling")

(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))


;; don't save message to Sent Messages, IMAP takes care of this
					; (setq mu4e-sent-messages-behavior 'delete)

;; ;; spell check
;; (add-hook 'mu4e-compose-mode-hook
;;           (defun my-do-compose-stuff ()
;;             "My settings for message composition."
;;             (set-fill-column 72)
;;             (flyspell-mode)))

(use-package mu4e-alert
  :after mu4e
  :init
  (setq mu4e-alert-interesting-mail-query (concat "flag:unread maildir:/Inbox"))
  (mu4e-alert-enable-mode-line-display)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display))
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line))

(use-package org-mime)
(use-package htmlize)
(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "pre" "margin-left: 2em;")))

(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "blockquote" "border-left: 2px solid gray; padding-left: 4px;")))

(provide 'mail-config)
;;; mail-config.el ends here
