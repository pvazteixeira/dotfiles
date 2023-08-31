;; all org-related config
(with-eval-after-load 'org

  (setq org-directory "~/org/"
        org-default-notes-file "~/org/inbox.org")
  (defvar org-default-diary-file "~/org/diary.org")

  ;; agenda
  (setq org-agenda-include-diary t)
  (setq org-agenda-files (quote ("~/org")))
  (setq org-agenda-start-on-weekday 1)
  (setq org-agenda-sticky t) ;; ?
  (setq org-agenda-skip-scheduled-if-done t);; don't show scheduled tasks that have been completed

  (setq org-log-into-drawer t) ;; log clock inside drawer.


  ;; roam
  (setq org-roam-directory "~/org/")

  ;;(setq org-deadline-warning-days 0)

  ;; wrap lines
  (setq org-startup-truncated nil)

  ;; org-habit
  ;; (add-to-list 'org-modules 'org-habit)

  ;; capture
  (setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline org-default-notes-file "Tasks" )
           "* TODO %?\n:LOGBOOK:\n:CREATED: %U\n:END:\n %i\n %a\n")
          ("a" "Appointment" entry (file+datetree+prompt  "~/org/journal.org" )
           "* %?\n %T\n %^{LOCATION}p %i\n %a\n")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\n Entered on %T\n  %a\n")
          ("n" "Notes" entry (file+headline org-default-notes-file "Notes")
           "* NOTE %?\n Entered on %T\n %i\n %a\n")
          ;; notes -
          ;; ("n" "Note" entry (file+headline org-default-notes-file "Notes")
          ;;  "* %?\n %T\n %a\n")
          )
        )

  (setq org-todo-keywords
        '(
          ; sequences borrowed from doom emacs <3
          (sequence
           ; ! time stamp entry (/! for exit)
           ; @ time stamp and note (/@ for exit)
           "TODO(t!)"  ; A task that needs doing & is ready to do
           "PROJ(p!)"  ; A project, which usually contains other tasks
           "LOOP(r!)"  ; A recurring task
           "ACTV(a!)"  ; A task that is in progress
           "WAIT(w@)"  ; Something external is holding up this task
           "HOLD(h@)"  ; This task is paused/on hold because of me
           "IDEA(i!)"  ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d!)"  ; Task successfully completed
           "DROP(k@)"  ; Task was cancelled, aborted or is no longer applicable
           )
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](H)"   ; Task is being held up or paused
           "|"
           "[X](D)")  ; Task was completed
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)")
          (sequence
           "WEEK(W)"   ;
           "MNTH(M)"   ;
           "YEAR(Y)"   ;
           )
          (sequence
           "MEET(e@)"     ;; a meeting
           "|"
           "NOTE(n)"      ;; once a meeting is done, leave it as a note
           )
          ;; (sequence
          ;;  "TODO(t!)"   ;; uh
          ;;  "NEXT(n!)"   ;; top of the queue
          ;;  "WAIT(w@/!)" ;; todo, waiting on something/someone
          ;;  "HOLD(h@)"   ;; on hold - not yet/need to think about it a bit more
          ;;  "|"
          ;;  "DONE(d!)"   ;; yay
          ;;  "DROP(c@/!)" ;; not gonna happen (keep as note/record)
          ;;  )
          ;; (sequence "WAIT(w)" "INACTIVE(i)" "|" "CANCELLED(c)" "MEETING(m)" )
          ;; (sequence "ISSUE(i!)" "KNOWNCAUSE(k!)" "|" "FIXED(f!)")
          )
        ) ;; 

  (setq org-todo-keyword-faces '(
                                 ;; see also: list-colors-display
                                 ;; ("NEXT" . (:background "#c5283d" :foreground "white" :weight 'bold)) ;; red = immediate attention
                                 ("TODO" . (:background "#d1193e" :foreground "white" :weight bold)) ;; red = immediate attention
                                 ("WEEK" . (:background "#ee3e38" :foreground "white" :weight bold)) ;; yellow = warning
                                 ("MNTH" . (:background "#f86e51" :foreground "black" :weight bold)) ;; yellow = warning
                                 ("YEAR" . (:background "#fba465" :foreground "black" :weight bold)) ;; amber
                                 ("HOLD" . (:background "#f2c85b" :foreground "black" :weight bold)) ;; blue = mandatory action (revisit)
                                 ("MEET" . (:background "#3a0751" :foreground "white" :weight bold)) ;;
                                 ("DONE" . (:background "forest green" :foreground "white" :weight bold))
                                 ("DROP" . (:background "dim gray" :foreground "white" :weight bold))
                                 ("NOTE" . (:background "dim gray" :foreground "white" :weight bold))
                                 ))

  ;; refile
  ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9)))
        ;; Allow refile to create parent tasks with confirmation
        org-refile-allow-creating-parent-nodes 'confirm
        )
)
