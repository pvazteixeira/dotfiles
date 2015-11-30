;;; load the package manager
(require 'package)

;;; add the MELPA repo to the package-archives variable
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; load and activate packages
(package-initialize)

;;; replace list-buffer with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; load monokai
(load-theme 'monokai t)

;;; enable ido minor mode
(ido-mode 1)

;;; show line numbers
(global-linum-mode t)
(setq linum-format "%d ")

;;; k&r indentation, 2-space indentation
(setq c-default-style "linux"
      c-basic-offset 2)

;;; AUCteX stuff
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
