;;; use spaces instead of tabs for indentation
(setq-default indent-tabs-mode nil)
;;; 1 tab = 2 spaces
(setq tab-width 2)

 ;;; show line numbers
(global-linum-mode t)
(setq linum-format "%d ")

 ;;; k&r indentation, 2-space indentation
(setq c-default-style "linux"
      c-basic-offset 2)


;; use pdflatex instead of latex
(setq latex-run-command "pdflatex")
