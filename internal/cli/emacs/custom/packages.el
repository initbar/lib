(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(setq package-list
      '(
        ; doom-themes
        ; paradox
        ; sass-mode
        ; php-mode
        ; highlight-indent-guides
        auto-complete
        cython-mode
        dockerfile-mode
        go-mode
        json-mode
        linum-relative
        mark-multiple
        markdown-mode
        protobuf-mode
        py-autopep8
        rust-mode
        swoop
        terraform-mode
        toml-mode
        tramp
        yaml-mode
        ))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
