;;; lisp/agenda.el --- Org Agenda Configuration -*- lexical-binding: t; -*-

(after! org-agenda
  ;; Add both directories to org-agenda-files
  (setq org-agenda-files
        (append (directory-files-recursively "~/Documents/notes/agenda/" "\\.org$")
                (directory-files-recursively "~/Documents/school/" "\\.org$")))

  ;; Configure other org-agenda settings
  (setq org-agenda-week-start-day 1
        org-agenda-tags-column 0
        org-agenda-block-separator ?─
        org-agenda-time-grid '((daily today) (800 1000 1200 1400 1600 1800 2000) "---" "")))

(after! org-agenda
  (setq org-super-agenda-groups
        '((:name "Today" :time-grid t :order 1)
          (:name "Next" :todo "NEXT" :order 2)
          (:name "Someday" :todo "SOMEDAY" :order 3))))

(after! org-agenda
  (setq org-agenda-custom-commands
        '(("c" "Agenda view"
           ((agenda "")
            (tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority tasks:")))
            (tags-todo "WORK")
            (tags-todo "STUDY")
            (tags-todo "NEXT")
            (alltodo "")
            )))))

(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

(map! :map org-agenda-mode-map
      :leader
      :desc "Next week" "n w" #'org-agenda-later
      :desc "Previous week" "p w" #'org-agenda-earlier)

(setq org-priority-faces
      '((?A . (:foreground "red" :weight bold))
        (?B . (:foreground "orange"))
        (?C . (:foreground "goldenrod"))
        (?D . (:foreground "yellow green"))))
