(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)


(req-package corfu
  :config
  (setq tab-always-indent 'complete)
  (global-corfu-mode)
)

(req-package eglot
  :config
  (setq treesit-language-source-alist
        '((python . ("https://github.com/tree-sitter/tree-sitter-python"))
          ))
  (treesit-install-language-grammar 'python)
  (setq major-mode-remap-alist '((python-mode . python-ts-mode)))
  ;; (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pyright-langserver" "--stdio")))
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


(req-package dape
  ;; :preface
  ;; By default dape shares the same keybinding prefix as `gud'
  ;; If you do not want to use any prefix, set it to nil.
  ;; (setq dape-key-prefix "\C-x\C-a")

  ;; :hook
  ;; Save breakpoints on quit
  ;; (kill-emacs . dape-breakpoint-save)
  ;; Load breakpoints on startup
  ;; (after-init . dape-breakpoint-load)

  :config
  ;; Turn on global bindings for setting breakpoints with mouse
  (dape-breakpoint-global-mode)

  (add-to-list 'dape-configs
               `(debugpy-jax
                 modes (python-ts-mode python-mode)
                 command " /home/szazo/.envs/jax/bin/python"
                 command-args ("-m" "debugpy.adapter" "--host" "0.0.0.0")
                 :type "executable"
                 :request "launch"
                 :cwd dape-cwd
                 :program dape-buffer-default
                 )
               )

 (add-to-list 'dape-configs
               `(debugpy-glider
                 modes (python-ts-mode python-mode)
                 command "/home/szazo/.envs/glider_tianshou_upgrade/bin/python"
                 command-args ("-m" "debugpy.adapter" "--host" "0.0.0.0")
                 :type "executable"
                 :request "launch"
                 :cwd dape-cwd
                 :program dape-buffer-default
                 )
               )

  ;; Info buffers to the right
  (setq dape-buffer-window-arrangement 'right)

  (setq dape-debug t)

  ;; Info buffers like gud (gdb-mi)
  ;; (setq dape-buffer-window-arrangement 'gud)
  ;; (setq dape-info-hide-mode-line nil)

  ;; Pulse source line (performance hit)
  (add-hook 'dape-display-source-hook 'pulse-momentary-highlight-one-line)

  ;; Showing inlay hints
  (setq dape-inlay-hints t)

  ;; Save buffers on startup, useful for interpreted languages
  ;; (add-hook 'dape-start-hook (lambda () (save-some-buffers t t)))

  ;; Kill compile buffer on build success
  ;; (add-hook 'dape-compile-hook 'kill-buffer)

  ;; Projectile users
  ;; (setq dape-cwd-function 'projectile-project-root)
  )

;; Enable repeat mode for more ergonomic `dape' use
(req-package repeat
  :config
  (repeat-mode))

;; (req-package ein)

; https://gist.github.com/habamax/290cda0e0cdc6118eb9a06121b9bc0d7

;; (add-to-list 'load-path (expand-file-name "pyenv.el/"))
;; (require 'pyenv)
;; (setq pyenv-modeline-function 'pyenv--modeline-plain)
;; (setq pyenv-modestring-prefix " ")
;; (setq pyenv-modestring-postfix nil)
;; (global-pyenv-mode)

;; (add-hook 'pyenv-mode-hook 'elpy-rpc-restart)
