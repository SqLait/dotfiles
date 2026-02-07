;;; lisp/org-config.el --- Org Mode Configuration -*- lexical-binding: t; -*-
(after! org
  (setq org-babel-load-languages
        '((emacs-lisp . t) (python . t) (shell . t) (ruby . t) (R . t)
          (js . t) (java . t) (matlab . t) (org . t) (sql . t) (zig . t)
          (plantuml . t) (haskell . t) (C . t) (lua . t) (perl . t))))

(after! org-roam
  (setq org-roam-directory (file-truename "~/Documents/notes/zettelkast/"))
  (org-roam-db-autosync-mode))

(after! org
  ;; Unbind C-j and C-k in org-mode (if bound)
  (map! :map org-mode-map
        "C-j" nil
        "C-k" nil))

;;  (setq
;;  ;; Edit settings
;;  org-auto-align-tags nil
;;  org-tags-column 0
;;  org-catch-invisible-edits 'show-and-error
;;  org-special-ctrl-a/e t
;;  org-modern-checkbox nil
;;  org-modern-table nil
;;  org-insert-heading-respect-content t
;;  org-modern-replace-stars "◉○✸✿"
;;
;;   ;; Org styling, hide markup etc.
;;   org-hide-emphasis-markers t
;;   org-pretty-entities t
;;   org-agenda-tags-column 0)

(after! org
  (setq org-todo-keywords
        '((sequence
            "IDEA(i)"
            "SOMEDAY(S)"
            "TODO(t)"
            "PLAN(p)"
            "STRT(s)"
            "PROG(P)"
            "REVIEW(r)"
            "WAIT(w)"
            "HOLD(h)"
            "|"
            "DONE(d)"
            "KILL(k)"
            "CANCELLED(c)"
            ))))

(after! org
  (setq org-todo-keyword-faces
        '(
          ("PLAN" . (:foreground "goldenrod" :weight bold))
          ("STRT" . (:foreground "#8ec07c" :weight bold))
          ("PROG" . (:foreground "#fe8019" :weight bold))
          ("WAIT" . (:foreground "#e0af68" :weight bold))
          ("HOLD" . (:foreground "#73daca" :weight bold))
          ("CANCELLED" . (:foreground "red" :weight bold))
          ("SOMEDAY" . (:foreground "#83a598" :weight bold))
          ("KILL" . (:foreground "red" :weight bold)))))

(setq org-tag-faces
      '(
        ("WORK"  . (:foreground "#fe8019" :weight bold))
        ("STUDY"  . (:foreground "#d3869b" :weight bold))
        ("NEXT"  . (:foreground "#fabd2f" :weight bold))
        ("SCHOOL"  . (:foreground "#8dc07b" :weight bold))

        ;("PLANNING"  . (:foreground "mediumPurple1" :weight bold))
        ;("backend"   . (:foreground "royalblue1"    :weight bold))
        ;("frontend"  . (:foreground "forest green"  :weight bold))
        ;("QA"        . (:foreground "sienna"        :weight bold))
        ;("meeting"   . (:foreground "yellow1"       :weight bold))
        ))

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
(setq org-roam-capture-templates
      `(("z" "Zettel (Atomic note)" plain "%?"
         :target (file+head "zettels/${slug}.org"
                            "#+TITLE: ${title}\n#+FILETAGS: nil\n")
         :unnarrowed t)
        ("h" "Hub Page (Overview note)" plain "%?"
         :target (file+head "hubs/${slug}.org"
                            "#+TITLE: ${title}\n#+FILETAGS: nil\n")
         :unnarrowed t)))

(use-package! org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow nil
        org-roam-ui-update-on-save t))

(defun my-daily-plan-file ()
  (let ((filename (expand-file-name
                    (format "~/Documents/notes/general/plan/%s.org"
                            (format-time-string "%Y-%m-%d")))))
    (make-directory (file-name-directory filename) t)
    filename))

(setq org-capture-templates
      '(("d" "Daily plan" plain
         (function my-daily-plan-file)
         "* %?")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/notes/general/todos.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("n" "Note" entry (file+headline "~/Documents/notes/general/notes.org" "Notes")
         "* %?\n  %i\n  %a")
        ("m" "Meeting" entry (file+headline "~/Documents/notes/general/meetings.org" "Meetings")
         "* %?\n  %T\n  %i\n  %a")
        ("r" "Refile" entry (file+headline "~/Documents/notes/general/refile.org" "Refile")
         "* %?\n  %T\n  %i\n  %a")
        ))

(org-roam-db-sync)
