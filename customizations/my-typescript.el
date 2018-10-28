'(flycheck-highlighting-mode (quote lines))
'(flycheck-indication-mode (quote right-fringe))

(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
             (tide-hl-identifier-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode)))

;; Tide can be used along with web-mode to edit tsx files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (tide-hl-identifier-mode +1)
              (company-mode))))

;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
;; (setq js-doc-mail-address "your email address"
;;        js-doc-author (format "your name <%s>" js-doc-mail-address)
;;        js-doc-url "url of your website"
;;        js-doc-license "license name")

;; (add-hook 'typescript-mode-hook
;;            #'(lambda ()
;;                (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
;;                (define-key js2-mode-map "@" 'js-doc-insert-tag)))
