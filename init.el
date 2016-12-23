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

		;; tabs
		dtrt-indent ; try adapt indentation style for the current buffer
		smart-tabs-mode

		;; auto complete with company
		company

		;; web-mode
		web-mode
		
		;; php
		php-mode
		flymake-php
		phpunit

		;; typescript
		tide

		;; docker
		docker

		;; yaml editing
		yaml-mode
		
		;; less
		less-css-mode

		;; sass
		scss-mode
		
		;; themes
		gotham-theme
		alect-themes

		;; parens
		rainbow-delimiters
		smartparens

		;; fill column
		column-marker
		))

;; install not already installed packages
(dolist (p my-packages)
	(when (not (package-installed-p p))
		(package-install p)))


(add-to-list 'load-path "~/.emacs.d/customizations")

(load "my-company.el")
(load "my-tabs.el")
(load "my-parens.el")
(load "my-whitespace-visualizations.el")
(load "my-helm.el")
(load "my-projectile.el")
(load "my-helm-projectile.el")
(load "my-web-mode.el")
(load "my-php.el")
(load "my-windows.el")
(load "my-typescript.el")
(load "my-themes.el")
(load "my-org.el")
(load "my-dired.el")
;; (load "my-mail.el")
(load "my-fonts.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "6bb466c89b7e3eedc1f19f5a0cfa53be9baf6077f4d4a6f9b5d087f0231de9c8" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "3ff96689086ebc06f5f813a804f7114195b7c703ed2f19b51e10026723711e33" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
