(req-package evil
  :require undo-tree
  :config
  (evil-mode 1)
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree)
  )
