;; -*- lexical-binding: t; -*-
;; If non-nil, Dired tries to guess a default target directory. This means: if there is a Dired buffer displayed in the next window, use its current directory, instead of this Dired buffer's current directory.
(setq dired-dwim-target t)

;; Locale-independent, fixed-width dates. With LC_TIME=hu_HU the variable-width
;; month names + "20.26" times make `dired--align-all-files' loop forever on revert.
(setq dired-listing-switches "-al --time-style=long-iso")

(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
;;(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

(defun enable-dired-omit-mode () (dired-omit-mode 1))
(add-hook 'dired-mode-hook 'enable-dired-omit-mode)

(defun dired-dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	      (progn 
	        (set (make-local-variable 'dired-dotfiles-show-p) nil)
	        (message "h")
	        (dired-mark-files-regexp "^\\\.")
	        (dired-do-kill-lines))
	    (progn (revert-buffer) ; otherwise just revert to re-show
	           (set (make-local-variable 'dired-dotfiles-show-p) t)))))

(use-package dired-toggle-sudo)
