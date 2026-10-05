;; -*- lexical-binding: t; -*-
(use-package claude-code-ide
  :after vterm
  :straight (:type git :host github :repo "manzaltu/claude-code-ide.el")
  :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools


(defun agent-shell-antigravity-bootstrap (&optional force)
  "Download and install the latest Antigravity ACP server binary."
  (interactive "P")
  (let* ((arch (pcase (car (split-string system-configuration "-"))
                 ((or "x86_64" "amd64") "x86_64")
                 ((or "aarch64" "arm64") "aarch64")
                 (a a)))
         (os (pcase system-type ('darwin "darwin") ('windows-nt "windows") (_ "linux")))
         (platform (format "%s-%s" os arch))
         (install-dir (agent-shell-cache-dir "antigravity" platform))
         (bin-name (file-name-nondirectory (car agent-shell-antigravity-acp-command)))
         (bin-path (expand-file-name bin-name install-dir)))
    (unless (and (not force) (file-executable-p bin-path))
      (message "Antigravity: bootstrapping server for %s..." platform)
      (make-directory install-dir t)
      (let* ((reg-url "https://raw.githubusercontent.com/agentclientprotocol/registry/main/antigravity-acp/agent.json")
             (reg (with-temp-buffer
                    (url-insert-file-contents reg-url)
                    (json-parse-buffer :object-type 'alist)))
             (archive-url (map-nested-elt reg `(distribution binary ,(intern platform) archive)))
             (zip (expand-file-name "server.zip" install-dir)))
        (url-copy-file archive-url zip t)
        (call-process "unzip" nil nil nil "-o" "-q" zip "-d" install-dir)
        (delete-file zip)
        (set-file-modes bin-path #o755)))
    (setq agent-shell-antigravity-acp-command
          (cons bin-path (cdr agent-shell-antigravity-acp-command)))
    (message "Antigravity: using ACP server at %s" bin-path)
    bin-path))


(use-package agent-shell
  :straight t
  :bind ("C-c a p" . agent-shell-prompt-compose)
  :config
  (setq agent-shell-antigravity-authentication
        (agent-shell-antigravity-make-authentication :login t))
  (agent-shell-antigravity-bootstrap))
