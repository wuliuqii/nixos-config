;;; init-nix.el --- Nix -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'"
  :hook (before-save . nix-format-before-save)
  :config
  (customize-set-value 'nix-nixfmt-bin "nixpkgs-fmt"))

(provide 'init-nix)

;;; init-nix.el ends here
