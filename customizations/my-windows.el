;; disable menubar and toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; disable the startup screen
(setq inhibit-startup-message t)

;; windows resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; switching between windows
(require 'windmove)
(windmove-default-keybindings 'meta)
