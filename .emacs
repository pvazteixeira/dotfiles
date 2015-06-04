;; Enable MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;The packages that you install with package.el are activated by default after your .emacs is loaded. 
;; To be able to use them before the end of your .emacs you need to activate them by using the commands:
(setq package-enable-at-startup nil)
(package-initialize)

;; Set theme
(load-theme 'monokai t)

;; No ~ files clutter
(setq make-backup-files nil)

;; tabs are spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Set Linum-Mode on
;; (global-linum-mode 1)

;; standard cut copy paste undo stuff
(cua-mode 1)
