;; (global-whitespace-mode)

;; (setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-style (quote (spaces tabs space-mark tab-mark lines-tail face)))
(setq whitespace-line-column 120) ;; limit line length
(add-hook 'prog-mode-hook 'whitespace-mode)

;; (require 'column-marker)
;; (add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))
