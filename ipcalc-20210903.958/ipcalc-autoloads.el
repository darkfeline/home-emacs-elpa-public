;;; ipcalc-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from ipcalc.el

(autoload 'ipcalc "ipcalc" "\
IP calculator for given IP/CIDR. Insert the output in the buffer
BUFFER (by default, the buffer `ipcalc--output-buffer-default').

(fn IP/CIDR &optional BUFFER)" t)
(autoload 'ipcalc-current-buffer "ipcalc" "\
IP calculator for given IP/CIDR. Inserts the output in the
current buffer.

(fn IP/CIDR)" t)
(register-definition-prefixes "ipcalc" '("ipcalc-"))

;;; End of scraped data

(provide 'ipcalc-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; ipcalc-autoloads.el ends here
