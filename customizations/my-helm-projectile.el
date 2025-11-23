(use-package helm-projectile
  :after (helm projectile)
  :config
  (helm-projectile-on)
  (global-set-key (kbd "C-c p h") 'helm-projectile)
  )

