(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(setq package-list
      '(
        auto-complete
        cython-mode
        dockerfile-mode
        json-mode
        linum-relative
        markdown-mode
        protobuf-mode
        rust-mode
        sass-mode
        swoop
        terraform-mode
        toml-mode
        tramp
        yaml-mode
        ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
