;;; erc-loaddefs.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from erc-autoaway.el

(autoload 'erc-autoaway-mode "erc-autoaway")


;;; Generated autoloads from erc-button.el

(autoload 'erc-button-mode "erc-button" nil t)
(autoload 'erc-button--display-error-notice-with-keys "erc-button" "\
Add help keys to STRINGS for configuration-related admonishments.
Return inserted result.  Expect MAYBE-BUFFER to be an ERC buffer,
a string, or nil.  When it's a buffer, specify the `buffer'
argument when calling `erc-display-message'.  Otherwise, add it
to STRINGS.  If STRINGS contains any trailing non-nil
non-strings, concatenate leading string members before applying
`format'.  Otherwise, just concatenate everything.

(fn MAYBE-BUFFER &rest STRINGS)")
(autoload 'erc-button--display-error-notice-with-keys-and-warn "erc-button" "\
Like `erc-button--display-error-notice-with-keys' but also warn.

(fn &rest ARGS)")


;;; Generated autoloads from erc-capab.el

(autoload 'erc-capab-identify-mode "erc-capab" nil t)


;;; Generated autoloads from erc-compat.el

(autoload 'erc-define-minor-mode "erc-compat")


;;; Generated autoloads from erc-dcc.el

(autoload 'erc-dcc-mode "erc-dcc")
(autoload 'erc-cmd-DCC "erc-dcc" "\
Parser for /dcc command.
This figures out the dcc subcommand and calls the appropriate routine to
handle it.  The function dispatched should be named \"erc-dcc-do-FOO-command\",
where FOO is one of CLOSE, GET, SEND, LIST, CHAT, etc.

(fn LINE &rest COMPAT-ARGS)")
(put 'erc-cmd-DCC 'erc--cmd-help 'erc-dcc--cmd-help)
(autoload 'pcomplete/erc-mode/DCC "erc-dcc" "\
Provide completion for the /DCC command.")
(defvar erc-ctcp-query-DCC-hook '(erc-ctcp-query-DCC) "\
Hook variable for CTCP DCC queries.")
(autoload 'erc-ctcp-query-DCC "erc-dcc" "\
The function called when a CTCP DCC request is detected by the client.
It examines the DCC subcommand, and calls the appropriate routine for
that subcommand.

(fn PROC NICK LOGIN HOST TO QUERY)")


;;; Generated autoloads from erc-desktop-notifications.el

(autoload 'erc-notifications-mode "erc-desktop-notifications" "" t)


;;; Generated autoloads from erc-ezbounce.el

(autoload 'erc-cmd-ezb "erc-ezbounce" "\
Send EZB commands to the EZBouncer verbatim.

(fn LINE &optional FORCE)")
(autoload 'erc-ezb-get-login "erc-ezbounce" "\
Return an appropriate EZBounce login for SERVER and PORT.
Look up entries in `erc-ezb-login-alist'.  If the username or password
in the alist is nil, prompt for the appropriate values.

(fn SERVER PORT)")
(autoload 'erc-ezb-lookup-action "erc-ezbounce" "\


(fn MESSAGE)")
(autoload 'erc-ezb-notice-autodetect "erc-ezbounce" "\
React on an EZBounce NOTICE request.

(fn PROC PARSED)")
(autoload 'erc-ezb-identify "erc-ezbounce" "\
Identify to the EZBouncer server.

(fn MESSAGE)")
(autoload 'erc-ezb-init-session-list "erc-ezbounce" "\
Reset the EZBounce session list to nil.

(fn MESSAGE)")
(autoload 'erc-ezb-end-of-session-list "erc-ezbounce" "\
Indicate the end of the EZBounce session listing.

(fn MESSAGE)")
(autoload 'erc-ezb-add-session "erc-ezbounce" "\
Add an EZBounce session to the session list.

(fn MESSAGE)")
(autoload 'erc-ezb-select "erc-ezbounce" "\
Select an IRC server to use by EZBounce, in ERC style.

(fn MESSAGE)")
(autoload 'erc-ezb-select-session "erc-ezbounce" "\
Select a detached EZBounce session.")
(autoload 'erc-ezb-initialize "erc-ezbounce" "\
Add EZBouncer convenience functions to ERC.")


;;; Generated autoloads from erc-fill.el

(autoload 'erc-fill-mode "erc-fill" nil t)
(autoload 'erc-fill "erc-fill" "\
Fill a region using the function referenced in `erc-fill-function'.
You can put this on `erc-insert-modify-hook' and/or `erc-send-modify-hook'.")
(put 'fill-wrap 'erc--feature 'erc-fill)


;;; Generated autoloads from erc-goodies.el

(autoload 'erc-scrolltobottom-mode "erc-goodies" nil t)
(autoload 'erc-readonly-mode "erc-goodies" nil t)
(autoload 'erc-move-to-prompt-mode "erc-goodies" nil t)
(autoload 'erc-keep-place-mode "erc-goodies" nil t)
(put 'keep-place-indicator 'erc--feature 'erc-goodies)
(autoload 'erc-keep-place-indicator-mode "erc-goodies" nil t)
(autoload 'erc-noncommands-mode "erc-goodies" nil t)
(autoload 'erc-command-indicator-mode "erc-goodies" nil t)
(autoload 'erc-load-irc-script-lines "erc-goodies" "\
Process a list of LINES as prompt input submissions.
If optional NOEXPAND is non-nil, do not expand script-specific
substitution sequences via `erc-process-script-line' and instead
process LINES as literal prompt input.  With FORCE, bypass flood
protection.

(fn LINES &optional FORCE NOEXPAND)")
(autoload 'erc-irccontrols-mode "erc-goodies" nil t)
(autoload 'erc-controls-strip "erc-goodies" "\
Return a copy of STR with all IRC control characters removed.

(fn STR)")
(autoload 'erc-smiley-mode "erc-goodies" nil t)
(autoload 'erc-unmorse-mode "erc-goodies" nil t)
(autoload 'erc-querypoll-mode "erc-goodies" nil t)


;;; Generated autoloads from erc-identd.el

(autoload 'erc-identd-mode "erc-identd")
(autoload 'erc-identd-start "erc-identd" "\
Start an identd server listening to port 8113.
Port 113 (auth) will need to be redirected to port 8113 on your
machine -- using iptables, or a program like redir which can be
run from inetd.  The idea is to provide a simple identd server
when you need one, without having to install one globally on your
system.

(fn &optional PORT)" t)
(autoload 'erc-identd-stop "erc-identd" "\


(fn &rest IGNORE)" t)


;;; Generated autoloads from erc-imenu.el

(autoload 'erc-create-imenu-index "erc-imenu")
(autoload 'erc-imenu-mode "erc-imenu" nil t)


;;; Generated autoloads from erc-join.el

(autoload 'erc-autojoin-mode "erc-join" nil t)


;;; Generated autoloads from erc-list.el

(autoload 'erc-list-mode "erc-list")


;;; Generated autoloads from erc-log.el

(autoload 'erc-log-mode "erc-log" nil t)
(autoload 'erc-logging-enabled "erc-log" "\
Return non-nil if logging is enabled for BUFFER.
If BUFFER is nil, the value of `current-buffer' is used.
Logging is enabled if `erc-log-channels-directory' is non-nil, the directory
is writable (it will be created as necessary) and
`erc-enable-logging' returns a non-nil value.

(fn &optional BUFFER)")
(autoload 'erc-save-buffer-in-logs "erc-log" "\
Append BUFFER contents to the log file, if logging is enabled.
If BUFFER is not provided, current buffer is used.
Logging is enabled if `erc-logging-enabled' returns non-nil.

This is normally done on exit, to save the unsaved portion of the
buffer, since only the text that runs off the buffer limit is logged
automatically.

You can save every individual message by putting this function on
`erc-insert-post-hook'.

(fn &optional BUFFER)" t)


;;; Generated autoloads from erc-match.el

(autoload 'erc-match-mode "erc-match")
(autoload 'erc-add-pal "erc-match" "\
Add pal interactively to `erc-pals'.

(fn &optional ARG)" t)
(autoload 'erc-delete-pal "erc-match" "\
Delete pal interactively to `erc-pals'." t)
(autoload 'erc-add-fool "erc-match" "\
Add fool interactively to `erc-fools'.

(fn &optional ARG)" t)
(autoload 'erc-delete-fool "erc-match" "\
Delete fool interactively to `erc-fools'." t)
(autoload 'erc-add-keyword "erc-match" "\
Add keyword interactively to `erc-keywords'.

(fn &optional ARG)" t)
(autoload 'erc-delete-keyword "erc-match" "\
Delete keyword interactively to `erc-keywords'." t)
(autoload 'erc-add-dangerous-host "erc-match" "\
Add dangerous-host interactively to `erc-dangerous-hosts'.

(fn &optional ARG)" t)
(autoload 'erc-delete-dangerous-host "erc-match" "\
Delete dangerous-host interactively to `erc-dangerous-hosts'." t)


;;; Generated autoloads from erc-menu.el

(autoload 'erc-menu-mode "erc-menu" nil t)


;;; Generated autoloads from erc-netsplit.el

(autoload 'erc-netsplit-mode "erc-netsplit")
(autoload 'erc-cmd-WHOLEFT "erc-netsplit" "\
Show who's gone.")


;;; Generated autoloads from erc-notify.el

(autoload 'erc-notify-mode "erc-notify" nil t)
(autoload 'erc-cmd-NOTIFY "erc-notify" "\
Change `erc-notify-list' or list current notify-list members online.
Without args, list the current list of notified people online,
with args, toggle notify status of people.

(fn &rest ARGS)")
(autoload 'pcomplete/erc-mode/NOTIFY "erc-notify")


;;; Generated autoloads from erc-page.el

(put 'ctcp-page 'erc--module 'page)
(autoload 'erc-page-mode "erc-page")


;;; Generated autoloads from erc-pcomplete.el

(put 'Completion 'erc--module 'completion)
(put 'pcomplete 'erc--module 'completion)
(put 'completion 'erc--feature 'erc-pcomplete)
(autoload 'erc-completion-mode "erc-pcomplete" nil t)


;;; Generated autoloads from erc-replace.el

(autoload 'erc-replace-mode "erc-replace")


;;; Generated autoloads from erc-ring.el

(autoload 'erc-ring-mode "erc-ring" nil t)


;;; Generated autoloads from erc-services.el

(put 'nickserv 'erc--module 'services)
(autoload 'erc-services-mode "erc-services" nil t)
(autoload 'erc-nickserv-identify-mode "erc-services" "\
Set up hooks according to which MODE the user has chosen.

(fn MODE)" t)
(autoload 'erc-nickserv-identify "erc-services" "\
Identify to NickServ immediately.
Identification will either use NICK or the current nick if not
provided, and some password obtained through
`erc-nickserv-get-password' (which see).  If no password can be
found, an error is reported through `erc-error'.

Interactively, the user will be prompted for NICK, an empty
string meaning to default to the current nick.

Returns t if the identify message could be sent, nil otherwise.

(fn &optional PASSWORD NICK)" t)
(put 'services-regain 'erc--feature 'erc-services)


;;; Generated autoloads from erc-sound.el

(put 'ctcp-sound 'erc--module 'sound)
(autoload 'erc-sound-mode "erc-sound")


;;; Generated autoloads from erc-speedbar.el

(autoload 'erc-speedbar-browser "erc-speedbar" "\
Initialize speedbar to display an ERC browser.
This will add a speedbar major display mode." t)
(autoload 'erc-nickbar-mode "erc-speedbar" nil t)


;;; Generated autoloads from erc-spelling.el

(autoload 'erc-spelling-mode "erc-spelling" nil t)


;;; Generated autoloads from erc-stamp.el

(put 'timestamp 'erc--module 'stamp)
(autoload 'erc-timestamp-mode "erc-stamp" nil t)
(autoload 'erc-stamp-prefix-log-filter "erc-stamp" "\
Prefix every message in the buffer with a stamp.
Remove trailing stamps as well.  For now, hard code the format to
\"ZNC\"-log style, which is [HH:MM:SS].  Expect to be used as a
`erc-log-filter-function' when `erc-timestamp-use-align-to' is
non-nil.

(fn TEXT)")


;;; Generated autoloads from erc-status-sidebar.el

(autoload 'erc-bufbar-mode "erc-status-sidebar" nil t)
(autoload 'erc-status-sidebar-open "erc-status-sidebar" "\
Open or create a sidebar window in the current frame.
When `erc-bufbar-mode' is active, do this even if one already
exists in another frame." t)
(autoload 'erc-status-sidebar-toggle "erc-status-sidebar" "\
Toggle the sidebar open/closed on the current frame.
When opening, and `erc-bufbar-mode' is active, create a sidebar
even if one already exists in another frame." t)


;;; Generated autoloads from erc-track.el

(defvar erc-track-minor-mode nil "\
Non-nil if Erc-Track minor mode is enabled.
See the `erc-track-minor-mode' command
for a description of this minor mode.")
(custom-autoload 'erc-track-minor-mode "erc-track" nil)
(autoload 'erc-track-minor-mode "erc-track" "\
Toggle mode line display of ERC activity (ERC Track minor mode).

ERC Track minor mode is a global minor mode.  It exists for the
sole purpose of providing the C-c C-SPC and C-c C-@ keybindings.
Make sure that you have enabled the track module, otherwise the
keybindings will not do anything useful.

This is a global minor mode.  If called interactively, toggle the
`Erc-Track minor mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='erc-track-minor-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(autoload 'erc-track-mode "erc-track" nil t)


;;; Generated autoloads from erc-truncate.el

(autoload 'erc-truncate-mode "erc-truncate" nil t)
(autoload 'erc-truncate-buffer-to-size "erc-truncate" "\
Truncate BUFFER or the current buffer to SIZE.
Log the deleted region when the `log' module is active and
`erc-logging-enabled' returns non-nil.

Note that prior to ERC 5.6, whenever erc-log.el happened to be
loaded and the option `erc-enable-logging' was left at its
default value, this function would cause logging to commence
regardless of whether `erc-log-mode' was enabled or `log' was
present in `erc-modules'.

(fn SIZE &optional BUFFER)")
(autoload 'erc-truncate-buffer "erc-truncate" "\
Truncate current buffer to `erc-max-buffer-size'." t)


;;; Generated autoloads from erc-xdcc.el

(autoload 'erc-xdcc-mode "erc-xdcc")
(autoload 'erc-xdcc-add-file "erc-xdcc" "\
Add FILE to `erc-xdcc-files'.

(fn FILE)" t)

;;; End of scraped data

(provide 'erc-loaddefs)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; erc-loaddefs.el ends here
