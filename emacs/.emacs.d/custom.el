(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ack-mode-extension-alist (quote ((lisp-mode "lisp" "asd" "cl" "bil"))))
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote w3m-browse-url))
 '(calendar-week-start-day 1)
 '(confirm-nonexistent-file-or-buffer nil)
 '(cscope-do-not-update-database t)
 '(css-indent-offset 2)
 '(diary-display-function (quote (fancy-diary-display)))
 '(diary-list-entries-hook
   (quote
    (include-other-diary-files bbdb-include-anniversaries sort-diary-entries)))
 '(dired-dwim-target t)
 '(display-time-world-list
   (quote
    (("America/Los_Angeles" "Seattle")
     ("America/New_York" "New York")
     ("Europe/London" "London")
     ("Europe/Berlin" "Berlin")
     ("Asia/Calcutta" "Bangalore")
     ("Asia/Tokyo" "Tokyo"))))
 '(erc-auto-query (quote window-noselect))
 '(erc-generate-log-file-name-function (quote erc-generate-log-file-name-short))
 '(erc-header-line-format nil)
 '(erc-hide-list (quote ("JOIN" "PART" "QUIT" "MODE")))
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols keep-place list log match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-prompt-for-nickserv-password nil)
 '(erc-server nil)
 '(erc-services-mode t)
 '(erc-track-showcount t)
 '(erc-track-when-inactive t)
 '(european-calendar-style t)
 '(fill-column 72)
 '(font-lock-verbose nil)
 '(fringe-mode nil nil (fringe))
 '(glasses-separator "-")
 '(glasses-uncapitalize-p t)
 '(global-whitespace-mode t)
 '(gnus-article-prepare-hook
   (lambda nil
     (setq fill-column 120)
     (setq w3m-fill-column fill-column)))
 '(gnus-article-skip-boring t)
 '(gnus-boring-article-headers
   (quote
    (empty newsgroups to-address to-list cc-list followup-to reply-to long-header)))
 '(gnus-cite-blank-line-after-header nil)
 '(gnus-default-article-saver (quote gnus-summary-save-in-mail))
 '(gnus-group-mode-hook (quote (gnus-topic-mode gnus-agent-mode)))
 '(gnus-message-archive-method "archive")
 '(gnus-summary-expunge-below -50000)
 '(gnus-treat-date-lapsed (quote head))
 '(gnus-treat-date-local (quote head))
 '(gnus-treat-fill-long-lines t)
 '(gnus-treat-hide-boring-headers (quote head))
 '(gnus-treat-strip-leading-blank-lines t)
 '(gnus-treat-strip-multiple-blank-lines t)
 '(gnus-visible-headers
   (quote
    ("^From:" "^Newsgroups:" "^Subject:" "^Date:" "^Followup-To:" "^Reply-To:" "^Summary:" "^Keywords:" "^To:" "^[BGF]?Cc:" "^Posted-To:" "^Mail-Copies-To:" "^Mail-Followup-To:" "^Apparently-To:" "^Gnus-Warning:" "^Resent-From:" "^X-Sent:" "^X-CRM114-Notice:")))
 '(haskell-font-lock-symbols nil)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indentation turn-on-eldoc-mode turn-on-haskell-doc-mode turn-on-haskell-decl-scan)))
 '(holiday-other-holidays
   (quote
    ((holiday-fixed 5 1 "Labour Day")
     (holiday-fixed 12 26 "St Stephen's Day")
     (holiday-fixed 10 3 "German Unity Day")
     (holiday-fixed 10 31 "Reformation Day")
     (holiday-float 11 3 -1 "Day of Repentance and Prayer" 22)
     (holiday-easter-etc 0 "Easter Day")
     (holiday-easter-etc 1 "Easter Monday")
     (holiday-easter-etc 39 "Ascension Day")
     (holiday-easter-etc 49 "Pentecost (Whitsunday)")
     (holiday-easter-etc 50 "Whit Monday"))))
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote right))
 '(inform-interpreter-command "zoom" t)
 '(inform-interpreter-is-graphical t t)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js2-basic-offset 2)
 '(line-move-visual nil)
 '(linum-relative-current-symbol "")
 '(markdown-command "markdown_py")
 '(menu-bar-mode nil)
 '(message-sendmail-envelope-from (quote header))
 '(mm-automatic-display
   (quote
    ("text/plain" "text/enriched" "text/richtext" "text/html" "text/x-verbatim" "text/x-vcard" "image/.*" "message/delivery-status" "multipart/.*" "message/rfc822" "text/x-patch" "text/dns" "application/emacs-lisp" "application/x-emacs-lisp" "application/x-pkcs7-mime" "application/pkcs7-mime" "application/pgp")))
 '(muse-mode-hook (quote (turn-on-auto-fill)))
 '(pgg-cache-passphrase nil)
 '(pgg-encrypt-for-me nil)
 '(prolog-program-name
   (quote
    (((getenv "EPROLOG")
      (eval
       (getenv "EPROLOG")))
     (eclipse "eclipse")
     (mercury nil)
     (sicstus "sicstus")
     (swi "swipl")
     (gnu "gprolog")
     (yap "yap")
     (t "prolog"))))
 '(prolog-system (quote swi))
 '(python-indent-guess-indent-offset nil)
 '(savehist-mode t nil (savehist))
 '(send-mail-function (quote sendmail-send-it))
 '(shimbun-use-local t t)
 '(slime-sbcl-manual-root "/usr/share/doc/sbcl-1.0.30/html/sbcl/")
 '(smex-auto-update nil)
 '(stripe-height 3)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(w3m-fill-column fill-column)
 '(w3m-use-cookies t)
 '(whitespace-global-modes (quote (not customize-mode gnus-summary-mode dired-mode)))
 '(whitespace-style
   (quote
    (face trailing space-before-tab indentation empty space-after-tab))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
