;; ===== MELPA init =====

;; load the package manager
(require 'package)

;; add the melpa package repo to the package-archives variable
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;; load and activate packages
(package-initialize)


;; ===== Packages to be installed =====
(setq required-package-list
      '(monokai-theme
	helm
	))

;;;
(when (not package-archive-contents)
  (package-refresh-contents))

;;; install missing packages
(dolist (package required-package-list)
  (when (not (package-installed-p package))
    (package-install package)))
      
	
