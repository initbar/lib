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
 '(package-selected-packages
   '(yaml-mode toml-mode terraform-mode swoop sass-mode rust-mode protobuf-mode markdown-mode linum-relative json-mode go-mode dockerfile-mode cython-mode auto-complete)))
(custom-set-faces)
(put 'downcase-region 'disabled nil)
