;;; typeset-theme.el --- My Custom Doom Theme -*- lexical-binding: t -*-
;; Package-Requires: ((emacs "27.1"))

;;; Commentary:
;;
;; Ted Nelson was right.
;; We ought to be able to program with all the conveniences of printed material, and more.
;; This isn't necessarily a minimalist or monochrome theme.
;; Color is used sparingly, and only in the places it makes sense.
;;
;; This theme assumse you have configured:
;; - a sans-serif monospace font as your main programming font
;; - a serif or slab-serif monospace font as your secondary programming font
;; - a propertional font for rich text contexts, such as org or markdown

;; Author: Phillip Nguyen
;; Version: 0.31
;; URL: https://github.com/pnguyen4/.doom.d
;; License: GPL-3.0

;;; Code:
(deftheme typeset
  "Syntax typesetting over syntax highlighting.")

(let ((bg-alt       "#F5F5F5")  ; secondary context
      (bg-hl-line   "#E5E5DE")  ; current focus
      (bg-match     "#FFFF88")  ; first search match
      (bg-meta      "#E5E5E5")  ; tertiary context / meta information
      (bg-region    "#BBBBBB")  ; selection
      (fg           "#000000")  ; primary content
      (fg-light     "#777777")) ; secondary content

  (custom-theme-set-faces
   'typeset

   ;; standard
   `(font-lock-builtin-face       ((t (:foreground ,fg))))
   `(font-lock-comment-face       ((t (:foreground ,fg-light  ; to shift context
                                       :slant italic          ; to re-emphasize
                                       :width normal))))
   `(font-lock-constant-face      ((t (:foreground ,fg))))
   `(font-lock-doc-face           ((t (:inherit font-lock-string-face))))
   `(font-lock-function-name-face ((t (:foreground ,fg))))
   `(font-lock-keyword-face       ((t (:foreground ,fg :weight bold))))
   `(font-lock-string-face        ((t (:inherit fixed-pitch-serif
                                       ;:slant oblique
                                       :weight extra-light))))
   `(font-lock-type-face          ((t (:foreground ,fg))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(font-lock-warning-face       ((t (:inherit warning))))
   `(match  ((t (:background ,bg-match))))
   `(region ((t (:foreground ,fg :background ,bg-region :extend t))))
   `(line-number ((t (:background ,bg-alt)))) ;;; not sure about this yet...

   ;; company
   `(company-scrollbar-bg       ((t (:inherit fixed-pitch
                                     :background ,bg-meta))))
   `(company-scrollbar-fg       ((t (:inherit fixed-pitch
                                     :background ,bg-region))))
   `(company-tooltip            ((t (:inherit fixed-pitch
                                     :background ,bg-alt))))
   `(company-tooltip-annotation ((t (:inherit fixed-pitch
                                     :foreground ,fg-light
                                     :slant oblique))))
   `(company-tooltip-common     ((t (:inherit fixed-pitch
                                     :foreground ,fg
                                     :weight bold))))
   `(company-tooltip-selection  ((t (:inherit fixed-pitch
                                     :background ,bg-hl-line
                                     :foreground ,fg))))

   ;; dired
   `(diredfl-date-time   ((t (:foreground ,fg-light))))
   `(diredfl-dir-heading ((t (:background ,bg-meta
                              :foreground ,fg
                              :underline ,fg))))
   `(diredfl-dir-name    ((t (:background nil
                              :foreground ,fg
                              :weight extra-bold))))
   `(diredfl-file-name   ((t (:foreground ,fg))))
   `(diredfl-file-suffix ((t (:foreground ,fg))))
   `(diredfl-dir-priv    ((t (:background nil :weight ultra-bold))))
   `(diredfl-exec-priv   ((t (:background nil))))
   `(diredfl-no-priv     ((t (:background nil))))
   `(diredfl-number      ((t (:foreground ,fg))))
   `(diredfl-rare-priv   ((t (:background nil :weight ultra-bold))))
   `(diredfl-read-priv   ((t (:background nil))))
   `(diredfl-symlink     ((t (:inherit link :underline nil))))
   `(diredfl-write-priv  ((t (:background nil))))

   ;; doom
   `(doom-dashboard-loaded     ((t (:inherit default :foreground ,fg-light))))
   `(doom-dashboard-banner     ((t (:inherit doom-dashboard-loaded))))
   `(doom-modeline-project-dir ((t (:width normal))))
   `(doom-modeline-project-root-dir ((t (:width normal :weight bold))))
   `(doom-modeline-buffer-file ((t (:width normal :weight bold))))
   `(doom-modeline-buffer-path ((t (:width normal :weight bold))))
   `(doom-modeline-buffer-major-mode ((t (:width normal :weight bold))))
   `(doom-modeline-buffer-minor-mode ((t (:width normal))))
   `(doom-modeline-info ((t (:width normal :inherit (success bold)))))
   `(doom-modeline-highlight ((t (:width normal))))
   `(doom-modeline-emphasis ((t (:width normal :weight bold))))

   ;; eglot
   `(eglot-highlight-symbol-face ((t (:inherit highlight))))

   ;; ein
   `(ein:cell-input-area ((t (:background ,bg-alt))))

   ;; flycheck
   `(flycheck-fringe-warning ((t (:foreground ,fg-light))))
   `(flycheck-warning        ((t (:underline (:color ,fg-light :style wave)))))

   ;; git-gutter-fr
   `(git-gutter-fr:modified ((t (:foreground ,fg-light))))

   ;; hl-line
   `(hl-line ((t (:background ,bg-hl-line))))

   ;; isearch
   `(isearch ((t (:inherit match))))

   ;; ivy
   `(ivy-current-match ((t (:background ,bg-hl-line :foreground ,fg))))
   `(ivy-org           ((t (:inherit fixed-pitch))))

   ;; javascript
   `(js2-function-param ((t (:slant oblique))))

   ;; latex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-italic-face ((t (:inherit italic))))
   `(font-latex-sectioning-5-face ((t (:inherit variable-pitch))))
   `(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
   `(font-latex-math-face ((t (:foreground ,fg))))
   `(font-latex-script-char-face ((t (:inherit font-lock-keyword-face))))

   ;; lisp
   `(highlight-quoted-symbol ((t (:foreground ,fg))))
   `(highlight-quoted-quote  ((t (:inherit font-lock-builtin-face))))

   ;; lsp-mode
   `(lsp-details-face ((t (:inherit variable-pitch :foreground ,fg-light :background ,bg-alt :height .8))))

   ;; magit
   `(magit-section-heading           ((t (:foreground ,fg :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,fg))))
   `(magit-section-title             ((t (:foreground ,fg :weight bold))))

   ;; markdown
   `(markdown-code-face             ((t (:inherit fixed-pitch
                                         :background ,bg-alt
                                         :extend t))))
   `(markdown-header-face-1         ((t (:height 1.50 :weight extra-bold))))
   `(markdown-header-face-2         ((t (:height 1.40 :weight bold))))
   `(markdown-header-face-3         ((t (:height 1.30 :weight bold))))
   `(markdown-header-face-4         ((t (:height 1.20 :weight bold))))
   `(markdown-header-face-5         ((t (:height 1.10 :weight bold))))
   `(markdown-header-face-6         ((t (:height 1.00 :weight bold))))
   `(markdown-language-keyword-face ((t (:background nil :foreground ,fg-light))))
   `(markdown-markup-face           ((t (:inherit fixed-pitch
                                         :background nil
                                         :foreground ,fg-light))))

   ;; minibuffer
   `(minibuffer-prompt ((t (:inherit fixed-pitch
                            :background ,bg-meta
                            :foreground ,fg))))

   ;; mode-line (inspired by modus operandi)
   `(mode-line           ((t (:background "#D7D7D7" :overline "#999999"))))
   `(mode-line-emphasis  ((t (:inherit bold))))
   `(mode-line-highlight ((t (:box (:line-width -1 :style pressed-button)))))
   `(mode-line-inactive  ((t (:foreground "#404148"
                              :background "#EFEFEF"
                              :overline "#999999"))))

   ;; org
   `(org-code             ((t (:inherit fixed-pitch :background ,bg-alt))))
   `(org-block            ((t (:inherit fixed-pitch :background ,bg-alt))))
   `(org-block-begin-line ((t (:inherit fixed-pitch :background ,bg-meta))))
   `(org-block-end-line   ((t (:inherit org-block-begin-line))))
   `(org-checkbox         ((t (:inherit fixed-pitch))))
   `(org-date             ((t (:inherit fixed-pitch :foreground ,fg-light))))
   `(org-document-title   ((t (:height 2.0 :weight bold))))
   `(org-document-info    ((t (:foreground ,fg-light))))
   `(org-done             ((t (:inherit fixed-pitch))))
   `(org-drawer           ((t (:foreground ,fg-light :weight bold))))
   `(org-formula          ((t (:inherit org-table))))
   `(org-headline-done    ((t (:foreground ,fg-light
                               :weight normal
                               :strike-through t))))
   `(org-hide             ((t (:inherit fixed-pitch))))
   `(org-level-1          ((t (:height 1.50 :weight bold))))
   `(org-level-2          ((t (:height 1.30 :weight bold))))
   `(org-level-3          ((t (:height 1.10 :weight semi-bold))))
   `(org-level-4          ((t (:height 1.00 :weight semi-bold))))
   `(org-level-5          ((t (:height 1.00 :weight semi-bold))))
   `(org-level-6          ((t (:height 1.00 :weight semi-bold))))
   `(org-meta-line        ((t (:inherit fixed-pitch :foreground ,fg-light))))
   `(org-priority         ((t (:inherit fixed-pitch))))
   `(org-special-keyword  ((t (:inherit fixed-pitch))))
   `(org-table            ((t (:inherit fixed-pitch :foreground ,fg))))
   `(org-tag              ((t (:inherit fixed-pitch :foreground ,fg-light))))
   `(org-todo             ((t (:inherit fixed-pitch ))))
   `(org-verbatim         ((t (:inherit fixed-pitch))))

   ;; org agenda
   `(org-agenda-date       ((t (:foreground ,fg-light :background ,bg-alt))))
   `(org-agenda-date-today ((t (:foreground ,fg :weight bold :height 1.2))))
   `(org-agenda-structure  ((t (:foreground ,fg :weight bold))))
   `(org-date              ((t (:foreground ,fg-light))))
   `(org-date-selected     ((t (:inherit highlight))))
   `(org-upcoming-deadline ((t (:foreground ,fg))))
   `(org-warning           ((t (:foreground ,fg-light :weight bold))))

   ;; racket
   `(racket-selfeval-face ((t :inherit ,font-lock-constant-face)))

   ;; rainbow delimiters -- note that colors run opposite of weight
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,fg
                                          :weight light))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,fg
                                          :weight semi-bold))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,fg
                                          :weight ultra-bold))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,fg-light
                                          :weight light))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,fg-light
                                          :weight semi-bold))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,fg-light
                                          :weight ultra-bold))))

   ;; swiper
   `(swiper-match-face-3 ((t (:inherit highlight))))

   ;; tree-sitter syntax highlighting
   `(tree-sitter-hl-face:function.call       ((t (:slant italic :weight light))))
   `(tree-sitter-hl-face:method.call         ((t (:inherit tree-sitter-hl-face:function.call))))
   `(tree-sitter-hl-face:property            ((t (:slant oblique))))
   `(tree-sitter-hl-face:type                ((t (:weight bold))))
   `(tree-sitter-hl-face:punctuation.bracket ((t (:inherit tree-sitter-hl-face:keyword))))
   `(tree-sitter-hl-face:tag                 ((t (:inherit tree-sitter-hl-face:keyword))))

   ;; vterm
   `(term-color-blue    ((t (:background "#212121" :foreground "#212121"))))
   `(term-color-cyan    ((t (:background "#ACACAC" :foreground "#ACACAC"))))
   `(term-color-green   ((t (:background "#848484" :foreground "#848484"))))
   `(term-color-magenta ((t (:background "#BCBCBC" :foreground "#BCBCBC"))))
   `(term-color-red     ((t (:background "#CECECE" :foreground "#CECECE"))))
   `(term-color-yellow  ((t (:background "#424242" :foreground "#424242"))))

   ;; whichkey
   `(which-key-separator-face ((t (:inherit default))))

   ;; workspaces
   `(+workspace-tab-selected-face ((t (:background ,bg-region :foreground ,fg))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'typeset)

;;; typeset-theme.el ends here

;; Influences and Inspirations
;; ----------------------------------------------------------------------------------------------
;; Opinion Pieces
;; https://jameshfisher.com/2014/05/11/your-syntax-highlighter-is-wrong/
;; https://web.archive.org/web/20130125063318/https://kyleisom.net/blog/2012/10/17/syntax-off/
;; https://buttondown.email/hillelwayne/archive/syntax-highlighting-is-a-waste-of-an-information/
;; https://www.linusakesson.net/programming/syntaxhighlighting/
;;
;; Research Articles
;; https://hardware.slashdot.org/story/20/02/16/2041240/dark-mode-vs-light-mode-which-is-better
;;
;; Styling Direction
;; https://en.wikibooks.org/wiki/LaTeX/Algorithms#Typesetting_using_the_algorithm2e_package
;; https://codeyarns.wordpress.com/2012/06/29/inserting-an-algorithm-in-latex/
;; https://tex.stackexchange.com/questions/364595/latex-algorithm-standards
;; https://codereview.stackexchange.com/questions/112569/typesetting-a-in-latex-using-algorithm2e
;;
;; Other Great Themes
;; https://arxiv.org/abs/2008.06030
;; https://protesilaos.com/modus-themes/
;; https://github.com/11111000000/tao-theme-emacs
;; https://explog.in/notes/poet.html
;;
;; Special thanks to Xah Lee for clearing up some of the esoteric aspects of emacs
;; http://ergoemacs.org/emacs/elisp_define_face.html
;; http://ergoemacs.org/emacs_manual/elisp/Face-Attributes.html
