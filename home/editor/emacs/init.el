;;(require 'org)
;;
;;(defvar user/init-org-file (concat user-emacs-directory "config.org"))
;;(defvar user/init-el-file (concat user-emacs-directory "config.el"))
;;
;;(find-file user/init-org-file)
;;(org-babel-tangle)
;;(load-file user/init-el-file)
;;(byte-compile-file user/init-el-file)

(org-babel-load-file
  (expand-file-name
   "config.org"
   user-emacs-directory))
