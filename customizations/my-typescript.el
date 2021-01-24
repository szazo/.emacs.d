'(flycheck-highlighting-mode (quote lines))
'(flycheck-indication-mode (quote right-fringe))

(req-package tide
  :require web-mode vue-mode
  :config
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

  ;; https://github.com/AdamNiederer/vue-mode/issues/74
  (setq mmm-typescript-mode-enter-hook (lambda ()
                                         ;; (message "Enter hook")
                                         (setq syntax-ppss-table nil)))

  ;; https://github.com/ananthakumaran/tide/issues/400
  (setq mmm-typescript-mode-submode-hook (lambda()
                                           ;; (message "Submode hook")
                                           (tide-setup)
                                           ;; (flycheck-mode +1)
                                           ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
                                           (eldoc-mode +1)
                                           (tide-hl-identifier-mode +1)
                                           ;; company is an optional dependency. You have to
                                           ;; install it separately via package-install
                                           (company-mode)))


  ;; https://github.com/Simplify/flycheck-typescript-tslint
  ;; https://github.com/AdamNiederer/vue-mode/issues/15
  ;; (add-hook 'vue-mode-hook (flycheck-select-checker 'javascript-eslint))
  ;; (setq mmm-vue-html-mode-exit-hook (lambda ()
  ;;                                     (message "Run when leaving vue-html mode")
  ;;                                     (emmet-mode -1)))
  ;; (setq mmm-vue-html-mode-enter-hook (lambda ()
  ;;                                      (message "Run when entering vue-html mode")
  ;;                                      (emmet-mode 1)))
  ;; https://www.reddit.com/r/emacs/comments/fws0yi/vue_js_webdev_and_emacs/
)


;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
;; (setq js-doc-mail-address "your email address"
;;        js-doc-author (format "your name <%s>" js-doc-mail-address)
;;        js-doc-url "url of your website"
;;        js-doc-license "license name")

;; (add-hook 'typescript-mode-hook
;;            #'(lambda ()
;;                (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
;;                (define-key js2-mode-map "@" 'js-doc-insert-tag)))
