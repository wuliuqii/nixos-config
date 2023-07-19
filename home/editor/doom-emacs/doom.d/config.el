;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Gallon"
      user-mail-address "h1090703848@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 15 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "JetbrainsMono Nerd Font" :size 22))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; lsp stuff
(use-package lsp-mode
  :ensure t)

(use-package lsp-nix
  :ensure lsp-mode
  :after (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter ["nixpkgs-fmt"]))

(use-package nix-mode
  :hook (nix-mode . lsp-deferred)
  :ensure t)

;; Set height of headers
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.20))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.15))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.12))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.08))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.05))))
  '(org-document-title ((t (:height 2.5))))
)

;; Bullet UTF-8 icons for org documents
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Org customization
(defun mb/set-org-vars ()
  (setq org-ellipsis " ▼"
        org-hide-emphasis-markers nil
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0
        org-src-preserve-indentation t
        org-hide-block-startup nil
        org-startup-folded 'showeverything
        org-startup-with-inline-images t
        org-cycle-separator-lines 2))
(add-hook 'org-mode-hook 'mb/set-org-vars)

(defun mb/org-mode-visual-fill ()
  (setq visual-fill-column-width 110
        visual-fill-column-center-text t)
        (visual-fill-column-mode 1))
(add-hook 'org-mode-hook 'mb/org-mode-visual-fill)

(defun mb/load-prettify-symbols ()
  (interactive)
  (setq prettify-symbols-alist
        (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                '(("(lamda" . ?λ)
                  ("|>" . ?▷)
                  ("<|" . ?◁)
                  ("->>" . ?↠)
                  ("->" . ?→)
                  ("<-" . ?←)
                  ("=>" . ?⇒)
                  ("<=" . ?≤)
                  (">=" . ?≥))))
        (prettify-symbols-mode 1))
(add-hook 'org-mode-hook 'mb/load-prettify-symbols)

;; Org-babel-tangle languages
(add-hook 'org-mode-hook #'org-babel-do-load-languages)
(setq org-confirm-babel-evaluate nil)

