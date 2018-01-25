(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(setq package-list
      '(
        auto-complete
        dockerfile-mode
        go-mode
        json-mode
        linum-relative
        paradox
        php-mode
        rust-mode
        swoop
        toml-mode
        ))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
