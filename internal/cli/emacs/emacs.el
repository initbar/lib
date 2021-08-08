
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
