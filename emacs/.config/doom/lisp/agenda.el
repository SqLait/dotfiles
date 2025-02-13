;;; lisp/agenda.el --- Org Agenda Configuration -*- lexical-binding: t; -*-

(after! org-agenda
  (setq org-agenda-files (directory-files-recursively "~/Documents/orgfiles/Agenda/" "\\.org$")
        org-agenda-week-start-day 1
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
        '(("c" "Agenda"
           ((agenda "")
            (tags-todo "work")
            (tags-todo "next"))))))

(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

(map! :map org-agenda-mode-map
      :leader
      :desc "Next week" "n w" #'org-agenda-later
      :desc "Previous week" "n W" #'org-agenda-earlier)
