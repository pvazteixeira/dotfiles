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
