;;; init-base.el --- The necessary settings -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; Suppress GUI features and more.
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-default-init t
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-buffer-menu t)

;; Pixelwise resize
(setq window-resize-pixelwise t
      frame-resize-pixelwise t)

;; Optimize for evry long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; No backup files
(setq make-backup-files nil
      auto-save-default nil)

;; No lock files
(setq create-lockfiles nil)

;; Always load the newest file
(setq load-prefer-newer t)

;; Cutting and pasting use primary/clipboard
(setq select-enable-primary t
      select-enable-clipboard t)

;; No gc for font caches
(setq inhibit-compacting-font-caches t)

;; Improve display
(setq display-raw-bytes-as-hex t
      redisplay-skip-fontification-on-input t)

;; No annoying bell
(setq ring-bell-function 'ignore)

;; No eyes distraction
(setq blink-cursor-mode nil)

;; Smooth scrool & friends
(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-preserve-screen-position 'always)

;; The nano style for truncated long lines.
(setq auto-hscroll-mode 'current-line)

;; Displa auto vertical scroll for tall lines
(setq auto-window-vscroll nil)

;; Don't move points out of eyes
(setq mouse-yank-at-point t)

(setq-default fill-column 80)

;; No tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Sane defaults
(setq use-short-answers t)

;; Inhibit switching out from `y-or-n-p' and `read-char-choice'
(setq y-or-n-p-use-read-key t
      confirm-kill-emacs 'yes-or-no-p
      read-char-choice-use-read-key t)

;; Highlight parenthesises
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :custom
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t))

;; Show line/column number and more
(use-package simple
  :ensure nil
  :custom
  (line-number-mode t)
  (column-number-mode t)
  (size-indication-mode t)
  ;; no visual feedback on copy/delete
  (copy-region-blink-delay 0)
  (delete-pair-blink-delay 0)
  ;; confusing if no fringes.
  (visual-line-fringe-indicators '(nil right-curly-arrow))
  ;; don't save current clipboard text before replacing it
  (save-interprogram-paste-before-kill nil)
  ;; eliminate duplicates
  (kill-do-not-save-duplicates t)
  ;; include `\n' when point starts at the beginning-of-line
  (kill-whole-line t)
  ;; show cwd when `shell-command' and `async-shell-command'
  (shell-command-prompt-show-cwd t)
  ;; show the name of character in `what-cursor-position'
  (what-cursor-show-names t)
  ;; list only applicable command
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Type text
(use-package text-mode
  :ensure nil
  :custom
  ;; better word wrapping for CJK characters
  (word-wrap-by-category t)
  ;; paragraphs
  (sentence-end-double-space  nil))

;; Back to previous position
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; Highlight current line in GUI
(use-package hl-line
  :ensure nil
  :when (display-graphic-p)
  :hook (after-init . global-hl-line-mode))

;;Enable `repeat-mode' to reduce key sequence length
(use-package repeat
  :ensure nil
  :custom
  (repeat-mode t)
  (repeat-exit-timeout 3)
  (repeat-exit-key (kbd "RET")))

;; Server mode
(use-package server
  :ensure nil
  :hook (after-init . server-mode))

;; Workaround with minified source files
(use-package so-long
  :ensure nil
  :hook (after-init . global-so-long-mode))

;; Completion engine
(use-package minibuffer
  :ensure nil
  :bind (:map minibuffer-local-map
	      ([escape] . abort-recursive-edit)
	      :map minibuffer-local-ns-map
	      ([escape] . abort-recursive-edit)
	      :map minibuffer-local-completion-map
	      ([escape] . abort-recursive-edit)
	      :map minibuffer-local-must-match-map
	      ([escape] . abort-recursive-edit)
	      :map minibuffer-local-isearch-map
	      ([escape] . abort-recursive-edit))
  :custom
  (completion-auto-help t)
  (completion-show-help nil)
  (completion-cycle-threshold nil)
  (completion-auto-select 'second-tab)
  (enable-recursive-minibuffers t)
  ;; shorten " (default %s)" => " [%s]"
  (minibuffer-default-prompt-format " [%s]")
  (minibuffer-electric-default-mode t)
  ;; don't insert completion at point into minibuffer
  (minibuffer-completion-auto-choose nil)
  ;; One frame one minibuffer
  (minibuffer-follows-selected-frame nil)
  ;; Ignore cases when compete
  (completion-ignore-case t)
  (read-buffer-ccompletion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic partial-completion substring flex))
  (completion-category-overrides '((buffer (styles . (flex)))))
  ;; vertical view
  (completions-format 'one-column)
  (completion-max-height 13)
  (completions-detailed t))

(use-package newcomment
  :ensure nil
  :bind ([remap comment-dwim] . comment-or-uncomment)
  :config
  (defun comment-or-uncomment ()
    "Comment or uncomment the current line or region.

If the region is active and `transient-mark-mode' is on, call
`comment-or-uncomment-region'.
Else, if the current line is empty, insert a comment and indent
it.
Else, call `comment-or-uncomment-region' on the current line."
    (interactive)
    (if (region-active-p)
        (comment-or-uncomment-region (region-beginning) (region-end))
      (if (save-excursion
            (beginning-of-line)
            (looking-at "\\s-*$"))
          (comment-dwim nil)
        (comment-or-uncomment-region (line-beginning-position) (line-end-position)))))
  :custom
  ;; `auto-fill' inside comments.
  ;;
  ;; The quoted text in `message-mode' are identified as comments, so only
  ;; quoted text can be `auto-fill'ed.
  (comment-auto-fill-only-comments t))

;; Better abbrev expansion
(use-package hippie-exp
  :ensure nil
  :bind ([remap dabbrev-expand] . hippie-expand)
  :config
  (defun try-expand-tempo (_old)
    (require 'tempo)
    (tempo-expand-if-complete))
  :custom
  (hippie-expand-try-functions-list '(try-expand-tempo
				      try-expand-dabbrev
				      try-expand-dabbrev-all-buffers
				      try-expand-dabbrev-from-kill
				      try-complete-file-name-partially
				      try-complete-file-name
				      try-expand-all-abbrevs
				      try-expand-list
				      try-expand-line
				      try-complete-lisp-symbol-partially
				      try-complete-lisp-symbol)))

;; Buffer index
(use-package imenu
  :hook (imenu-after-jump . recenter))

(use-package nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

;; Buffer manager
(use-package ibuffer
  :ensure nil
  :hook (ibuffer-mode . ibuffer-auto-mode)
  :bind ([remap list-buffers] . ibuffer)
  :custom
  (ibuffer-expert t)
  (ibuffer-movement-cycle nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-saved-filter-groups
   '(("Default"
      ("Emacs" (or (name . "\\*scratch\\*")
		   (name . "\\*dashboard\\*")
		   (name . "\\*compilation\\*")
		   (name . "\\*Backtrace\\*")
		   (name . "\\*Packages\\*")
		   (name . "\\*Messages\\*")
		   (name . "\\*Customize\\*")))
      ("Help" (or (name . "\\*Help\\*")
		  (name . "\\*info\\*")
		  (mode . Man-mode)
		  (mode . woman-mode)))
            ("Text" (and (derived-mode . text-mode)
                   (not (starred-name))))
      ("Magit" (or (mode . magit-repolist-mode)
                   (mode . magit-submodule-list-mode)
                   (mode . git-rebase-mode)
                   (derived-mode . magit-section-mode)
                   (mode . vc-annotate-mode)))
      ("VC" (or (mode . diff-mode)
                (derived-mode . log-view-mode)))
      ("Prog" (and (derived-mode . prog-mode)
                   (not (starred-name))))
      ("Dired" (mode . dired-mode))))))

;; Notifications
(use-package notifications
  :ensure nil
  :commands notify-send
  :config
  (defalias 'notify-send 'notifications-notify))

;; Recently opend files
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-saved-items 300)
  (recentf-auto-cleanup 'never)
  (recentf-exclude '("^/tmp/"
		     "/ssh\\(x\\)?:"
		     "/su\\(do\\)?:"
		     "^/usr/include/"
		     "/TAGS\\'"
		     "COMMIT_EDITMSG\\'")))

(provide 'init-base)

;;; init-base.el ends here
