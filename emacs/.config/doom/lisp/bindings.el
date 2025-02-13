;;; lisp/bindings.el --- Keybindings -*- lexical-binding: t; -*-

(map! :map org-mode-map
      :leader
      :desc "Insert heading" "o h" #'org-insert-heading)

(map! :map org-agenda-mode-map
      :leader
      :desc "Next week" "n w" #'org-agenda-later
      :desc "Previous week" "n W" #'org-agenda-earlier)
