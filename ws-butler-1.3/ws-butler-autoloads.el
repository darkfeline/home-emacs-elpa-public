;;; ws-butler-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from ws-butler.el

(autoload 'ws-butler-mode "ws-butler" "\
Whitespace cleanup without obtrusive whitespace removal.

Whitespaces at end-of-line and end-of-buffer are trimmed upon save, but
only for lines modified by you.

This is a minor mode.  If called interactively, toggle the `Ws-Butler
mode' mode.  If the prefix argument is positive, enable the mode, and if
it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate the variable `ws-butler-mode'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(put 'ws-butler-global-mode 'globalized-minor-mode t)
(defvar ws-butler-global-mode nil "\
Non-nil if Ws-Butler-Global mode is enabled.
See the `ws-butler-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ws-butler-global-mode'.")
(custom-autoload 'ws-butler-global-mode "ws-butler" nil)
(autoload 'ws-butler-global-mode "ws-butler" "\
Toggle Ws-Butler mode in all buffers.
With prefix ARG, enable Ws-Butler-Global mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Ws-Butler mode is enabled in all buffers where
`ws-butler--global-mode-turn-on' would do it.

See `ws-butler-mode' for more information on Ws-Butler mode.

(fn &optional ARG)" t)
(register-definition-prefixes "ws-butler" '("ws-butler-"))

;;; End of scraped data

(provide 'ws-butler-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; ws-butler-autoloads.el ends here
