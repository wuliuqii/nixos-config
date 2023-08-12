;;; init.el --- The main entry for emacs -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Set bigger garbage collection threshold to startup times.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Increase how much is read from processes in a single chunk (default is 4kb).
(setq read-process-output-max (* 4 1024 1024))

;; Ignore all the file local variables.
(setq enable-local-variables nil)

;; --debug-init implies `debug-on-error`.
(setq debug-on-error init-file-debug)

(let ((lispDir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory lispDir))
  (add-to-list 'load-path (file-name-as-directory (expand-file-name "lang" lispDir))))

(require 'init-package)
(require 'init-base)
(require 'init-ui)
(require 'init-tools)
(require 'init-lsp)
(require 'init-dev)
(require 'init-evil)
(require 'init-git)
(require 'init-minibuffer)
(require 'init-dired)
(require 'init-text)
(require 'init-org)
(require 'init-spell)
(require 'init-keybindings)

(provide 'init)

;;; init.el ends here
