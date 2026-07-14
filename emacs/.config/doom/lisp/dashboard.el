(use-package dashboard
  :config
  (dashboard-setup-startup-hook)  ;; show on startup
  ;; Customize dashboard items
  (setq dashboard-startup-banner "~/.config/doom/lisp/logo.txt")
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)

  (setq dashboard-week-agenda t)
  ;; vertically center content
(setq dashboard-banner-logo-title
      "Rejection isn't failure, it's the courage of trying.")
  (setq dashboard-items '((recents . 5)
                          (agenda . 10)   ;; show org-agenda
                          )))
(setq dashboard-startupify-list '(dashboard-insert-banner
                                  dashboard-insert-newline
                                  dashboard-insert-banner-title
                                  dashboard-insert-navigator
                                  dashboard-insert-newline
                                  dashboard-insert-items
                                  dashboard-insert-init-info
                                  ))
(setq dashboard-item-names '(("Agenda for the coming week:" . "Agenda:")))
