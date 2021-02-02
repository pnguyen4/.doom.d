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

;; Org Mode
(after! org
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-log-done 'time
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
          ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
          ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
          ("DONE" :foreground "#50a14f" :weight normal :underline t)
          ("CANCELLED" :foreground "#ff6480" :weight normal :underline t))))

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
  `(ein:cell-input-area :background ,(doom-lighten (face-attribute 'lazy-highlight :background) 0.25))

  ;; Markdown Mode Specifics
  '(markdown-markup-face :inherit markdown-language-keyword-face)
  `(markdown-code-face :extend t
                       :background ,(doom-lighten (face-attribute 'lazy-highlight :background) 0.25))
  `(markdown-language-keyword-face :background nil
                                   :foreground ,(face-attribute 'font-lock-comment-face :foreground))
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
  `(org-headline-done :weight normal :strike-through t
                      :foreground ,(face-attribute 'font-lock-comment-face :foreground))
  `(org-meta-line :background ,(doom-darken (face-attribute 'lazy-highlight :background) 0.05) :extend t)
  `(org-block-begin-line :background ,(doom-darken (face-attribute 'lazy-highlight :background) 0.05))
  `(org-block-end-line   :background ,(doom-darken (face-attribute 'lazy-highlight :background) 0.05))
  `(org-block            :background ,(doom-lighten (face-attribute 'lazy-highlight :background) 0.05)))

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
