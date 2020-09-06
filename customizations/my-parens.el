(req-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(req-package smartparens
  :config (
	   (require 'smartparens-config)
	   (add-hook 'prog-mode-hook #'smartparens-mode)
	   (add-hook 'prog-mode-hook #'show-smartparens-mode)
	   ))
