; swoop
(setq swoop-font-size: 0.9)

; auto-complete
(ac-config-default)
(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1))

; line number
(global-display-line-numbers-mode 1)

; tramp
(require 'tramp)
(setq tramp-default-method "scp")

; highlight-indentation
(setq highlight-indent-guides-method 'character)
