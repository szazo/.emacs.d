(req-package corfu
  :config
  (setq tab-always-indent 'complete)
  (global-corfu-mode)
)

(req-package eglot
  :config
  (setq major-mode-remap-alist '((python-mode . python-ts-mode)))
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
  ;; (add-hook 'python-ts-mode 'eglot-ensure)
  (add-hook 'pyvenv-post-activate-hooks 'eglot-ensure)
  
  ;; (setq-default eglot-workspace-configuration
  ;;               '((:pylsp . (:configurationSources ["flake8"] :plugins (:pycodestyle (:enabled nil) :mccabe (:enabled nil) :flake8 (:enabled t)))))))

  ;; :hook
  ;; ((python-ts-mode . eglot-ensure))
  )
;; :hook (
  ;; (add-hook 'foo-mode-hook 'eglot-ensure)
  ;; (python-ts-mode . 'eglot-ensure))

(req-package blacken
  :config
  (setq blacken-line-length 79)
)


;; (req-package ein)

; https://gist.github.com/habamax/290cda0e0cdc6118eb9a06121b9bc0d7

;; (add-to-list 'load-path (expand-file-name "pyenv.el/"))
;; (require 'pyenv)
;; (setq pyenv-modeline-function 'pyenv--modeline-plain)
;; (setq pyenv-modestring-prefix " ")
;; (setq pyenv-modestring-postfix nil)
;; (global-pyenv-mode)

;; (add-hook 'pyenv-mode-hook 'elpy-rpc-restart)
