(req-package nearley-mode
  :config (
;; Loads nearley-mode. Requires "nearley-mode.el" to be on the load-path.
;; (require 'nearley-mode)

;; Sets nearley-mode to be the default for .ne files
(add-to-list 'auto-mode-alist '("\\.ne\\'" . nearley-mode))

	   ))

