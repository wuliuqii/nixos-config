;;; init-elisp.el --- Elisp -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(use-package elisp-mode
  :ensure nil
  :bind (:map emacs-lisp-mode-map
              ("C-c C-c" . eval-to-comment)
              :map lisp-interaction-mode-map
              ("C-c C-c" . eval-to-comment))
  :config
  (defconst eval-as-comment-prefix ";;=>")

  (defun eval-to-comment (&optional arg)
    (interactive "P")
    (let ((start (point)))
      (eval-print-last-sexp arg)
      (save-excursion
        (goto-char start)
        (forward-line 1)
        (insert eval-as-comment-prefix)))))

(provide 'init-elisp)

;;; init-elisp.el ends here
