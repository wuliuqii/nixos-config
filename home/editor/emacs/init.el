;;; init.el --- The main entry for emacs -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Set bigger garbage collection threshold to startup times.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Increase how much is read from processes in a single chunk (default is 4kb).
(setq rad-process-output-max (* 4 1024 1024))

;; --debug-init implies `debug-on-error`.
(setq debug-on-error init-file-debug)

(provide 'init)
;;; init.el ends here
