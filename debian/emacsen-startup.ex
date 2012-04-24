;; -*-emacs-lisp-*-
;;
;; Emacs startup file, e.g.  /etc/emacs/site-start.d/50erlang-otp-r15b01.el
;; for the Debian erlang-otp-r15b01 package
;;
;; Originally contributed by Nils Naumann <naumann@unileoben.ac.at>
;; Modified by Dirk Eddelbuettel <edd@debian.org>
;; Adapted for dh-make by Jim Van Zandt <jrv@debian.org>

;; The erlang-otp-r15b01 package follows the Debian/GNU Linux 'emacsen' policy and
;; byte-compiles its elisp files for each 'emacs flavor' (emacs19,
;; xemacs19, emacs20, xemacs20...).  The compiled code is then
;; installed in a subdirectory of the respective site-lisp directory.
;; We have to add this to the load-path:
(let ((package-dir (concat "/usr/share/"
                           (symbol-name flavor)
                           "/site-lisp/erlang-otp-r15b01")))
;; If package-dir does not exist, the erlang-otp-r15b01 package must have
;; removed but not purged, and we should skip the setup.
  (when (file-directory-p package-dir)
    (setq load-path (cons package-dir load-path))
    (autoload 'erlang-otp-r15b01-mode "erlang-otp-r15b01-mode"
      "Major mode for editing erlang-otp-r15b01 files." t)
    (add-to-list 'auto-mode-alist '("\\.erlang-otp-r15b01$" . erlang-otp-r15b01-mode))))

