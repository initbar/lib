; display current time
(display-time)

; hide menu bar
(menu-bar-mode -1)

; fix weird color escape sequences
(setq system-uses-terminfo nil)

; highlight over column 80
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

; highlight current line
;(global-hl-line-mode 1)
;(set-face-attribute 'region nil :background "#222" :foreground "#ff0000")

; match parenthesis
(show-paren-mode 1)
(electric-pair-mode 1)
(setq-default font-lock-multiline t)
(setq show-paren-style 'expression)
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 16 jit-lock-defer-contextually t jit-lock-stealth-nice 0.5)

; don't wrap long lines
(set-default 'truncate-lines t)
