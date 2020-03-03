;; -*- emacs-lisp -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PATHS

;; place backup files here, rather than sprinkling them everywhere.
(setq backup-directory-alist
      `((".*" . ,(expand-file-name
                  (concat user-emacs-directory "backups")))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; this is a single user workstation config, we don't need lockfiles
(setq create-lockfiles nil)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Under OSX, one must run:
;;
;; $ defaults write $HOME/.MacOSX/environment PATH "$PATH"
;;
;; ... whenever the path changes to ensure the path is available to
;; programs launched via Spotlight, the Dock, Finder, &c.

;; Under OSX, emacs does not have $PATH available when running as windowed app.
;; To remedy, this copies the full path over to emacs
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
