;;; lisp/misc.el --- Miscellaneous settings -*- lexical-binding: t; -*-

(setq org-file-apps
      '(("\\.pdf\\'" . "zathura %s")))

(setq org-latex-compiler "xelatex")
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
