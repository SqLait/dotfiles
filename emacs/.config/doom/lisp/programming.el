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

(defun insert-greek-letter ()
  "Insert a Greek letter by selecting its name from a menu.
Maps Roman input (a, b, g...) to Greek characters (α, β, γ...)."
  (interactive)
  (let* ((greek-map
          '(("alpha (α)" . "α") ("beta (β)" . "β") ("gamma (γ)" . "γ") ("delta (δ)" . "δ")
            ("epsilon (ε)" . "ε") ("zeta (ζ)" . "ζ") ("eta (η)" . "η") ("theta (θ)" . "θ")
            ("iota (ι)" . "ι") ("kappa (κ)" . "κ") ("lambda (λ)" . "λ") ("mu (μ)" . "μ")
            ("nu (ν)" . "ν") ("xi (ξ)" . "ξ") ("omicron (ο)" . "ο") ("pi (π)" . "π")
            ("rho (ρ)" . "ρ") ("sigma (σ)" . "σ") ("tau (τ)" . "τ") ("upsilon (υ)" . "υ")
            ("phi (φ)" . "φ") ("chi (χ)" . "χ") ("psi (ψ)" . "ψ") ("omega (ω)" . "ω")
            ;; Uppercase variants
            ("Alpha (Α)" . "Α") ("Beta (Β)" . "Β") ("Gamma (Γ)" . "Γ") ("Delta (Δ)" . "Δ")
            ("Epsilon (Ε)" . "Ε") ("Zeta (Ζ)" . "Ζ") ("Eta (Η)" . "Η") ("Theta (Θ)" . "Θ")
            ("Iota (Ι)" . "Ι") ("Kappa (Κ)" . "Κ") ("Lambda (Λ)" . "Λ") ("Mu (Μ)" . "Μ")
            ("Nu (Ν)" . "Ν") ("Xi (Ξ)" . "Ξ") ("Omicron (Ο)" . "Ο") ("Pi (Π)" . "Π")
            ("Rho (Ρ)" . "Ρ") ("Sigma (Σ)" . "Σ") ("Tau (Τ)" . "Τ") ("Upsilon (Υ)" . "Υ")
            ("Phi (Φ)" . "Φ") ("Chi (Χ)" . "Χ") ("Psi (Ψ)" . "Ψ") ("Omega (Ω)" . "Ω")))
         (names (mapcar #'car greek-map))
         (choice (completing-read "Greek letter (e.g., alpha, Beta): " names nil t)))
    (when choice
      (insert (cdr (assoc choice greek-map))))))   

;; Keybinding: SPC t s for spell checker menu
(map! :leader
      :prefix ("t" . "toggles")
      :desc "Spellchecker menu" "s" #'my/spell-dictionary-menu)

