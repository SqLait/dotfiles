;;; Keybindings for Doom Emacs (converted from Neovim)
;;; Place these in your config.el file

(defun window-split ()
  "Do a horizontal split and move focus to the new window."
  (interactive)
  (select-window (split-window-below)))

(defun window-vsplit ()
  "Do a vertical split and move focus to the new window."
  (interactive)
  (select-window (split-window-right)))

(map! :leader
      "sv" nil
      "s" nil
      "sh" nil)

(map! :leader
      (:desc "Find org roam file" "rf" #'org-roam-node-find)
      (:desc "Insert org roam file" "ri" #'org-roam-node-insert)
      (:desc "Insert org roam file" "ru" #'org-roam-ui-mode)
      ;; Clear search highlights
      (:desc "Clear search highlights" "nh" #'evil-ex-nohighlight)

      ;; Increment/Decrement numbers
      (:desc "Increment number" "+" #'evil-numbers/inc-at-pt)
      (:desc "Decrement number" "-" #'evil-numbers/dec-at-pt)

      ;; Window management
      (:desc "Split window vertically" "sv" #'window-vsplit)
      (:desc "Split window horizontally" "sh" #'window-split)
      (:desc "Make split equal size" "se" #'balance-windows)
      (:desc "Close current split" "sx" #'delete-window)

      ;; Tab management (uses workspaces)
      (:desc "Open new tab (workspace)" "to" #'+workspace/new)
      (:desc "Close current tab (workspace)" "tx" #'+workspace/close)
      (:desc "Next tab (workspace)" "tn" #'+workspace/switch-right)
      (:desc "Previous tab (workspace)" "tp" #'+workspace/switch-left)
      (:desc "Open buffer in new tab (workspace)" "tf" #'+workspace/new)

      ;; Toggle line numbers
      (:desc "Toggle relative line numbers" "rl" #'doom/toggle-line-numbers)

      ;; File Explorer (Dired as replacement for Oil)
      (:desc "Toggle file explorer" "ee" #'dired-jump)

      ;; Search & Navigation (Telescope -> Consult/Projectile)
      (:desc "Find files" "ff" #'projectile-find-file)
      (:desc "Search string in project" "fs" #'consult-ripgrep)
      (:desc "Find string under cursor" "fc" #'consult-line)
      (:desc "Find TODO comments" "ft" #'hl-todo-occur)
      (:desc "Switch themes" "st" #'counsel-load-theme)

      ;; Org-Mode (Table Mode Toggle)
      (:desc "Toggle table formatting" "tm" #'org-table-toggle-column-width)

      ;; Buffer Management
      (:desc "Delete buffer" "bd" #'kill-this-buffer)


      ;; Make bash script executable
      (:desc "Make script executable" "chx"
             (cmd! (shell-command (concat "chmod +x " (buffer-file-name)))))

      ;; Undo Tree Toggle
      (:desc "Undo tree" "u" #'undo-tree-visualize)
      (:desc "Daily plan file" "dp" #'org-journal-new-entry))

;; Move selected text up/down in Visual mode
(define-key evil-visual-state-map (kbd "J") (kbd "M-<down>"))
(define-key evil-visual-state-map (kbd "K") (kbd "M-<up>"))

;; Indentation in visual mode
(map! :v "<" "<gv")
(map! :v ">" ">gv")

;; Window navigation (like Tmux)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)
;; Center the screen when scrolling
(map! :n "<C-d>" (lambda () (interactive) (evil-scroll-down 0) (evil-scroll-line-to-center nil)))
(map! :n "<C-u>" (lambda () (interactive) (evil-scroll-up 0) (evil-scroll-line-to-center nil)))

;; Resize windows
(map! :n "<C-Up>"    #'evil-window-increase-height
      :n "<C-Down>"  #'evil-window-decrease-height
      :n "<C-Left>"  #'evil-window-decrease-width
      :n "<C-Right>" #'evil-window-increase-width)


;; Buffer Navigation
(map! :n "<S-tab>" #'previous-buffer
      :n "<tab>n" #'next-buffer
      :n "<tab>f" #'beginning-of-buffer
      :n "<tab>l" #'end-of-buffer)

(after! evil
  ;; Rebind C-j and C-k in normal mode in org-mode to window movement
  (map! :map org-mode-map
        :n "C-j" #'evil-window-down
        :n "C-k" #'evil-window-up))

