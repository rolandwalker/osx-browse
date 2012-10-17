
;; requires and setup

(when load-file-name
  (setq package-enable-at-startup nil)
  (setq package-load-list '((list-utils t)
                            (string-utils t)
                            (browse-url-dwim t)))
  (when (fboundp 'package-initialize)
    (package-initialize)))

(require 'list-utils)
(require 'string-utils)
(require 'browse-url-dwim)

;;; todo - osx-browse-truncate-url (url maxlen)

;;; todo - osx-browse-bundle-name-p (bundle-or-app)

;;; todo - osx-browse-interactive-form (&optional target new-window browser)

;;; todo - osx-browse-url (url &optional new-window browser focus)

;;; todo - osx-browse-search (text &optional new-window browser focus search-url)

;;; todo - osx-browse-guess (text &optional new-window browser focus search-url)

;;; todo - osx-browse-url-safari (url &optional new-window browser focus)

;;; todo - osx-browse-url-chrome (url &optional new-window browser focus)

;;; todo - osx-browse-url-firefox (url &optional new-window browser focus)


;;
;; Emacs
;;
;; Local Variables:
;; indent-tabs-mode: nil
;; mangle-whitespace: t
;; require-final-newline: t
;; coding: utf-8
;; byte-compile-warnings: (not cl-functions)
;; End:
;;

;;; osx-browse-test.el ends here
