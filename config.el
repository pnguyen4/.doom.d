;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Phillip Nguyen"
      user-mail-address "pnguyen4711@gmail.com")

;; Font config (I make heavy use of italics so I use fonts that support it)
(setq doom-font (font-spec :family "Liberation Mono" :size 12)
      doom-big-font (font-spec :family "Liberation Mono" :size 30)
      doom-serif-font (font-spec :family "Liberation Serif" :size 12)
      doom-variable-pitch-font (font-spec :family "Liberation Mono" :size 16))

;; Use this function to list available fonts (uncomment and evaluate with "gr"):
;; (print (font-family-list))

;; Use mixed pitch for markdown files
(add-hook! (gfm-mode markdown-mode) #'mixed-pitch-mode)

;; Theme + modifications
(setq doom-theme 'tao-yang)
(custom-theme-set-faces!
  'tao-yang

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
  '(markdown-header-face :font doom-serif-font)
  '(markdown-header-face-1 :height 1.50 :weight extra-bold :inherit markdown-header-face)
  '(markdown-header-face-2 :height 1.40 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-3 :height 1.30 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-4 :height 1.20 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-5 :height 1.10 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-6 :height 1.00 :weight bold       :inherit markdown-header-face))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

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
