;;; init-go.el --- Go -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-ts-mode))

(provide 'init-go)

;;; init-go.el ends here
