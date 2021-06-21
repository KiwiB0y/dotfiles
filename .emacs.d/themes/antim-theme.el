;;; antim-theme.el --- the dark theme created to save your eyes

;; Copyright 2021-present, All rights reserved
;; Code licensed under the GNU GPL v.3 license

;; Author: KiwiB0y
;; Version: 0.0.1
;; URL: https://github.com/KiwiB0y/antim-theme


;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; This file is not part of GNU Emacs.

;;; Comentary:

;; This theme is a GNU Emacs theme created by Kiwib0y
;; It's only GUI support for now

;;; Code:
(require 'cl-lib)
(deftheme antim)

(defgroup antim nil
  "Antim theme options.
Reload the theme after changing anything in this group."
  :group 'faces)

(defcustom antim-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'antim)

(defcustom antim-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'antim)

(defcustom antim-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'antim)

(defcustom antim-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'antim)

(defcustom antim-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'antim)

(defcustom antim-alternate-mode-line-and-minibuffer nil
  "Use less pink in the minibuffer."
  :type 'boolean
  :group 'antim)

(defvar antim-use-24-bit-colors-on-256-colors-terms nil)

(let ((colors '(;; Upstream theme color
                (antim-bg              "#231d27" "unspecified-bg")  ; official background
                (antim-fg              "#eeefff")                   ; official foreground
                (antim-current         "#18161b")                   ; official current-line/selection
                (antim-comment         "#696969")                   ; official comment
                (antim-string-cyan     "#affeff")                   ; official cyan
                (antim-green           "#296f68")                   ; official green
		(antim-light-green     "#75b9ab")                   ; official light-green
		(antim-cursor-green    "#0D493b")                   ; official cursor
                (antim-orange          "#ab873c")                   ; official orange
                (antim-pink            "#cf4a96")                   ; official pink
                (antim-purple          "#7d6691")                   ; official purple
                (antim-red             "#b22222")                   ; official red
                (antim-yellow          "#f0dc7d")                   ; official yellow

                ;; Other colors
                (bg2-dark-pink         "#452a3f")
                (fg2                   "#b6b6b2")
		(other-white           "#ddefff")
		(dark-blue             "#19537f")

		;; delimiters
		(antim-delimiter-one   "#cf4a96")
		(antim-delimiter-two   "#296f68")
		(antim-delimiter-three "#f0dc7d")
		(antim-delimiter-four  "#19537f")))

      (faces '(;; default themes
	       (default :foreground ,antim-fg :background ,antim-bg)
	       (cursor :background ,antim-cursor-green)
	       (fringe :background ,antim-bg :foreground ,fg2)


               (default-italic :slant italic)
               (ffap :foreground ,fg2)
               (fringe :background ,antim-bg :foreground ,fg2)
               (highlight :foreground ,antim-yellow :background ,antim-bg)
               (hl-line :background ,antim-current :extend t)
               (info-quoted-name :foreground ,antim-orange)
               (info-string :foreground ,antim-string-cyan)
               (lazy-highlight :foreground ,fg2 :background ,bg2-dark-pink)
               (link :foreground ,antim-yellow :underline t)
               (linum :slant italic :foreground ,antim-pink :background ,antim-bg)
               (line-number :slant italic :foreground ,antim-fg :background ,antim-bg)
               (match :background ,bg2-dark-pink :foreground ,antim-bg)
               (mode-line :background ,bg2-dark-pink :foreground ,antim-current)
	       (minibuffer-prompt
		,@(if antim-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground antim-fg)
                    (list :weight 'bold :foreground antim-pink)))
	       (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)

	       ; syntax
	       (font-lock-builtin-face :foreground ,antim-orange)
               (font-lock-comment-face :foreground ,antim-comment)
               (font-lock-comment-delimiter-face :foreground ,antim-comment)
               (font-lock-constant-face :foreground ,antim-string-cyan)
               (font-lock-doc-face :foreground ,antim-comment)
               (font-lock-function-name-face :foreground ,antim-pink :weight bold)
               (font-lock-keyword-face :weight bold :foreground ,antim-green)
               (font-lock-negation-char-face :foreground ,antim-string-cyan)
               (font-lock-preprocessor-face :foreground ,antim-orange)
               (font-lock-reference-face :foreground ,antim-string-cyan)
               (font-lock-regexp-grouping-backslash :foreground ,antim-string-cyan)
               (font-lock-regexp-grouping-construct :foreground ,antim-purple)
               (font-lock-string-face :foreground ,antim-yellow)
               (font-lock-type-face :foreground ,antim-purple)
               (font-lock-variable-name-face :foreground ,antim-fg
                                             :weight bold)
               (font-lock-warning-face :foreground ,antim-red :background ,bg2-dark-pink)

	       ;; rainbow-delimiter
	       (rainbow-delimiters-depth-1-face :foreground ,antim-delimiter-one)
               (rainbow-delimiters-depth-2-face :foreground ,antim-delimiter-two)
               (rainbow-delimiters-depth-3-face :foreground ,antim-delimiter-three)
               (rainbow-delimiters-depth-4-face :foreground ,antim-delimiter-four)
               (rainbow-delimiters-depth-5-face :foreground ,antim-delimiter-one)
               (rainbow-delimiters-depth-6-face :foreground ,antim-delimiter-two)
               (rainbow-delimiters-depth-7-face :foreground ,antim-delimiter-three)
               (rainbow-delimiters-depth-8-face :foreground ,antim-delimiter-four)
               (rainbow-delimiters-unmatched-face :foreground ,antim-orange :background ,bg2-dark-pink)

               ;; show-paren
               (show-paren-match-face :background ,dark-blue
                                      :foreground ,antim-yellow)
               (show-paren-match :background ,dark-blue
                                 :foreground ,antim-yellow)
               (show-paren-match-expression :inherit 'match)
               (show-paren-mismatch :inherit 'font-lock-warning-face)

	       ;; dired-directory
               (dired-directory :foreground ,antim-green :weight normal)
               (dired-flagged :foreground ,antim-pink)
               (dired-header :foreground ,antim-light-green
			     :weight bold :background ,antim-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,antim-fg :weight bold)
               (dired-marked :foreground ,antim-orange :weight bold)
               (dired-perm-write :foreground ,antim-fg :underline t)
               (dired-symlink :foreground ,antim-yellow :weight normal :slant italic)
               (dired-warning :foreground ,antim-orange :underline t)

               ;; company
               (company-echo-common :foreground ,antim-bg :background ,antim-fg)
               (company-preview :background ,dark-blue :foreground ,dark-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,antim-light-green)
               (company-preview-search :inherit company-preview
                                       :foreground ,antim-cursor-green)
               (company-scrollbar-bg :background ,antim-comment)
               (company-scrollbar-fg :foreground ,bg2-dark-pink)
               (company-tooltip :foreground ,antim-fg :background ,bg2-dark-pink)
               (company-tooltip-search :foreground ,antim-green
                                       :underline t) 
               (company-tooltip-search-selection :background ,antim-green
                                                 :foreground ,antim-current)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,antim-fg)
               (company-tooltip-common :foreground ,antim-light-green :weight bold)
               (company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,antim-string-cyan)
               (company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,bg2-dark-pink :background ,antim-orange)

               ;; org

               (org-formula :foreground ,antim-pink)
               (org-done :foreground ,antim-cursor-green)
               (org-hide :foreground ,antim-bg :background ,antim-bg)
               (org-ellipsis :foreground ,antim-pink)
               (org-document-title :weight bold :foreground ,antim-string-cyan
                                   ,@(when antim-enlarge-headings
                                       (list :height antim-height-doc-title)))
               (org-level-1 :inherit bold :foreground ,antim-green
                            ,@(when antim-enlarge-headings
                                (list :height antim-height-title-1)))
               (org-level-2 :inherit bold :foreground ,antim-light-green
                            ,@(when antim-enlarge-headings
                                (list :height antim-height-title-2)))
               (org-level-3 :weight normal :foreground ,antim-purple
                            ,@(when antim-enlarge-headings
                                (list :height antim-height-title-3)))
               (org-level-4 :weight normal :foreground ,dark-blue)
               (org-level-5 :weight normal :foreground ,antim-green)
               (org-level-6 :weight normal :foreground ,antim-light-green)
               (org-level-7 :weight normal :foreground ,antim-purple)
               (org-level-8 :weight normal :foreground ,dark-blue)
               (org-link :foreground ,antim-yellow :underline t))))

                 ;; (company-template-field           (:foreground kiwi-light-green :background nil :underline kiwi-green))
                 ;; (company-scrollbar-bg             (:background kiwi-comment-grey))
                 ;; (company-scrollbar-fg             (:foreground kiwi-light-green))
                 ;; (company-tooltip                  (:foreground kiwi-white :background kiwi-current-black))
                 ;; (company-tooltip-search           (:foreground kiwi-green :underline t))
                 ;; (company-tooltip-selection        (:inherit 'match))
                 ;; (company-tooltip-search-selection (:background kiwi-green :foreground kiwi-bg-purple))
                 ;; (company-tooltip-mouse            (:background kiwi-bg-purple))
                 ;; (company-tooltip-common           (:foreground kiwi-light-green :weight 'bold))
                 ;; (company-box                      (:foreground kiwi-light-green :weight 'bold))


  (apply #'custom-theme-set-faces
	 'antim
	 (let ((color-names (mapcar #'car colors))
	       (graphic-colors (mapcar #'cadr colors))
	       (expand-for-kind
		(lambda (kind spec)
		  (when (and (string= (symbol-name kind) "term-colors")
			     antim-use-24-bit-colors-on-256-colors-terms)
		    (setq kind 'graphic-colors))
		  (cl-progv color-names (symbol-value kind)
		    (eval `(backquote ,spec))))))
	   (cl-loop for (face . spec) in faces
		    collect `(,face
			      ((((min-colors 16777216)) ; fully graphical environment
				,(funcall expand-for-kind 'graphic-colors spec))))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'antim)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; antim-theme.el ends here
