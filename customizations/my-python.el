(use-package corfu
  :config
  (setq tab-always-indent 'complete)
  (global-corfu-mode)
)

(use-package pyvenv)

(use-package blacken
  :config
  (setq blacken-line-length 79)
)
