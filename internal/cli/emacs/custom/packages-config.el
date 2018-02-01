; swoop
(setq swoop-font-size: 0.9)

; auto-complete
(ac-config-default)

; lium
(require 'linum-relative)
(global-linum-mode)
(linum-relative-toggle)
; (setq linum-format " % 4d :: ")
(setq linum-relative-current-symbol "")

; tramp
(require 'tramp)
(setq tramp-default-method "scp")
