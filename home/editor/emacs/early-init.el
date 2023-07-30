;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Disable GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)
(setq confirm-kill-emacs 'y-or-n-p)

;; Hide the startup screen
(setq inhibit-startup-screen t
  initial-scratch-message nil)

;;; early-init.el ends here
