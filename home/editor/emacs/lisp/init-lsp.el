;;; init-lsp.el --- The completion engine and lsp client -*- leical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; The completion engine
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-mode-map
              ([remap completion-at-point] . company-complete)
              :map company-active-map
              ("C-s" . company-filter-candidates)
              ([tab] . company-complete-common-or-cycle)
              ([backtab] . company-select-previous-or-abort))
  :config
  (define-advice company-capf--candidates (:around (func &rest args))
    "Try default completion styles."
    (let ((completion-styles '(basic partial-completion)))
      (apply func args)))
  :custom
  (company-idle-delay 0)
  ;; Easy navigation to candidates with M-<n>
  (company-show-quick-access t)
  (company-require-match nil)
  (company-minimum-prefix-length 1)
  (company-tooltip-width-grow-only t)
  (company-tooltip-align-annotations t)
  ;; complete `abbrev` only in current buffer and make dabbrev case-sensitive
  (company-dabbrev-other-buffers nil)
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-downcase nil)
  ;; make dabbrev-code case-sensitive
  (company-dabbrev-code-ignore-case nil)
  (company-dabbrev-code-everywhere t)
  ;; call `tempo=expand-if-complete` after completion
  (company-tempo-expand t)
  ;; ignore uninteresting files
  (company-files-exclusions '(".git/"))
  (company-backends '((company-capf :with company-tempo)
                      company-files
                      (company-dabbrev-code company-keywords)
                      company-dabbrev)))

(use-package eglot
  :ensure t
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode 'list-mode 'makefile-mode 'snippet-moe)
                          (eglot-ensure))))
         ((markdown-mode yaml-mode yaml-ts-mode) . eglot-ensure)
         (eglot--managed-mode . (lambda ()
                                  ;; Show flymake diagnostics first.
                                  (setq eldoc-documentation-functions
                                        (cons #'flymake-eldoc-function
                                              (remove #'flymake-eldoc-function eldoc-documentation-functions)))
                                  ;; Show all eldoc feedback
                                  (setq eldoc-documentation-strategy #'eldoc-documentation-compose))))
  :bind (:map eglot-mode-map
         ("C-c f" . eglot-format)
         ("C-c d" . eldoc-doc-buffer)
         ("C-c a" . eglot-code-actions)
         ("C-c r" . eglot-rename)
         ("C-c l" . eglot-command-map))
  :config
  (defvar-keymap eglot-command-map
    :prefix 'eglot-command-map
    ;; workspaces
    "w q" #'eglot-shutdown
    "w r" #'eglot-reconnect
    "w s" #'eglot
    "w d" #'eglot-show-workspace-configuration

    ;; formatting
    "= =" #'eglot-format-buffer
    "= r" #'eglot-format

    ;; goto
    "g a" #'xref-find-apropos
    "g d" #'eglot-find-declaration
    "g g" #'xref-find-definitions
    "g i" #'eglot-find-implementation
    "g r" #'xref-find-references
    "g t" #'eglot-find-typeDefinition

    ;; actions
    "a q" #'eglot-code-action-quickfix
    "a r" #'eglot-code-action-rewrite
    "a i" #'eglot-code-action-inline
    "a e" #'eglot-code-action-extract
    "a o" #'eglot-code-action-organize-imports)
  :custom
  (eglot-sync-connect 0)
  (eglot-autoshutdown t)
  (eglot-extend-to-xref t)
  (eglot-events-buffer-size 0)
  (eglot-ignored-server-capabilities '(:documentLinkProvider
                                       :documentOnTypeFormattingProvider)))

;; Don't show the doc in the minibuffer
(use-package eldoc-box
  :ensure t
  :commands
  eldoc-box-hover-mode
  eldoc-box-help-at-point)

(provide 'init-lsp)

;;; init-lsp.el ends here
