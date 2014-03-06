;; turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(require 'cl)

(setf lexical-binding t)

(defvar systems
  '((straylight . "straylight.rentiernetz")
    (sprawl     . "SPRAWL")
    (goal-games . "EUGENB")
    (macrolet . "macrolet.net")))

(defvar system (car (rassoc system-name systems)))

(defvar emacs-dot-dir (expand-file-name "~/.emacs.d/"))

(add-to-list 'load-path emacs-dot-dir)

;; don't set via custom because it is a calculated value
(setf custom-theme-directory (expand-file-name "themes" emacs-dot-dir))
(setf custom-theme-load-path '(custom-theme-directory t))

(if (string-lessp emacs-version "24")
    (load-theme 'grey-blue)
  (load-theme 'grey-blue t))

(case system
  (straylight
   (set-frame-font "Bitstream Vera Sans Mono-7.5" t))
  (goal-games
   (set-frame-font "Consolas-10.0" t))
  (sprawl
   (set-frame-font "Consolas-9.0" t))
  (t
   (when (string-lessp emacs-version "23")
     (set-default-font "6x12" t))))

(case system-type
  (windows-nt
   (scroll-bar-mode -1)))

(defmacro when-file-available (pathname &rest body)
  "Run BODY if the PATHNAME (base directory is \"~/.emacs.d/~\") is
readable."
  (declare (indent defun))
  (let ((sym (gensym)))
    `(let ((,sym (expand-file-name ,pathname emacs-dot-dir)))
       (when (file-readable-p ,sym)
         ,@body))))

(defmacro when-dir-available (pathname &rest body)
  "Run BODY if the PATHNAME (base directory is \"~/.emacs.d/~\") is
readable and adds it to the LOAD-PATH variable."
  (declare (indent defun))
  (let ((sym (gensym)))
    `(let ((,sym (expand-file-name ,pathname emacs-dot-dir)))
       (when (file-readable-p ,sym)
         (add-to-list 'load-path ,sym)
         ,@body))))

(defmacro add-hook-body (hook &rest body)
  "Runs BODY using ADD-HOOK on HOOK."
  (declare (indent defun))
  `(add-hook ,hook (lambda () ,@body)))

(setf custom-file (expand-file-name "custom.el" emacs-dot-dir))

(load custom-file)

(when (eq system 'straylight)
  (require 'site-gentoo))

(global-set-key (kbd "M-n") 'hippie-expand)
(global-set-key (kbd "C-c M-n") 'hippie-expand)

(unless (eq system 'straylight)
  (when-dir-available "smex"
    (require 'smex)
    (smex-initialize)

    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    ;; This is your old M-x.
    (global-set-key (kbd "C-c M-x") 'execute-extended-command)))

(when-dir-available "undo-tree"
  (require 'undo-tree)
  (global-undo-tree-mode))

(when-dir-available "evil"
  (require 'evil)
  (evil-mode 1)

  (evil-define-command evil-show-buffers ()
    "Shows the buffer-list."
    :repeat nil
    (list-buffers))

  (when-dir-available "evil-numbers"
    (require 'evil-numbers)
    (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
    (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)))

(when-file-available "column-marker.el"
  (require 'column-marker)

  (when-file-available "popup-ruler.el"
    (require 'popup-ruler)
    (global-set-key [f10] 'popup-ruler)
    (global-set-key [S-f10] 'popup-ruler-vertical)))

(when-dir-available "elscreen"
  (require 'elscreen)
  (elscreen-start)
  (global-set-key [f11] 'elscreen-previous)
  (global-set-key [f12] 'elscreen-next)
  (global-set-key [XF86Back] 'elscreen-previous)
  (global-set-key [XF86Forward] 'elscreen-next)
  (global-set-key [S-f12] 'elscreen-create)
  (global-set-key [C-f12] 'elscreen-kill))

(when-dir-available "darkroom-mode"
  (autoload 'darkroom-mode "darkroom-mode" "Distraction free editing mode." t)

  (eval-after-load "darkroom-mode"
    '(progn
       (setf darkroom-mode-left-margin 100
             darkroom-mode-right-margin 100))))

(when-dir-available "slime"
  (require 'slime-autoloads)
  (slime-setup
   '(slime-fancy
     slime-asdf
     slime-tramp
     slime-presentations
     slime-indentation))
  (setf lisp-lambda-list-keyword-parameter-alignment t)
  (setf lisp-lambda-list-keyword-alignment t)

  ;; TODO: still need paredit-newline with evil?
  (eval-after-load "slime"
    '(progn
       (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
       (define-key slime-repl-mode-map (kbd "C-c C-k") 'slime-repl-kill-input)
       (define-key slime-parent-map (kbd "C-c s") 'slime-selector)
       (define-key slime-parent-map (kbd "C-:") 'slime-edit-definition)))

  (defun slime-local (port)
    (interactive "P")
    (let ((args '(4005)))
      (when port
        (let ((interactive (copy-list (cadr (interactive-form 'slime-connect)))))
          (setf (cdr interactive) (cddr interactive)
                args (eval interactive))))
      (apply 'slime-connect "127.0.0.1" args))))

(case system
  (straylight
   (setf inferior-lisp-program "/usr/bin/sbcl"))
  (sprawl
   (setf inferior-lisp-program "E:\\Programme\\sbcl\\sbcl")))

(unless (eq system 'straylight)
  (when-dir-available "paredit"
    (autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)
    (let ((turn-on-paredit-mode (lambda () (paredit-mode 1))))
      ;; some hooks: lisp-mode-hook and scheme-mode-hook are recommended
      ;; in the paredit source code
      (add-hook 'lisp-mode-hook turn-on-paredit-mode)
      (add-hook 'scheme-mode-hook turn-on-paredit-mode)
      (add-hook 'emacs-lisp-mode-hook turn-on-paredit-mode)
      (add-hook 'slime-mode-hook turn-on-paredit-mode))))

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map [(meta control shift up)] 'paredit-convolute-sexp)
     ;; (define-key paredit-mode-map (kbd "{") 'paredit-open-curly)
     ;; (define-key paredit-mode-map (kbd "}") 'paredit-close-curly)
     ;; (modify-syntax-entry ?\{ "(}" lisp-mode-syntax-table)
     ;; (modify-syntax-entry ?\} "){" lisp-mode-syntax-table)
     (modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
     (modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)
     (modify-syntax-entry ?\[ "(]" lisp-interaction-mode-syntax-table)
     (modify-syntax-entry ?\] ")[" lisp-interaction-mode-syntax-table)

     (when (featurep 'eldoc)
       (eldoc-add-command
        'paredit-backward-delete
        'paredit-close-round))))

(when-dir-available "redshank"
  (require 'redshank-loader)
  (redshank-setup
   '(lisp-mode-hook
     scheme-mode-hook
     emacs-lisp-mode-hook
     slime-repl-mode-hook)
   t))

(when-file-available "window-numbering.el"
  (require 'window-numbering)
  (window-numbering-mode t))

(when (featurep 'bbdb)
  (setf bbdb-anniversary-format-alist '(("birthday" . "Birthday: %s (%d%s)")
                                        ("wedding" . "%s's %d%s wedding anniversary")
                                        ("obit" . "Anniversary of death: %s (%d%s)"))
        bbdb-check-zip-codes-p t
        bbdb-default-country "Germany"
        bbdb-north-american-phone-numbers-p nil))

(when (featurep 'eldoc)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))

(when (featurep 'semantic)
  (add-hook 'emacs-lisp-mode-hook 'semantic-default-elisp-setup))

(when-dir-available "markdown-mode"
  (autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
  (add-hook-body 'markdown-mode-hook
    (auto-fill-mode 1)))

(unless (version< emacs-version "23.2")
  (when-dir-available "git-modes"
    (when-dir-available "magit"
      (require 'magit))))

(when-dir-available "haskell-mode"
  (require 'haskell-mode-autoloads))

(when-dir-available "clojure-mode"
  (autoload 'clojure-mode "clojure-mode" "Clojure" t)
  (add-to-list 'auto-mode-alist '("\\.clj[sx]?\\'" . clojure-mode))
  (add-hook 'clojure-mode-hook 'paredit-mode))

(defun reset-scratch-message ()
  (setf initial-scratch-message
        (format ";; scratch buffer created %s\n\n"
                (format-time-string "%Y-%m-%d at %T"))))

(defun insert-scratch-message ()
  (insert (reset-scratch-message)))

(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (reset-scratch-message)
  (insert-scratch-message)
  ;; Since we killed it, don't let caller do that.
  (values))

;; If the *scratch* buffer is killed, recreate it automatically
;; FROM: Morten Welind
;; http://www.geocrawler.com/archives/3/338/1994/6/0/1877802/
(with-current-buffer (get-buffer-create "*scratch*")
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))

(setf column-number-mode t)
(setf indent-tabs-mode nil)

;; TODO: maybe move something interesting here
(global-unset-key (kbd "<insert>"))

(defalias 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; always require secrets to keep private stuff out of the custom variables
(ignore-errors (load-library "secrets.el.gpg"))
