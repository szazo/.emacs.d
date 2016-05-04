(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; phpunit keyboard mapping
(add-hook 'php-mode-hook (lambda()
													 (setq indent-tabs-mode t)
													 (local-set-key (kbd "C-x t") 'phpunit-current-test)
													 (local-set-key (kbd "C-x c") 'phpunit-current-class)
													 (local-set-key (kbd "C-x p") 'phpunit-current-project)))

;; configure web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
)
