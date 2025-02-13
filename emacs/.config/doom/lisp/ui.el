;;; lisp/ui.el --- UI Configuration -*- lexical-binding: t; -*-

(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "JetBrains Mono Nerd Font" :size 16 :weight 'regular :ligatures t)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono Nerd Font" :size 18 :ligatures t)
      doom-serif-font (font-spec :family "JetBrains Mono Nerd Font" :size 18 :ligatures t))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(set-face-attribute 'default nil :family "JetBrains Mono Nerd Font" :height 140)
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
