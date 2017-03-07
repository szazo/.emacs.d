(use-package ledger-mode
	:ensure t
	:init
	(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
	(setq ledger-post-auto-adjust-amounts 'true)
	)
