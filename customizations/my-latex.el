;; (req-package tex-site
;; ;;  :defer t
;;   ;; :ensure t
;;   :config
;;   (progn
;;     ;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;     ;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;     ;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;  	(setq TeX-auto-save t)
;;     (setq TeX-parse-self t)
;;     (setq-default TeX-master nil)

;;     (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;     (setq reftex-plug-into-AUCTeX t)
;;     (setq-default TeX-engine 'xetex)

;;     ;; (add-to-list 'TeX-command-list
;;     ;;              '("XeLaTeX" "xelatex --shell-escape -interaction=nonstopmode %s"
;;     ;;                TeX-run-command t t :help "Run xelatex") t)
;;     ;; (setq-default TeX-engine 'xetex)
;;   )
;; )

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
				'("XeLaTeX" "xelatex --shell-escape -interaction=nonstopmode %s"
				    TeX-run-command t t :help "Run xelatex") t))
(setq-default TeX-engine 'xetex)

(req-package company-auctex
  :require company
  :config
  (progn
    (company-auctex-init)
    )
)


;; (req-package preview-latex

;; )

;; (setq-default TeX-engine 'xetex)
;; (setq-default TeX-PDF-mode t)

;; (eval-after-load "tex"
;;   '(add-to-list 'TeX-command-list
;; 				'("XeLaTeX" "xelatex --shell-escape -interaction=nonstopmode %s"
;; 				    TeX-run-command t t :help "Run xelatex") t))
