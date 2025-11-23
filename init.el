;; https://systemcrafters.net/advanced-package-management/using-straight-el/
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el for use-package expressions
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)


(straight-use-package '(project :type built-in))

(use-package magit)

;; auto complete with company
(use-package company)

;; docker
(use-package docker)

;; yaml editing
(use-package yaml-mode)
		
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/lib")

(load "my-company.el")
(load "my-tabs.el")
(load "my-parens.el")
(load "my-whitespace-visualizations.el")
(load "my-helm.el")
(load "my-projectile.el")
(load "my-helm-projectile.el")
(load "my-web-mode.el")
;(load "my-php.el")
(load "my-windows.el")
(load "my-typescript.el")
(load "my-themes.el")
(load "my-org.el")
(load "my-dired.el")
(load "my-fonts.el")
(load "my-python.el")
(load "my-ftp")
(load "my-latex")
(load "my-ledger")
(load "my-pt")
(load "my-nearley")
(load "my-evil")
(load "my-shell-path")
(load "my-dape")
(load "my-gptel")
(load "goto-chg")

;; (req-package-finish)

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
