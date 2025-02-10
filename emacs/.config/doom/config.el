;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; 'doom-one' is a pretty good theme
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/orgfiles/")

(setq doom-font (font-spec :family "JetBrains Mono Nerd Font" :size 16 :weight 'regular :ligatures t)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono Nerd Font" :size 18 :ligatures t)
      doom-serif-font (font-spec :family "JetBrains Mono Nerd Font" :size 18 :ligatures t)

      ;; Set the bold and italic fonts
      doom-font-bold (font-spec :family "JetBrains Mono Nerd Font" :weight 'bold :ligatures t)
      doom-font-italic (font-spec :family "JetBrains Mono Nerd Font" :slant 'italic :ligatures t))

(set-face-attribute 'default nil :family "JetBrains Mono Nerd Font" :height 140)
(set-face-attribute 'variable-pitch nil :family "JetBrains Mono Nerd Font" :height 160)
(set-face-attribute 'fixed-pitch nil :family "JetBrains Mono Nerd Font")

;; Enable font ligatures
(setq +ligatures-extra-symbols t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').

(after! org
  (setq org-babel-load-languages
        '((emacs-lisp . t)    ;; Emacs Lisp
          (python . t)         ;; Python
          (shell . t)          ;; Shell scripting
          (ruby . t)           ;; Ruby
          (R . t)              ;; R
          (js . t)             ;; JavaScript
          (java . t)           ;; Java
          (matlab . t)         ;; MATLAB
          (org . t)            ;; Org mode itself
          (sql . t)            ;; SQL
          (plantuml . t)       ;; PlantUML
          (haskell . t)        ;; Haskell
          (C . t)              ;; C language
          (lua . t)            ;; Lua language
          (perl . t))))        ;; Perl language

;; Ensure the necessary ob-* modules are loaded
(after! org
  (use-package! ob-emacs-lisp)  ;; For Emacs Lisp
  (use-package! ob-python)      ;; For Python
  (use-package! ob-shell)       ;; For Shell
  (use-package! ob-ruby)        ;; For Ruby
  (use-package! ob-R)           ;; For R
  (use-package! ob-js)          ;; For JavaScript
  (use-package! ob-java)        ;; For Java
  (use-package! ob-matlab)      ;; For MATLAB
  (use-package! ob-org)         ;; For Org mode code blocks
  (use-package! ob-sql)         ;; For SQL
  (use-package! ob-plantuml)    ;; For PlantUML
  (use-package! ob-haskell)     ;; For Haskell
  (use-package! ob-lua)         ;; For Lua language
  (use-package! ob-C)
  (use-package! ob-perl))       ;; For Perl language

;; Enable org-roam
(after! org-roam
  (setq org-roam-directory (file-truename "~/Documents/orgfiles/zettelkast/"))
  (org-roam-db-autosync-mode))

;; Enable org-super-agenda
(after! org-agenda
  (setq org-super-agenda-groups
        '((:name "Today"
                 :time-grid t
                 :order 1)
          (:name "Next"
                 :todo "NEXT"
                 :order 2)
          (:name "Someday"
                 :todo "SOMEDAY"
                 :order 3))))

;; Custom org-agenda view example
(after! org-agenda
  (setq org-agenda-custom-commands
        '(("c" "Agenda"
           ((agenda "")
            (tags-todo "work")
            (tags-todo "next"))))))

(use-package! org
  :config
  (defun my/paste-image-from-clipboard ()
    "Paste an image from the clipboard into the current buffer."
    (interactive)
    (let ((file (make-temp-file "clipboard-image" nil ".png")))
      ;; Use wl-clipboard to get the image from the clipboard and save it to a file
      (call-process "wl-paste" nil nil nil "--type" "image/png" "-o" file)
      (insert-image (create-image file)))))

(after! org
  (global-org-modern-mode))

(setq org-modern-table nil
      org-modern-star ["◉" "○" "✸" "✿"]
      org-modern-hide-stars nil
      org-modern-todo nil
      org-modern-timestamp t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
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

;; Org Styling & Prettification
(setq org-hide-emphasis-markers t
      org-pretty-entities t
      org-ellipsis " ⤵"
      org-auto-align-tags nil
      org-tags-column 0
      org-fold-catch-invisible-edits 'show-and-error
      org-special-ctrl-a/e t
      org-insert-heading-respect-content t)

;; Org Agenda Enhancements
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
(setq org-agenda-tags-column 0
      org-agenda-block-separator ?─
      org-agenda-time-grid '((daily today) (800 1000 1200 1400 1600 1800 2000) "---" ""))

(custom-set-faces
 '(org-document-title ((t (:inherit title :height 1.2 :weight bold))))
 '(org-document-info ((t (:inherit title :height 1.0 :weight bold))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.1)))))

(after! flyspell
  (setq ispell-dictionary "en_US")) ;; Change to your preferred language
(add-hook 'text-mode-hook #'flyspell-mode)  ;; Enable spell check for text files
(add-hook 'prog-mode-hook #'flyspell-prog-mode)  ;; Enable spell check for comments in code
