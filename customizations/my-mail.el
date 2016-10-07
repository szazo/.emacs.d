(require 'mu4e)
(setq mu4e-maildir (expand-file-name "~/email/neting"))

(setq mu4e-drafts-folder "/INBOX.Drafts")
(setq mu4e-sent-folder   "/INBOX.Sent")
(setq mu4e-trash-folder  "/INBOX.Trash")
;; (setq message-signature-file "~/.emacs.d/.signature") ; put your signature in this file

; get mail
;; (setq mu4e-get-mail-command "mbsync -c ~/.emacs.d/.mbsyncrc work"
(setq mu4e-get-mail-command "offlineimap"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil)

;; show images
(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq mu4e-reply-to-address "szazo@neting.hu"
    user-mail-address "szazo@neting.hu"
    user-full-name  "Szarvas Zoltán")

;; don't save message to Sent Messages, IMAP takes care of this
; (setq mu4e-sent-messages-behavior 'delete)

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))

