(custom-set-faces!
'(markdown-header-delimiter-face :foreground "#616161" :height 0.9)
'(markdown-header-face-1 :height 1.5 :foreground "orange" :weight extra-bold :inherit markdown-header-face)
'(markdown-header-face-2 :height 1.3 :foreground "goldenrod" :weight extra-bold :inherit markdown-header-face)
'(markdown-header-face-3 :height 1.2 :foreground "goldenrod" :weight extra-bold :inherit markdown-header-face)
'(markdown-header-face-4 :height 1.1 :foreground "goldenrod" :weight bold :inherit markdown-header-face)
'(markdown-header-face-5 :height 1.05 :foreground "goldenrod" :weight bold :inherit markdown-header-face)
'(markdown-header-face-6 :height 1.005 :foreground "goldenrod" :weight semi-bold :inherit markdown-header-face)
)

;; (defvar-local nb/current-line '(0 . 0))
;; 
;; (defun nb/unhide-current-line (limit)
;;   (when (and (bobp) (< (point) limit))  ; safety
;;     (let* ((start (max (point) (car nb/current-line)))
;;            (end   (min limit (cdr nb/current-line))))
;;       (when (< start end)
;;         (remove-text-properties start end
;;                                 '(invisible nil display nil composition nil))
;;         (goto-char limit)
;;         t))))
;; 
;; (defun nb/refontify-on-linemove ()
;;   (let* ((start (line-beginning-position))
;;          (end   (line-beginning-position 2)))
;;     (unless (equal start (car nb/current-line))
;;       (setq-local nb/current-line (cons start end))
;;       ;; Try these variants - pick what works best for you
;;       (font-lock-flush start end)                     ; 1
;;       ;; (font-lock-fontify-region start end t)       ; 2
;;       ;; (jit-lock-fontify-now start end)             ; 3 - sometimes best
;;       )))
;; 
;; (defun nb/markdown-unhighlight ()
;;   (markdown-toggle-markup-hiding 1)  ; force hide markup
;;   (setq-local font-lock-multiline t) ; ← sometimes helps a lot!
;;   (font-lock-add-keywords nil '((nb/unhide-current-line)) 'append)
;;   (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t))
;; 
;;  (add-hook 'markdown-mode-hook #'nb/unhide-current-line)
