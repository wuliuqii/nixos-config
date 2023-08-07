;;; init-package.el --- Initialize package configurations. -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(require 'package)
;; https://mirrors.tuna.tsinghua.edu.cn/help/elpa/
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Bootstrap `use-package`
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-always-minimally nil)
  (setq use-package-enable-imenu-support t))
(eval-when-compile
  (require 'use-package))

(provide 'init-package)
;;; init-package.el ends here
