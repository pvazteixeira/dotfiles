;; autopair
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

;; volatile-highlight - highlight buffer changes caused by undo/yank/etc
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; CEDET
(load "~/.emacs.d/setup-cedet.el")

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; company - autocomplete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;; (setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;; company-jedi
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; Helm
(load "~/.emacs.d/setup-helm.el")

;; other customizations
(load "~/.emacs.d/setup-base.el")
