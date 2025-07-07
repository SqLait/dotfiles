;;; lisp/misc.el --- Miscellaneous settings -*- lexical-binding: t; -*-

(setq org-file-apps
      '(("\\.pdf\\'" . "zathura %s")))

(after! org-roam
  (setq org-roam-directory (file-truename "~/Documents/notes/zettelkast/"))
  (org-roam-db-autosync-mode))
