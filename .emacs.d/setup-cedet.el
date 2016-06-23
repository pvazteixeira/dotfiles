;; simple-setup from the cedet website
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)          ; enables global support for semantic db
(global-semantic-highlight-func-mode 1)   ; highlight the first line of the current tag
(global-semantic-stickyfunc-mode 1)       ; keep the first line of the current tag visible
;; (global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-scheduler-mode 1)   ; automatic parsing of source code in idle time
;; (global-semantic-idle-completions-mode 1) ; displaying of possible name completions
;; (global-semantic-idle-summary-mode 1)     ; info about the current tag

(semantic-mode 1)

;; (require 'ede)
;; (global-ede-mode t)
