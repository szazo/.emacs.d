(req-package ledger-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
  (setq ledger-post-auto-adjust-amounts 'true)
  )
