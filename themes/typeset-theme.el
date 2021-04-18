;; typeset-theme.el
;;
;; Author: Phillip Nguyen
;; Version: 0.1

(deftheme typeset
  "Syntax typesetting over syntax highlighting")

(setq x-underline-at-descent-line t)

(let ((fg           "#000000")
      (fg-light     "#777777")
      (bg-alt       "#F5F5F5")
      (bg-alt-meta  "#E5E5E5")
      (bg-highlight "#BBBBBB"))

  (custom-theme-set-faces
   'typeset

   ;; standard
   `(font-lock-function-name-face ((t (:foreground ,fg))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(font-lock-constant-face      ((t (:foreground ,fg))))
   `(font-lock-builtin-face       ((t (:foreground ,fg))))
   `(font-lock-keyword-face       ((t (:foreground ,fg :weight bold))))
   `(font-lock-warning-face       ((t (:inherit warning))))
   `(font-lock-comment-face       ((t (:foreground ,fg-light ; to differentiate context
                                       :slant italic         ; then re-emphasize them
                                       :width normal))))
   `(font-lock-string-face        ((t (:inherit fixed-pitch-serif
                                       :slant oblique
                                       :weight light))))
   `(font-lock-type-face          ((t (:foreground ,fg))))
   `(font-lock-doc-face           ((t (:inherit font-lock-string-face))))
   `(region ((t (:foreground ,fg :background ,bg-highlight :extend t))))

   ;; company
   `(company-tooltip-selection ((t (:background ,bg-highlight :foreground ,fg))))
   `(company-tooltip           ((t (:background ,bg-alt))))
   `(company-scrollbar-fg      ((t (:background ,bg-highlight))))
   `(company-scrollbar-bg      ((t (:background ,bg-alt-meta))))
   `(company-tooltip-common    ((t (:foreground ,fg :weight bold))))

   ;; doom-modeline
   `(doom-modeline-project-dir ((t (:inherit doom-modeline-project-root-dir))))

   ;; ein
   `(ein:cell-input-area ((t (:background ,bg-alt))))

   ;; flycheck
   `(flycheck-warning        ((t (:underline (:color ,fg-light :style wave)))))
   `(flycheck-fringe-warning ((t (:foreground ,fg-light))))

   ;; git-gutter-fr
   `(git-gutter-fr:modified ((t (:foreground ,fg-light))))

   ;; hl-line
   `(hl-line ((t (:background ,bg-alt))))

   ;; ivy
   `(ivy-current-match ((t (:background ,bg-highlight :foreground ,fg))))

   ;; lisp
   `(highlight-quoted-symbol ((t (:foreground ,fg))))
   `(highlight-quoted-quote  ((t (:inherit default))))

   ;; magit
   `(magit-section-heading-selection ((t (:foreground ,fg))))
   `(magit-section-heading           ((t (:foreground ,fg :weight bold))))
   `(magit-section-title             ((t (:foreground ,fg :weight bold))))

   ;; markdown
   `(markdown-language-keyword-face ((t (:background nil :foreground ,fg-light))))
   `(markdown-markup-face           ((t (:inherit markdown-language-keyword-face))))
   `(markdown-code-face             ((t (:background ,bg-alt :extend t))))
   `(markdown-header-face-1         ((t (:height 1.50 :weight extra-bold))))
   `(markdown-header-face-2         ((t (:height 1.40 :weight bold))))
   `(markdown-header-face-3         ((t (:height 1.30 :weight bold))))
   `(markdown-header-face-4         ((t (:height 1.20 :weight bold))))
   `(markdown-header-face-5         ((t (:height 1.10 :weight bold))))
   `(markdown-header-face-6         ((t (:height 1.00 :weight bold))))

   ;; minibuffer
   `(minibuffer-prompt ((t (:background ,bg-alt-meta :foreground ,fg))))

   ;; mode-line (inspired by modus operandi)
   `(mode-line           ((t (:foreground "#0A0A0A"
                              :background "#D7D7D7"
                              :box (:line-width -1 :color "#505050")))))
   `(mode-line-inactive  ((t (:foreground "#404148"
                              :background "#EFEFEF"
                              :box (:line-width -1 :color "#BCBCBC")))))
   `(mode-line-emphasis  ((t (:inherit bold))))
   `(mode-line-highlight ((t (:box (:line-width -1 :style pressed-button)))))

   ;; org-mode
   `(org-block-begin-line ((t (:background ,bg-alt-meta))))
   `(org-block-end-line   ((t (:inherit org-block-begin-line))))
   `(org-block            ((t (:background ,bg-alt))))
   `(org-document-title   ((t (:height 1.50 :weight bold))))
   `(org-level-1          ((t (:height 1.30 :weight bold))))
   `(org-level-2          ((t (:height 1.10 :weight bold))))
   `(org-level-3          ((t (:height 1.00 :weight semi-bold))))
   `(org-level-4          ((t (:height 1.00 :weight semi-bold))))
   `(org-level-5          ((t (:height 1.00 :weight semi-bold))))
   `(org-level-6          ((t (:height 1.00 :weight semi-bold))))
   `(org-document-info    ((t (:foreground ,fg-light))))
   `(org-headline-done    ((t (:foreground ,fg-light
                               :weight normal
                               :strike-through t))))

   ;; racket
   `(racket-selfeval-face ((t :inherit ,font-lock-constant-face)))

   ;; rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground "#bfbfbf"))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground "#737373"))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,fg))))

   ;; workspaces
   `(+workspace-tab-selected-face ((t (:background ,bg-highlight :foreground ,fg))))
 ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'typeset)


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
;;
;; Special thanks to Xah Lee for clearing up some of the esoteric aspects of emacs
;; http://ergoemacs.org/emacs/elisp_define_face.html
;; http://ergoemacs.org/emacs_manual/elisp/Face-Attributes.html