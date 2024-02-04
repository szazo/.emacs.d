(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

(require-package 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)

(use-package req-package
  :ensure t
  :config (req-package--log-set-level 'debug))

(require 'req-package)

;; Disabled el-get
;; (use-package use-package-el-get
;;   :ensure t)
;; (req-package use-package-el-get ;; prepare el-get support for use-package (optional)
;;   :force t ;; load package immediately, no dependency resolution
;;   :config
;;   (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
;;   (el-get 'sync))
;;   (use-package-el-get-setup))


(req-package magit)
;(req-package projectile)
;(req-package helm)
;(req-package helm-projectile)

;; auto complete with company
(req-package company)

;; docker
(req-package docker)

;; yaml editing
(req-package yaml-mode)
		
;; less
(req-package less-css-mode)

;; sass
(req-package scss-mode)

;; weather
(req-package wttrin)
		
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
(load "my-lsp")
;; (load "my-sonarlint")
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
;(load "my-python.el")
(load "my-ftp")
(load "my-latex")
(load "my-ledger")
(load "my-irony")
;(load "my-rtags")
(load "my-pt")
(load "my-processing")
(load "my-rust")
(load "my-nearley")
(load "my-wakatime")
(load "my-evil")
(load "my-shell-path")
(load "goto-chg")

(req-package-finish)

;; (advice-add 'risky-local-variable-p :override #'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d4f8fcc20d4b44bf5796196dbeabec42078c2ddb16dcb6ec145a1c610e0842f3" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
