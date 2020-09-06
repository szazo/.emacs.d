(req-package helm
  :config (
           ; helm generic functions
           (global-set-key (kbd "M-x") 'undefined)
           (global-set-key (kbd "M-x") 'helm-M-x)
           (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
           (global-set-key (kbd "C-x C-f") 'helm-find-files)

                                        ; enable global helm mode for common emacs commands
           (helm-mode 1)
           )
  )

