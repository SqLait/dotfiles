;;; lisp/ui.el --- UI Configuration -*- lexical-binding: t; -*-

;; Set the Gruvbox variant to soft
(setq doom-gruvbox-dark-variant "soft")
(setq doom-theme 'doom-gruvbox)
(custom-set-faces!
   '(region :background "#504945"))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(set-face-attribute 'default nil :family "JetBrains Mono Nerd Font" :height 130)
(set-face-attribute 'variable-pitch nil :family "JetBrains Mono Nerd Font" :height 160)

(setq display-line-numbers-type nil)

(modify-all-frames-parameters
 '((right-divider-width . 0)
   (internal-border-width . 0)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(custom-set-faces
 '(org-document-title ((t (:weight bold :height 1.2))))
 '(org-document-info ((t (:weight bold :height 1.1))))
 '(org-property-value ((t (:height 1.0 :weight bold :foreground "gray60"))))
 '(org-deadline-announce ((t (:weight bold))))
 '(org-meta-line ((t (:height 1.0 :weight bold))))
 '(org-document-info-keyword ((t (:weight bold :height 1.0)))))
