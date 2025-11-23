(use-package gptel
  :config
  (setq
   gptel-model 'gemini-pro-latest
   gptel-backend (gptel-make-gemini "Gemini"
                                    :key "xxx"
                                    :stream t))
  )
