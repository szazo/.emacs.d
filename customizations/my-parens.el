(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)
(add-hook 'prog-mode-hook #'show-smartparens-mode)
