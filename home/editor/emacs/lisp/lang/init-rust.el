;;; init-rust.el --- Rust -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package rustic
  :ensure t
  :mode ("\\.rs\\'" . rust-ts-mode)
  :config
  (setq rustic-lsp-server 'rust-analyzer
        rustic-cargo-bin "cargo"
        rustic-lsp-client 'eglot
        rustic-format-trigger 'on-save))

(provide 'init-rust)

;;; init-rust.el ends here
