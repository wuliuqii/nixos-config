;;; init-keybindings.el --- General keybindngs, using doom emacs style -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package general
  :ensure t
  :config
  (general-evil-setup t)

  (general-create-definer leader-def
    :prefix "SPC"
    :states '(motion normal visual emacs)
    :keymaps 'override)

  (leader-def
    "u" '(universal-argument :wk "Universal argument")
    "w" '(evil-window-map :wk "Window")
    "." '(find-file :wk "Find file")
    "," '(consult-buffer :wk "consult buffer")
    "/" '(consult-ripgrep :wk "consult ripgrep")
    "<" '(switch-to-buffer :wk "Switch buffer")
    "'" '(vertico-repeat :wk "Resume last search")
    "SPC" '(project-find-file :wk "Find file in project")

    ;; buffer
    "b" '(:ignore t :wk "Buffer")
    "bb" '(consult-buffer :wk "consult buffer")
    "b[" '(previous-buffer :wk "Previous buffer")
    "b]" '(next-buffer :wk "Next buffer")
    "bd" '(kill-current-buffer :wk "Kill buffer")
    "bi" '(ibuffer :wk "ibuffer")
    "bk" '(kill-current-buffer :wk "Kill buffer")
    "bl" '(evil-switch-to-windows-last-buffer :wk "Switch to last buffer")
    "bn" '(next-buffer :wk "Next buffer")
    "bs" '(save-buffer :wk "Save buffer")

    ;; code
    "c" '(:ignore t :wk "Code")
    "ca" '(eglot-code-actions :wk "LSP Execute code action")
    "cr" '(eglot-rename :wk "LSP rename")
    "cj" '(eglot-find-declaration :wk "LSP Find declaration")
    "cs" '(consult-eglot-symbols :wk "Jump to symbol in current workspace")
    "ck" '(eldoc-box-help-at-point :wk "Jump to documentation")
    "cl" '(flymake-show-buffer-diagnostics :wk "List buffer diagnostics")
    "cL" '(flymake-show-project-diagnostics :wk "List project diagnostics")

    ;; git/version control
    "g" '(:ignore t :wk "Git")
    "g/" '(magit-dispatch :wk "Magit dispatch")
    "g." '(magit-file-dispatch :wk "Magit file dispatch")
    "gb" '(magit-branch-checkout :wk "Magit switch branch")
    "gg" '(magit-status :wk "Magit status")
    "gG" '(magit-status-here :wk "Magit status here")
    "gb" '(magit-blame-addition :wk "Magit blame")
    "gc" '(magit-clone :wk "Magit clone")
    "gf" '(magit-fetch :wk "Magit fetch")
    "gl" '(magit-log-buffer-file :wk "Magit buffer log")
    "gs" '(magit-stage-file :wk "Magit stage file")
    "gu" '(magit-unstage-file :wk "Magit unstage file")

    ;; open
    "o" '(:ignore t :wk "Open")
    "od" '(dired-jump :wk "Dired")

    ;; project
    "p" '(:ignore t :wk "Project")
    "pp" '(project-switch-project :wk "Project switch")
    "pf" '(project-find-file :wk "Project find file")

    ;; help
    "h" '(:ignore t :wk "Help")
    "hf" '(helpful-callable :wk "Describe function")
    "hk" '(helpful-key :wk "Describe key")
    "hv" '(helpful-variable :wk "Describe variable")
    "hs" '(helpful-symbol :wk "Describe symbol")
    "hm" '(describe-mode :wk "Describe mode")
    "hF" '(describe-face :wk "Describe face")
    "hw" '(where-is :wk "Where is")
    "h." '(display-local-help :wk "Display local help")

    ;; tabs
    "t" '(:ignore t :wk "Tabs")
    "t b" '(tabspaces-switch-to-buffer :wk "swith to buffer")
    "t c" '(tabspaces-clear-buffers :wk "clear buffers")
    "t d" '(tabspaces-close-workspace :wk "close workspace")
    "t k" '(tabspaces-kill-buffers-close-workspace :wk "kill buffers and workspace")
    "t o" '(tabspaces-open-or-create-project-and-workspace :wk "open or create project")
    "t r" '(tabspaces-remove-current-buffer :wk "remove current buffer")
    "t R" '(tabspaces-remove-selected-buffer :wk "remove selected buffer")
    "t s" '(tabspaces-switch-or-create-workspace :wk "switch or create workspace")
    "t t" '(tabspaces-switch-buffer-and-tab :wk "switch buffer and tab")
    ))

(provide 'init-keybindings)

;;; init-keybindings.el ends here
