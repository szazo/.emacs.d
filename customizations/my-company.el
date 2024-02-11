(setq company-global-modes '(not python-ts-mode))
(add-hook 'after-init-hook 'global-company-mode)

 (global-set-key (kbd "M-SPC") 'company-complete-common)
