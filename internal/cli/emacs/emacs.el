
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")
(load-library "aliases")
(load-library "general")
(load-library "interface")
(load-library "packages")
(load-library "packages-config")
(load-library "shortcuts")
(load-library "syntax")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-peacock)))
 '(custom-safe-themes
   (quote
    ("151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "554b7f0439155d6eb648d4837ef03902f51124cacee021217e76f39e9dd314c2" "53d1bb57dadafbdebb5fbd1a57c2d53d2b4db617f3e0e05849e78a4f78df3a1b" "7666b079fc1493b74c1f0c5e6857f3cf0389696f2d9b8791c892c696ab4a9b64" "2a1b4531f353ec68f2afd51b396375ac2547c078d035f51242ba907ad8ca19da" "a866134130e4393c0cad0b4f1a5b0dd580584d9cf921617eee3fd54b6f09ac37" "4e21fb654406f11ab2a628c47c1cbe53bab645d32f2c807ee2295436f09103c6" "b2e1acc5cba1ea79e9b7fe18f09e8f69bee15c074910bc6b42f5728e7c5cdf88" "a142def5bab9c1d1964eb2bf7506e790fa09df44aa9f3e41abd198f00cd6577e" "b5ecb5523d1a1e119dfed036e7921b4ba00ef95ac408b51d0cd1ca74870aeb14" default)))
 '(package-selected-packages
   (quote
    (mark-multiple yaml-mode py-autopep8 sr-speedbar toml-mode swoop rust-mode php-mode paradox linum-relative json-mode go-mode dockerfile-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
