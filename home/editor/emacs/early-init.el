;;; early-init.el --- Emacs pre-initialisation config -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

;; Faster to disable these here (before they've been initialized)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Set up fonts
(set-face-attribute 'default
		    nil
		    :height 180
		    :family "JetbrainsMono Nerd Font")
(set-face-attribute 'fixed-pitch nil :font "JetbrainsMono Nerd Font" :height 1.0)

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;; Stop reporting ccomp warnings
(setq native-comp-async-report-warnings-errors nil)

(provide 'early-init)
;;; early-init.el ends here

