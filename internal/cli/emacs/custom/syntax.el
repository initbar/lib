; syntax highlight
(global-font-lock-mode 1)

(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)

; tabs/spaces
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq standard-indent 4)

; indentation
(setq c-basic-offset 2)
(setq coffee-tab-width 2)
(setq css-indent-offset 2)
(setq javascript-indent-level 2)
(setq js-indent-level 2)
(setq perl-indent-level 2)
(setq sh-basic-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-markup-indent-offset 2)

; indentation (python)
(add-hook
 'python-mode-hook
 '(lambda ()
    (setq python-indent 4)))

; indentation (json)
(add-hook
 'json-mode-hook
 (lambda ()
   (make-local-variable 'js-indent-level)
   (setq js-indent-level 4)))

; custom highlighting
;; (add-hook
;;  'after-change-major-mode-hook
;;  '(lambda ()
;;     (font-lock-add-keywords
;;      nil
;;      '(("\\([0-9*&|()<>{}$?/,.]+\\)"
;;         1
;;         font-lock-warning-face prepend)))))

; ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
