;;; lisp/programming.el --- Programming-related settings -*- lexical-binding: t; -*-

;; Set initial spell checker language
(after! flyspell
  (setq ispell-dictionary "en_GB"))

;; Enable spell checking
(add-hook 'text-mode-hook #'flyspell-mode)         ;; For prose
(add-hook 'prog-mode-hook #'flyspell-prog-mode)    ;; For comments/strings

;; Org-babel language support
(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((rust . t))))  ;; Enable Rust support

(after! org
  (use-package! ob-emacs-lisp)
  (use-package! ob-python)
  (use-package! ob-shell)
  (use-package! ob-ruby)
  (use-package! ob-R)
  (use-package! ob-js)
  (use-package! ob-java)
  (use-package! ob-matlab)
  (use-package! ob-org)
  (use-package! ob-sql)
  (use-package! ob-plantuml)
  (use-package! ob-haskell)
  (use-package! ob-lua)
  (use-package! ob-C)
  (use-package! ob-perl))

;; Rust LSP
(setq lsp-rust-server 'rust-analyzer)

;;; Spell checker menu function
(defun my/set-ispell-dictionary (dict)
  "Set `ispell-dictionary' to DICT and refresh flyspell."
  (setq ispell-dictionary dict)
  (when (bound-and-true-p flyspell-mode)
    (flyspell-mode -1)
    (flyspell-mode +1))
  (message "Switched dictionary to: %s" dict))

(defun my/spell-dictionary-menu ()
  "Popup menu to select and switch spell checker dictionary."
  (interactive)
  (let ((choice (read-key
                 (propertize "Spell Dictionary: [E]nglish  [N]ederlands  [D]eutsch" 'face 'minibuffer-prompt))))
    (pcase choice
      (?E
       (let ((eng-choice (read-key
                          (propertize "English: [U]S or [G]B?" 'face 'minibuffer-prompt))))
         (pcase eng-choice
           (?U (my/set-ispell-dictionary "en_US"))
           (?G (my/set-ispell-dictionary "en_GB"))
           (_ (message "Cancelled.")))))
      (?N (my/set-ispell-dictionary "nl_NL"))
      (?D (my/set-ispell-dictionary "de_DE"))
      (_ (message "Cancelled.")))))

;; Keybinding: SPC t s for spell checker menu
(map! :leader
      :prefix ("t" . "toggles")
      :desc "Spellchecker menu" "s" #'my/spell-dictionary-menu)

