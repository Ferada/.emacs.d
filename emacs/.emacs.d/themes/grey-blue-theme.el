(deftheme grey-blue
  "Created 2012-04-28.")

(custom-theme-set-faces
 'grey-blue
 `(default ((t (:foreground "#b7af9f" :background "#020202"))))
 '(region ((t (:foreground "#abadde" :background "#2d2d3a"))))
 '(cursor ((t (:background "#d0d0df"))))
 '(mouse ((t (:background "#ffffff"))))

 '(mode-line ((t (:foreground "#e8d5c0" :background "#101010"))))
 '(mode-line-inactive ((t (:foreground "#e8d5c0" :background "#262626"))))
 '(mode-line-buffer-id ((t (:foreground "#e8d5c0"))))
 '(mode-line-mousable ((t (:foreground "#ff0000" :background "#00ff00")))) ; ???
 '(mode-line-mousable-minor-mode ((t (:foreground "#ff0000" :background "#ff0000")))) ; ???

 '(elscreen-tab-background-face ((t (:background "#101010"))))
 '(elscreen-tab-control-face ((t (:background "#101010"))))
 '(elscreen-tab-current-screen-face ((t (:foreground "#e8d5c0" :background "#101010"))))
 '(elscreen-tab-other-screen-face ((t (:foreground "#e8d5c0" :background "#262626"))))

 '(scroll-bar ((t (:foreground "#202020" :background "#020202"))))

 '(minibuffer-prompt ((t (:foreground "#cae6fc"))))
 '(tooltip ((t (:foreground "#b7af9f" :background "#090909"))))

 '(link ((t (:foreground "#5283cc"))))

 '(font-lock-builtin-face
   ((((class color) (min-colors 256))
     (:foreground "#707099"))
    (((class color) (min-colors 8))
     (:foreground "cyan" :weight bold))
    (t
     (:foreground "#707099")))
   nil
   "e.g. :keywords in lisp")

 '(font-lock-comment-face
   ((((class color) (min-colors 256))
     (:foreground "#545454"))
    (((class color) (min-colors 8))
     (:foreground "green"))
    (((class color) (min-colors 256))
     (:foreground "#545454"))))

 '(font-lock-constant-face ((t (:foreground "#6035b0")))) ; e.g. NULL

 '(font-lock-doc-string-face ((t (:foreground "#ff0000"))))    ; ???
 '(font-lock-function-name-face ((t (:foreground "#454e82")))) ; functions
 '(font-lock-keyword-face ((t (:foreground "#ffffff")))) ; language keywords
 '(font-lock-preprocessor-face ((t (:foreground "#8080a0")))) ; preprocessor
 '(font-lock-reference-face ((t (:fireground "#ffff00"))))    ; ???

 '(font-lock-string-face
   ((((class color) (min-colors 256))
     (:foreground "#747474"))
    (((class color) (min-colors 8))
     (:foreground "cyan"))
    (t (:foreground "#747474"))))

 '(font-lock-type-face ((t (:foreground "#58857b"))))          ; type
 '(font-lock-variable-name-face ((t (:foreground "#689c90")))) ; variables
 '(font-lock-warning-face ((t (:foreground "#d4002c")))) ; warnings

 '(isearch ((t (:foreground "#000000" :background "#ff0050"))))
 '(isearch-lazy-highlight-face ((t (:foreground "#000000" :background "#b30038"))))
 ;; (viper-search ((t (:foreground "#000000" :background "#ff0050"))))
 ;; (viper-replace-overlay ((t (:foreground "#000000" :background "#b30038"))))
 ;; (viper-replace-overlay-face ((t (:foreground "#ff0000" :background "#ff0000")))) ; ???
 ;; (viper-minibuffer-insert ((t (nil))))
 ;; (viper-minibuffer-vi ((t (nil))))

 ;;(ispell-face ((t (:foreground "#0000ff")))) ; ???

 '(highlight ((t (:foreground "#000000" :background "#e80049"))))
 ;;(highlight-face ((t (:foreground "#ff0000")))) ; ???
 ;;(highlight-changes-delete-face ((t (:foreground "#ff0000")))) ; ???
 ;;(highlight-changes-face ((t (:foreground "#ff0000")))) ; ???
 '(paren-face ((t (:foreground "#ff0000" :background "#ff0000")))) ; ???
 ;;(paren-face-match)
 ;;(paren-face-mismatch)
 ;;(paren-face-nomatch)

 '(fringe ((t (:foreground "#d0d0df" :background "#090910")))) ; text field border

 '(linum
   ((((class color) (min-colors 256))
     (:foreground "#b2b2b2" :background "#080808"))
    (t (:foreground "#b7af9f" :background "#090910"))))

 '(linum-relative-current-face
   ((((class color) (min-colors 256))
     (:foreground "#b2b2b2" :background "#262626"))
    (t (:foreground "#b7af9f" :background "#282833"))))

 '(underline ((t (:underline t))))
 '(italic ((t (:italic t))))
 '(bold ((t (:bold t))))
 '(bold-italic ((t (:bold t :italic t))))

 '(ido-subdir ((t (:foreground "#5228cc"))))

 '(cperl-array-face ((t (:foreground "#b0007b"))))
 '(cperl-hash-face ((t (:foreground "#58857b"))))
 '(cperl-nonoverridable-face ((t (:foreground "#707099"))))

 '(py-pseudo-keyword-face ((t (:foreground "#707099"))))
 ;;(py-builtins-face)
 '(py-decorators-face ((t (:foreground "#b0007b"))))

 '(rst-level-1-face ((t (:foreground "#d4002c"))))
 '(rst-level-2-face ((t (:foreground "#cc0040"))))
 '(rst-level-3-face ((t (:foreground "#b0007b"))))
 '(rst-level-4-face ((t (:foreground "#454e82"))))
 '(rst-level-5-face ((t (:foreground "#707099"))))
 '(rst-level-6-face ((t (:foreground "#8080a0"))))

 '(slime-note-face ((t (:underline "#b0007b"))))
 '(slime-style-warning-face ((t (:underline "#9cbd19"))))
 '(slime-style-error-face ((t (:underline "#d92c1c"))))
 ;;(slime-repl-input-face ((t (nil)))) ; text input line
 '(slime-repl-inputed-output-face ((t (:foreground "#cc0040"))))
 '(slime-repl-prompt-face ((t (:foreground "#707099"))))
 '(slime-repl-output-face ((t (:foreground "#545454"))))
 '(slime-reader-conditional-face ((t (:foreground "#545454"))))

 '(makefile-space ((t (:background "#d4002c"))))

 '(mumamo-background-chunk-major ((t (:background "#020202"))))
 '(mumamo-background-chunk-submode1  ((t (:background "#020202"))))
 '(mumamo-background-chunk-submode2  ((t (:background "#020202"))))
 '(mumamo-background-chunk-submode3  ((t (:background "#020202"))))
 '(mumamo-background-chunk-submode4  ((t (:background "#020202"))))

 '(erb-face ((t (:background "#020202"))))

 '(column-marker-1 ((t (:background "#282848"))))
 '(column-marker-2 ((t (:background "#482828"))))
 '(column-marker-3 ((t (:background "#284828"))))

 '(isabelle-string-face ((t (:background "#282848")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'grey-blue)
