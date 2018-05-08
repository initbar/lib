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

; sr-speedbar
;; (require 'sr-speedbar)
;; (setq sr-speedbar-right-side nil)
;; (setq speedbar-show-unknown-files t)

; py-autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
; ~$ pip install autopep8
