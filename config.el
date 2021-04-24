;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Phillip Nguyen"
      user-mail-address "pnguyen4711@gmail.com")

;; Font config (I make heavy use of italics so I use fonts that support it)
(setq doom-font (font-spec :family "Iosevka Extended" :size 14)
      doom-big-font (font-spec :family "Iosevka Extended" :size 30)
      doom-serif-font (font-spec :family "Iosevka Slab Extended" :size 14)
      doom-variable-pitch-font (font-spec :family "IBM Plex Serif"))

;; Use this function to list available fonts (uncomment and evaluate with "gr"):
;(print (font-family-list))

;; Custom Theme
(setq doom-theme 'typeset)

;; Basic UI/UX Changes
(modify-syntax-entry ?_ "w")           ; Treat underscores as word delimiters
(global-subword-mode 1)                ; Iterate through camelCase words too
(setq-default tab-width 4)             ; This is what I like
(setq rainbow-delimiters-max-face-count 6
      display-line-numbers-type nil    ; No line numbers
      which-key-idle-delay 0.2         ; Make which-key help popup appear sooner
      undo-limit 80000000              ; Raise undo-limit to 80Mb
      evil-split-window-below t        ; Switch to the new window after splitting
      evil-vsplit-window-right t
      evil-want-fine-undo t            ; More granular undos
      +ivy-buffer-preview t            ; Preview buffer before switching
      company-show-numbers t)          ; Autocomplete with M-[0,9]
(map! "C-S-V" #'yank                   ; Set intuitive copy/paste keybindings
      "C-S-C" #'kill-ring-save)

;; Tecosaur has a good point. Doom uses evil, no need to beat a dead horse.
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew! which-key-replacement-alist
            '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(?:/\\)?\\(.*\\)") . (nil . "\\1"))
            '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "\\1"))))

;; Projectile Config
(setq projectile-ignored-projects '("/tmp" "~/.emacs.d/.local/straight/repos/"))

;; Use mixed pitch for org files, markdown files, and info pages
;; Certain faces are forced to be fixed-width by theme
(add-hook! (gfm-mode markdown-mode Info-mode org-mode) #'variable-pitch-mode)

;; Use olivetti to center documents
(use-package! olivetti
  :hook ((text-mode Info-mode) . olivetti-mode)
  :init (setq olivetti-body-width 90
              treemacs-width 30))
;; I'm not sure about this yet
;; (add-hook! (prog-mode) #'olivetti-mode)

;; Org Config
(after! org
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-log-done 'time
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-include-deadlines t
        org-todo-keywords
        '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)"
                    "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
          ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
          ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
          ("DONE" :foreground "#50a14f" :weight normal :underline t)
          ("CANCELLED" :foreground "#ff6480" :weight normal :underline t))))

;; Hide emphasis and link markup until cursor enters element
(use-package! org-appear
  :after org
  :hook (org-mode . org-appear-mode)
  :custom (org-hide-emphasis-markers t))

;; Automatically toggle LaTeX fragment previews as the cusor enters/exits them
(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

;; I prefer plain english over #A, #B, #C
(use-package! org-fancy-priorities
  :after org
  :hook (org-mode . org-fancy-priorities-mode)
  :custom
  (org-fancy-priorities-list '("HIGH" "MID" "LOW"))
  (org-priority-faces '((?A :foreground "#ff0000")
                        (?C :foreground "#b0ada2"))))

;; Org Agenda Config
(use-package! org-super-agenda
  :after org-agenda
  :config (org-super-agenda-mode)
  :custom
  (org-super-agenda-groups '((:name "Schedule"
                              :time-grid t
                              :date today
                              :scheduled today)
                             (:name "Due today" :deadline today)
                             (:name "Important" :priority "A")
                             (:name "Overdue"   :deadline past)
                             (:name "Due soon"  :deadline future))))

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
