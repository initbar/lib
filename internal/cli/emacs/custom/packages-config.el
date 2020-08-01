; swoop
(setq swoop-font-size: 0.9)

; auto-complete
(ac-config-default)

; line number
(global-linum-mode)

; line number (relative)                                        ;
; (require 'linum-relative)
; (linum-relative-toggle)
; (setq linum-relative-current-symbol "->")

; tramp
(require 'tramp)
(setq tramp-default-method "scp")

; highlight-indentation
(setq highlight-indent-guides-method 'character)
