(use-package markdown-mode)

(use-package gptel
  :hook
  (gptel-mode . (lambda () (setq markdown-hide-markup t)))
  :config
  (setq
   gptel-model 'gemini-pro-latest
   gptel-backend (gptel-make-gemini "Gemini"
                                    :key (getenv "GEMINI_API_KEY")
                                    :stream t))
  )
