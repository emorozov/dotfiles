(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq evil-emacs-state-modes nil)
(setq evil-insert-state-modes nil)
(setq evil-motion-state-modes nil)
(require 'evil)
(evil-mode 1)

(set-face-attribute 'default nil :font "Iosevka Term" :height 120)
