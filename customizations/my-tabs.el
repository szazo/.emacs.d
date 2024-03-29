;; disable tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default typescript-expr-indent-offset 4)
(setq-default web-mode-code-indent-offset 2)
(setq-default web-mode-markup-indent-offset 2)
(setq-default web-mode-attr-indent-offset 2)

;; enable mode which can detect indentation for the file and adapt settings to that
(req-package dtrt-indent
  :config (dtrt-indent-mode))

;(req-package smart-tabs-mode)
