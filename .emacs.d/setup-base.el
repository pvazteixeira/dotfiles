;; INDENTATION
(setq-default indent-tabs-mode nil) ; use spaces instead of tabs for indentation
(setq tab-width 2)                  ; 1 tab = 2 spaces

; k&r indentation, 2-space indentation
(setq c-default-style "linux"
      c-basic-offset 2)

(global-linum-mode t)       ; show line numbers
(setq linum-format " %d ")  ; with space around

;; use pdflatex instead of latex
(setq latex-run-command "pdflatex")

;; HIGHLIGHT
(global-hl-line-mode t)

;; BACKUP FILES
