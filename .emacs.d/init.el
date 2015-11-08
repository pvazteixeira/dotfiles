;;; load the package manager
(require 'package)

;;; add the MELPA repo to the package-archives variable
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; load and activate packages
(package-initialize)

;;; enable evil mode
(require 'evil)
(evil-mode t)
