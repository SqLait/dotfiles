;;; lisp/org-config.el --- Org Mode Configuration -*- lexical-binding: t; -*-

(setq org-directory "~/Documents/orgfiles/")

(after! org
  (setq org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis " ⤵"
        org-auto-align-tags nil
        org-tags-column 0
        org-fold-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t))

(after! org
  (setq org-babel-load-languages
        '((emacs-lisp . t) (python . t) (shell . t) (ruby . t) (R . t)
          (js . t) (java . t) (matlab . t) (org . t) (sql . t)
          (plantuml . t) (haskell . t) (C . t) (lua . t) (perl . t))))

(after! org
  (global-org-modern-mode))

(setq org-modern-table nil
      org-modern-star ["◉" "○" "✸" "✿"]
      org-modern-hide-stars nil
      org-modern-todo nil
      org-modern-timestamp t)

