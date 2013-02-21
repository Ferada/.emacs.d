;; turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(require 'cl)

(defvar systems
  '((straylight . "straylight.rentiernetz")
    (sprawl     . "SPRAWL")
    (goal-games . "EUGENB")))

(defvar system (car (rassoc system-name systems)))

(defvar emacs-dot-dir (expand-file-name "~/.emacs.d/"))

(add-to-list 'load-path emacs-dot-dir)

;; don't set via custom because it is a calculated value
(setf custom-theme-directory (expand-file-name "themes" emacs-dot-dir))

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

;; TODO: maybe move something interesting here
(global-unset-key (kbd "<insert>"))

(defalias 'yes-or-no-p 'y-or-n-p)

;; always require secrets to keep private stuff out of the custom variables
(require 'secrets)
