 ;; If non-nil, Dired tries to guess a default target directory. This means: if there is a Dired buffer displayed in the next window, use its current directory, instead of this Dired buffer's current directory.
(setq dired-dwim-target t)

(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
;; (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))
