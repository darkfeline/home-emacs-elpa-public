;;; idlwave-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from idlw-bindings.el

(register-definition-prefixes "idlw-bindings" '("idlwave-"))


;;; Generated autoloads from idlw-complete.el

(register-definition-prefixes "idlw-complete" '("idlwave-"))


;;; Generated autoloads from idlw-complete-structtag.el

(register-definition-prefixes "idlw-complete-structtag" '("idlwave-"))


;;; Generated autoloads from idlw-help.el

(register-definition-prefixes "idlw-help" '("idlwave-"))


;;; Generated autoloads from idlw-menus.el

(register-definition-prefixes "idlw-menus" '("idlwave-"))


;;; Generated autoloads from idlw-roprompt.el

(register-definition-prefixes "idlw-roprompt" '("idlwave-"))


;;; Generated autoloads from idlw-routine.el

(register-definition-prefixes "idlw-routine" '("idlwave-"))


;;; Generated autoloads from idlw-scan.el

(register-definition-prefixes "idlw-scan" '("idlwave-"))


;;; Generated autoloads from idlw-shell.el

(autoload 'idlwave-shell "idlw-shell" "\
Run an inferior IDL, with I/O through buffer `(idlwave-shell-buffer)'.
If buffer exists but shell process is not running, start new IDL.
If buffer exists and shell process is running, just switch to the buffer.

When called with a prefix ARG, or when `idlwave-shell-use-dedicated-frame'
is non-nil, the shell buffer and the source buffers will be in
separate frames.

The command to run comes from variable `idlwave-shell-explicit-file-name',
with options taken from `idlwave-shell-command-line-options'.

The buffer is put in `idlwave-shell-mode', providing commands for sending
input and controlling the IDL job.  See help on `idlwave-shell-mode'.
See also the variable `idlwave-shell-prompt-pattern'.

(Type \\[describe-mode] in the shell buffer for a list of commands.)

(fn &optional ARG QUICK)" t)
(autoload 'idlwave-shell-recenter-shell-window "idlw-shell" "\
Run `idlwave-shell', but make sure the current window stays selected.

(fn &optional ARG)" t)
(autoload 'idlwave-shell-send-command "idlw-shell" "\
Send a command to the IDL process.

(CMD PCMD HIDE SHOW-IF-ERROR REDISPLAY) are placed at the
end of `idlwave-shell-pending-commands'.  If IDL is ready the
first command in `idlwave-shell-pending-commands', CMD, is sent
to the IDL process.

If optional second argument PCMD is non-nil it will be placed on
`idlwave-shell-post-command-hook' when CMD is executed.

If the optional third argument HIDE is non-nil, then hide output
from CMD, unless it is the symbol `mostly', in which case only
output beginning with \"%\" is hidden, and all other
output (i.e., the results of a PRINT command), is shown.  This
helps with, e.g., stepping through code with output.

If optional fourth argument PREEMPT is non-nil CMD is put at front of
`idlwave-shell-pending-commands'.  If PREEMPT is `wait', wait for all
output to complete and the next prompt to arrive before returning
(useful if you need an answer now).  IDL is considered ready if the
prompt is present and if `idlwave-shell-ready' is non-nil.

If SHOW-IF-ERROR is non-nil, show the output if it contains an
error message, independent of what HIDE is set to.

If REDISPLAY is `disable', disable line redisplay for all but
errors.  If REDISPLAY is otherwise non-nil, clear the current
line position as state is scanned if no stop line message is
recognized.

(fn &optional CMD PCMD HIDE PREEMPT SHOW-IF-ERROR REDISPLAY)")
(autoload 'idlwave-shell-break-here "idlw-shell" "\
Set breakpoint at current line.

If COUNT is nil then an ordinary breakpoint is set.  We treat a COUNT
of 1 as a temporary breakpoint using the ONCE keyword.  Counts greater
than 1 use the IDL AFTER=count keyword to break only after reaching
the statement COUNT times.

Optional argument CMD is a list or function to evaluate upon reaching
the breakpoint.  CONDITION is a break condition, and DISABLED, if
non-nil disables the breakpoint.

(fn &optional COUNT CMD CONDITION DISABLED NO-SHOW)" t)
(autoload 'idlwave-shell-run-region "idlw-shell" "\
Compile and run the region using the IDL process.
Copies the region to a temporary file `idlwave-shell-temp-pro-file'
and issues the IDL .run command for the file.  Because the
region is compiled and run as a main program there is no
problem with begin-end blocks extending over multiple
lines - which would be a problem if `idlwave-shell-evaluate-region'
was used.  An END statement is appended to the region if necessary.

If there is a prefix argument, display IDL process.

(fn BEG END &optional N)" t)
(autoload 'idlwave-shell-save-and-run "idlw-shell" "\
Save file and run it in IDL.
Runs `save-buffer' and sends a '.RUN' command for the associated file to IDL.
When called from the shell buffer, re-run the file which was last handled by
one of the save-and-.. commands." t)
(register-definition-prefixes "idlw-shell" '("idlwave-"))


;;; Generated autoloads from idlw-toolbar.el

(register-definition-prefixes "idlw-toolbar" '("idlwave-toolbar"))


;;; Generated autoloads from idlw-variables.el

(register-definition-prefixes "idlw-variables" '("idlwave-"))


;;; Generated autoloads from idlwave.el

(autoload 'idlwave-mode "idlwave" "\
Major mode for editing IDL source files.

The main features of this mode are

1. Indentation and Formatting
   --------------------------
   Like other Emacs programming modes, C-j inserts a newline and indents.
   TAB is used for explicit indentation of the current line.

   To start a continuation line, use \\[idlwave-split-line].  This
   function can also be used in the middle of a line to split the line
   at that point.  When used inside a long constant string, the string
   is split at that point with the `+' concatenation operator.

   Comments are indented as follows:

   `;;;' Indentation remains unchanged.
   `;;'  Indent like the surrounding code
   `;'   Indent to a minimum column.

   The indentation of comments starting in column 0 is never changed.

   Use \\[idlwave-fill-paragraph] to refill a paragraph inside a
   comment.  The indentation of the second line of the paragraph
   relative to the first will be retained.  Use
   \\[auto-fill-mode] to toggle auto-fill mode for these
   comments.  When the variable `idlwave-fill-comment-line-only' is
   nil, code can also be auto-filled and auto-indented.

   To convert pre-existing IDL code to your formatting style, mark the
   entire buffer with \\[mark-whole-buffer] and execute
   \\[idlwave-expand-region-abbrevs].  Then mark the entire buffer
   again followed by \\[indent-region] (`indent-region').

2. Routine Info
   ------------
   IDLWAVE displays information about the calling sequence and the
   accepted keyword parameters of a procedure or function with
   \\[idlwave-routine-info].  \\[idlwave-find-module] jumps to the
   source file of a module.  These commands know about system
   routines, all routines in idlwave-mode buffers and (when the
   idlwave-shell is active) about all modules currently compiled under
   this shell.  It also makes use of pre-compiled or custom-scanned
   user and library catalogs many popular libraries ship with by
   default.  Use \\[idlwave-update-routine-info] to update this
   information, which is also used for completion (see item 4).

3. Online IDL Help
   ---------------

   \\[idlwave-context-help] displays the IDL documentation relevant
   for the system variable, keyword, or routines at point.  A single
   key stroke gets you directly to the right place in the docs.  See
   the manual to configure where and how the HTML help is displayed.

4. Completion
   ----------
   \\[idlwave-complete] completes the names of procedures, functions
   class names, keyword parameters, system variables and tags, class
   tags, structure tags, filenames and much more.  It is context
   sensitive and figures out what is expected at point.  Lower case
   strings are completed in lower case, other strings in mixed or
   upper case.

5. Code Templates and Abbreviations
   --------------------------------
   Many Abbreviations are predefined to expand to code fragments and templates.
   The abbreviations start generally with a `\\'.  Some examples:

   \\pr        PROCEDURE template
   \\fu        FUNCTION template
   \\c         CASE statement template
   \\sw        SWITCH statement template
   \\f         FOR loop template
   \\r         REPEAT Loop template
   \\w         WHILE loop template
   \\i         IF statement template
   \\elif      IF-ELSE statement template
   \\b         BEGIN

   For a full list, use \\[idlwave-list-abbrevs].  Some templates also
   have direct keybindings - see the list of keybindings below.

   \\[idlwave-doc-header] inserts a documentation header at the
   beginning of the current program unit (pro, function or main).
   Change log entries can be added to the current program unit with
   \\[idlwave-doc-modification].

6. Automatic Case Conversion
   -------------------------
   The case of reserved words and some abbrevs is controlled by
   `idlwave-reserved-word-upcase' and `idlwave-abbrev-change-case'.

7. Automatic END completion
   ------------------------
   If the variable `idlwave-expand-generic-end' is non-nil, each END typed
   will be converted to the specific version, like ENDIF, ENDFOR, etc.

8. Hooks
   -----
   Turning on `idlwave-mode' runs `idlwave-mode-hook'.

9. Documentation and Customization
   -------------------------------
   Info documentation for this package is available.  Use
   \\[idlwave-info] to display (complain to your sysadmin if that does
   not work).  For Postscript, PDF, and HTML versions of the
   documentation, check IDLWAVE's website at URL
   `https://github.com/jdtsmith/idlwave'.
   IDLWAVE has customize support - see the group `idlwave'.

10.Keybindings
   -----------
   Here is a list of all keybindings of this mode.
   If some of the key bindings below show with ??, use \\[describe-key]
   followed by the key sequence to see what the key sequence does.

\\{idlwave-mode-map}

(fn)" t)
(add-to-list 'auto-mode-alist (cons (purecopy "\\.pro\\'") 'idlwave-mode))
(register-definition-prefixes "idlwave" '("idlwave-"))

;;; End of scraped data

(provide 'idlwave-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; idlwave-autoloads.el ends here
