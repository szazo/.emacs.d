(req-package projectile
  :config (
           (projectile-global-mode)
           (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
           ))

