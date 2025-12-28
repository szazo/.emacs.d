(use-package docstr
  :config
  (global-docstr-mode 1)
  (setq docstr-key-support t)
  (setq docstr-python-style 'google)
  (add-to-list 'docstr-python-modes 'python-ts-mode)
  (add-to-list 'docstr-writers-alist '(python-ts-mode . docstr-writers-python))
  )
