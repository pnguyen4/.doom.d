;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Phillip Nguyen"
      user-mail-address "pnguyen4711@gmail.com")

;; Font config (I make heavy use of italics so I use fonts that support it)
(setq doom-font (font-spec :family "Liberation Mono" :size 14)
      doom-big-font (font-spec :family "Liberation Mono" :size 30)
      doom-serif-font (font-spec :family "IBM Plex Serif" :size 14)
      doom-variable-pitch-font (font-spec :family "IBM Plex Serif" :size 14))

;; Use this function to list available fonts (uncomment and evaluate with "gr"):
;; (print (font-family-list))

;; Use mixed pitch for org files, markdown files, and info pages
(add-hook! (gfm-mode markdown-mode) #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'Info-mode-hook #'mixed-pitch-mode)

;; Automatically toggle LaTeX fragment previews as the cusor enters/exits them
(add-hook! 'org-mode-hook #'org-fragtog-mode)

;; Org Mode
(use-package! org-super-agenda
  :after org-agenda
  :config (org-super-agenda-mode))
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode))
(after! org
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-log-done 'time
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-include-deadlines t
        org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-fancy-priorities-list '("HIGH" "MID" "LOW")
        org-super-agenda-groups '((:name "Schedule"  :time-grid t :date today :scheduled today)
                                  (:name "Due today" :deadline today)
                                  (:name "Important" :priority "A")
                                  (:name "Overdue"   :deadline past)
                                  (:name "Due soon"  :deadline future))
        org-priority-faces '((?A :foreground "#ff0000")
                             (?C :foreground "#b0ada2"))
        org-todo-keyword-faces
        '(("TODO"       :foreground "#7c7c75" :weight normal :underline t)
          ("WAITING"    :foreground "#9f7efe" :weight normal :underline t)
          ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
          ("DONE"       :foreground "#50a14f" :weight normal :underline t)
          ("CANCELLED"  :foreground "#ff6480" :weight normal :underline t))))

;; Relative line numbers
(setq display-line-numbers-type 'relative)

;; This is what I like
(setq-default tab-width 4)

;; Treat underscores as word delimiters
(modify-syntax-entry ?_ "w")

;; Iterate through camelCase words too
(global-subword-mode 1)

;; Make which-key help popup appear sooner
(setq which-key-idle-delay 0.2)

;; Keybindings for copy and paste similar to alacritty (e.g. control + shift + v)
(map! "C-S-V" #'yank
      "C-S-C" #'kill-ring-save)

;; Projectile Config
(setq projectile-ignored-projects '("/tmp" "~/.emacs.d/.local/straight/repos/"))

;; Quality of life fixes for EIN
(setq ein:output-area-inlined-images t)
(setq ein:polymode t)
(map! :map ein:notebook-mode-map "C-c C-\\" #'ein:worksheet-execute-all-cells)

;; Theme + modifications
(setq doom-theme 'tao-yang)
(custom-theme-set-faces!
  'tao-yang

  ;; Don't change underlying font foreground on highlight line
  '(hl-line :background "#FAF7EE" :foreground nil :extend t)

  ;; Boxes make which-key menu ugly
  '(font-lock-function-name-face :box nil :slant italic)

  ;; EIN specifics
  `(ein:cell-input-area :background "#faf7ee")

  ;; Markdown Mode Specifics
  '(markdown-markup-face :inherit markdown-language-keyword-face)
  '(markdown-code-face   :extend t :background "#faf7ee")
  '(markdown-language-keyword-face :background nil :foreground "#b0ada2")
  '(markdown-header-face-1 :height 1.50 :weight extra-bold :inherit markdown-header-face)
  '(markdown-header-face-2 :height 1.40 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-3 :height 1.30 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-4 :height 1.20 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-5 :height 1.10 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-6 :height 1.00 :weight bold       :inherit markdown-header-face)

  ;; Org Mode Specifics
  '(org-document-title :height 1.50 :weight bold)
  '(org-level-1        :height 1.30 :weight bold)
  '(org-level-2        :height 1.10 :weight bold)
  '(org-level-3        :height 1.00 :weight bold)
  '(org-level-4        :height 1.00 :weight bold)
  '(org-level-5        :height 1.00 :weight bold)
  '(org-level-6        :height 1.00 :weight bold)
  '(org-meta-line :extend t :background "#edeae2")
  '(org-block-begin-line    :background "#edeae2")
  '(org-block-end-line      :background "#edeae2")
  '(org-block               :background "#faf7ee"))
  '(org-headline-done :weight normal :strike-through t :foreground "#b0ada2")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
