;;; lisp/programming.el --- Programming-related settings -*- lexical-binding: t; -*-

(after! flyspell
  (setq ispell-dictionary "en_US"))

(add-hook 'text-mode-hook #'flyspell-mode)  ;; Enable spell check for text
(add-hook 'prog-mode-hook #'flyspell-prog-mode)  ;; Spell check for comments

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

(setq lsp-rust-server 'rust-analyzer)
