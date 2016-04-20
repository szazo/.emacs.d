(require 'package)

; init package repos
(add-to-list 'package-archives
						 '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; get the package list if not already installed
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    magit
    projectile
    helm
    helm-projectile

		;; auto complete with company
		company

		;; web-mode
		web-mode
		
		;; php
		php-mode
		flymake-php

		;; typescript
		tide
		
		;; themes
		reykjavik-theme
    ))

;; install not already installed packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(add-to-list 'load-path "~/.emacs.d/customizations")

(load "my-tabs.el")
(load "my-helm.el")
(load "my-projectile.el")
(load "my-helm-projectile.el")
(load "my-php.el")
(load "my-windows.el")
(load "my-typescript.el")
(load "my-themes.el")
