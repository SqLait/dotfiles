;;; lisp/org-config.el --- Org Mode Configuration -*- lexical-binding: t; -*-

(setq org-directory "~/Documents/notes/")

(after! org
  (setq org-babel-load-languages
        '((emacs-lisp . t) (python . t) (shell . t) (ruby . t) (R . t)
          (js . t) (java . t) (matlab . t) (org . t) (sql . t)
          (plantuml . t) (haskell . t) (C . t) (lua . t) (perl . t))))

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
;;
(setq org-roam-capture-templates
      `(("d" "default" plain "%?"
         :target (file+head "${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)))

(use-package! org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t))
