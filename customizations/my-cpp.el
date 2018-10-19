;; https://www.emacswiki.org/emacs/UsingMakefileFromParentDirectory

(defun get-above-makefile () (expand-file-name
	   "Makefile" (loop as d = default-directory then (expand-file-name
	   ".." d) if (file-exists-p (expand-file-name "Makefile" d)) return
	   (shell-quote-argument d))))

;; bind compiling with get-above-makefile to f5
(global-set-key [f5] (lambda () (interactive) (compile (format
	   "make -f %s" (get-above-makefile)))))

;; company
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; hook
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
