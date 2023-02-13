(req-package elpy
  :config
  (elpy-enable)
  (setq elpy-rpc-python-command "python3")
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)

  ;; Use IPython for REPL
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter"))

(req-package blacken)
(setq blacken-line-length 79)

(req-package ein)

(add-to-list 'load-path (expand-file-name "pyenv.el/"))
(require 'pyenv)
(setq pyenv-modeline-function 'pyenv--modeline-plain)
(setq pyenv-modestring-prefix " ")
(setq pyenv-modestring-postfix nil)
(global-pyenv-mode)

(add-hook 'pyenv-mode-hook 'elpy-rpc-restart)
