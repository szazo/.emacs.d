
;; info: https://vxlabs.com/2022/06/12/typescript-development-with-emacs-tree-sitter-and-lsp-in-2022/

'(flycheck-highlighting-mode (quote lines))
'(flycheck-indication-mode (quote right-fringe))

(req-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(req-package tree-sitter-langs
  :require tree-sitter)

(req-package typescript-mode
  :require tree-sitter
  :config
  ;; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
  ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
  (define-derived-mode typescriptreact-mode typescript-mode "TypeScript TSX")
  ;; use our derived mode for tsx files
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
  ;; by default, typescript-mode is mapped to the treesitter typescript parser
  ;; use our derived mode to map both .tsx AND .ts -> typescriptreact-mode -> treesitter tsx
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx))
)

(req-package tide
  :require web-mode vue-mode
  :config
  ;; (require 'lsp-sonarlint-typescript)
  (setq typescript-enabled t)
  (add-hook 'typescript-ts-mode-hook
            (lambda ()
              (lsp)
              (lsp-ui-mode)
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (tide-hl-identifier-mode +1)
              ;; company is an optional dependency. You have to
              ;; install it separately via package-install
              (company-mode)))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

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
