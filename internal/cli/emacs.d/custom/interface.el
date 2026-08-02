; display current time
(display-time)

; hide welcome screen
(setq inhibit-startup-screen t)

; hide menu bar
(line-number-mode -1)
(menu-bar-mode -1)

; fix weird color escape sequences
(setq system-uses-terminfo nil)

; highlight current line
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#f0f0f0")
;; (set-face-background 'hl-line "gray20")

; match parenthesis
(show-paren-mode 1)
(electric-pair-mode 1)
(setq-default font-lock-multiline t)
(setq show-paren-style 'expression)
(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 16 jit-lock-defer-contextually t jit-lock-stealth-nice 0.5)

; don't wrap long lines
(set-default 'truncate-lines t)
