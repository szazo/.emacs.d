(require 'package)

; init package repos
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; get the package list if not already installed
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    magit
    projectile
    helm
    helm-projectile
    ))

; install not already installed packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

