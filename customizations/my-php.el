(req-package flymake-php
  :config
  (add-hook 'php-mode-hook 'flymake-php-load)
  )

(req-package php-mode
  :require web-mode
  :config
  ;; configure web-mode
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\."))
        ))

(req-package phpunit
  :config
  (add-hook 'php-mode-hook (lambda()
                             ;; phpunit keyboard mapping
                             (local-set-key (kbd "C-x t") 'phpunit-current-test)
                             (local-set-key (kbd "C-x c") 'phpunit-current-class)
                             (local-set-key (kbd "C-x p") 'phpunit-current-project)))
  )
