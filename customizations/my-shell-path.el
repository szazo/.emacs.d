;; https://emacs.stackexchange.com/questions/34201/emacs-cant-find-node-when-node-was-installed-using-nvm
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))
