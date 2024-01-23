;;; org.el -*- lexical-binding: t; -*-

(after! org

  ;; org-capture key bindings
  (map!
   :map org-capture-mode-map
      :localleader
      "," #'org-capture-finalize
      "k" #'org-capture-kill
      )

  (map!
   :map org-agenda-mode-map
   :localleader
   (:prefix ("v" . "view")
     "d" #'org-agenda-day-view
     "w" #'org-agenda-week-view
     "m" #'org-agenda-month-view
     "y" #'org-agenda-year-view
   )
   ;; views
   )

  (setq org-agenda-include-diary t)
  (setq org-agenda-start-on-weekday 1)
  (setq org-agenda-sticky t) ;;  hide the agenda buffer with 'q' instead of killing it
  (setq org-agenda-skip-scheduled-if-done t)  ;; don't show scheduled tasks that have been completed
  (setq org-agenda-skip-deadline-if-done t)  ;; don't show deadline tasks that have been completed

  ;; keep track of changes
  (setq org-log-into-drawer t     ;; log clock inside drawer.
        org-log-done 'time
        org-log-redeadline 'time
        org-log-reschedule 'time
        )

  ;; capture templates
  (setq org-capture-templates '(
    ;; PERSONAL
    ;; from  doom
  ("t" "Personal todo" entry
   (file+headline +org-capture-todo-file "Inbox")
   "* TODO %?\n:logbook:\n:created: %U\n:end:\n %i\n %a\n" :prepend t)

 ("n" "Personal notes" entry
  (file+headline +org-capture-notes-file "Inbox")
  "* %u %?\n%i\n%a" :prepend t)

 ("b" "Bookmark" entry (file+headline "~/org/bookmarks.org" "Inbox")
 "* %a\n:logbook:\n:created: %U\n on %T\n:end:\n - %?\n:quote:\n%i\n:end:\n")

 ("j" "Journal" entry
  (file+olp+datetree +org-capture-journal-file)
  "* %U %?\n %i\n%a\n" :prepend t)
    ;;
    ;;
    ;;
 ;; projects (copied from doom)
 ("p" "Templates for projects")
 ("pt" "Project-local todo" entry
  (file+headline +org-capture-project-todo-file "Inbox")
  "* TODO %?\n%i\n%a" :prepend t)
 ("pn" "Project-local notes" entry
  (file+headline +org-capture-project-notes-file "Inbox")
  "* %U %?\n%i\n%a" :prepend t)
 ("pc" "Project-local changelog" entry
  (file+headline +org-capture-project-changelog-file "Unreleased")
  "* %U %?\n%i\n%a" :prepend t)
 ("o" "Centralized templates for projects")
 ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
 ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
 ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t))

  )

  ;; end
)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/")
  (org-roam-completion-everywhere t)
  :config
  (org-roam-setup)
)

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
