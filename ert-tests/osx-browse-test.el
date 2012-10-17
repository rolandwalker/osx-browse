
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
(require 'osx-browse)

;;; todo - osx-browse-truncate-url (url maxlen)

;;; todo - osx-browse-interactive-form (&optional target new-window browser)

;;; todo - osx-browse-guess (text &optional new-window browser focus search-url)


;;; osx-browse-bundle-name-p

(ert-deftest osx-browse-bundle-name-p-01 nil
  (should
   (osx-browse-bundle-name-p "com.apple.Safari")))

(ert-deftest osx-browse-bundle-name-p-02 nil
  (should-not
   (osx-browse-bundle-name-p "/Applications/Safari.app")))


;;;  osx-browse-url

(ert-deftest osx-browse-url-01 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in your default browser.")
       (osx-browse-url value)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-02 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in your default browser in the background.")
       (osx-browse-url value nil nil 'background)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-03 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to find http://www.gnu.org from context and then RETURN to open in default browser.")
       (with-temp-buffer
         (insert value "\n")
         (goto-char (point-min))
         (call-interactively 'osx-browse-url))
       (y-or-n-p "Did that work as expected?")))))


;;; osx-browse-url-safari

(ert-deftest osx-browse-url-safari-01 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in Safari.")
       (osx-browse-url-safari value)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-safari-02 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in Safari in the background.")
       (osx-browse-url-safari value nil nil 'background)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-safari-03 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to find http://www.gnu.org from context and then RETURN to open in Safari.")
       (with-temp-buffer
         (insert value "\n")
         (goto-char (point-min))
         (call-interactively 'osx-browse-url-safari))
       (y-or-n-p "Did that work as expected?")))))


;;; osx-browse-url-chrome

(ert-deftest osx-browse-url-chrome-01 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in Chrome.")
       (osx-browse-url-chrome value)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-chrome-02 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in Chrome in the background.")
       (osx-browse-url-chrome value nil nil 'background)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-chrome-03 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to find http://www.gnu.org from context and then RETURN to open in Chrome.")
       (with-temp-buffer
         (insert value "\n")
         (goto-char (point-min))
         (call-interactively 'osx-browse-url-chrome))
       (y-or-n-p "Did that work as expected?")))))


;;; osx-browse-url-firefox

(ert-deftest osx-browse-url-firefox-01 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in Firefox.")
       (osx-browse-url-firefox value)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-firefox-02 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to open http://www.gnu.org in Firefox in the background.")
       (osx-browse-url-firefox value nil nil 'background)
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-url-firefox-03 nil
  :tags '(:interactive)
  (let ((value "http://www.gnu.org"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to find http://www.gnu.org from context and then RETURN to open in Firefox.")
       (with-temp-buffer
         (insert value "\n")
         (goto-char (point-min))
         (call-interactively 'osx-browse-url-firefox))
       (y-or-n-p "Did that work as expected?")))))


;;; osx-browse-search

(ert-deftest osx-browse-search-01 nil
  :tags '(:interactive)
  (should
   (let ((cursor-in-echo-area t))
     (read-char "Press a key to invoke an Internet Search.")
     (call-interactively 'osx-browse-search)
     (y-or-n-p "Did that work as expected?"))))

(ert-deftest osx-browse-search-02 nil
  :tags '(:interactive)
  (let ((value "cupcakes"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to invoke an Internet Search with a default value.")
       (with-temp-buffer
         (insert value "\n")
         (goto-char (point-min))
         (call-interactively 'osx-browse-search))
       (y-or-n-p "Did that work as expected?")))))

(ert-deftest osx-browse-search-03 nil
  :tags '(:interactive)
  (let ((value "delicious cupcakes"))
    (should
     (let ((cursor-in-echo-area t))
       (read-char "Press a key to invoke an Internet Search with a multi-word default value.")
       (with-temp-buffer
         (transient-mark-mode 1)
         (insert value "\n")
         (goto-char (point-min))
         (push-mark (point-max) t t)
         (call-interactively 'osx-browse-search))
       (y-or-n-p "Did that work as expected?")))))


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
