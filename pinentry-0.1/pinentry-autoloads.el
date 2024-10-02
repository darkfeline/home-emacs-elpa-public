;;; pinentry-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from pinentry.el

(autoload 'pinentry-start "pinentry" "\
Start a Pinentry service.

Once the environment is properly set, subsequent invocations of
the gpg command will interact with Emacs for passphrase input." t)
(register-definition-prefixes "pinentry" '("pinentry-"))

;;; End of scraped data

(provide 'pinentry-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; pinentry-autoloads.el ends here
