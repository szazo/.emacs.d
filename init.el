(require 'package)

; init package repos
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

; get the package list if not already installed
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
	'(
		use-package

    req-package
		
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
		material-theme

		;; parens
		rainbow-delimiters
		smartparens

		;; python
		elpy

		;; weather
		wttrin

    ;; wakatime
    wakatime-mode
		))

;; install not already installed packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq use-package-always-ensure t)

(require 'req-package)
(req-package el-get ;; prepare el-get (optional)
  :force t ;; load package immediately, no dependency resolution
  :config
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
  (el-get 'sync))

;;(req-package--log-open-log)

(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/lib")

(load "my-flycheck.el")
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
(load "my-cpp.el")
(load "my-wttrin.el")
(load "my-python.el")
(load "my-ftp")
(load "my-latex")
(load "my-ledger")
(load "my-irony")
(load "my-rtags")
(load "my-pt")

(req-package-finish)

(global-wakatime-mode)
