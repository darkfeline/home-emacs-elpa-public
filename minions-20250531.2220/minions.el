;;; minions.el --- A minor-mode menu for the mode line  -*- lexical-binding:t -*-

;; Copyright (C) 2018-2025 Jonas Bernoulli

;; Author: Jonas Bernoulli <emacs.minions@jonas.bernoulli.dev>
;; Homepage: https://github.com/tarsius/minions
;; Keywords: convenience

;; Package-Version: 20250531.2220
;; Package-Revision: 7aeabcab964f
;; Package-Requires: ((emacs "26.1") (compat "30.1"))

;; SPDX-License-Identifier: GPL-3.0-or-later

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package implements a nested menu that gives access to all known
;; minor modes (i.e., those listed in `minor-mode-list').  It can be used
;; to toggle local and global minor modes, to access mode-specific menus,
;; and to display information about modes.

;; This menu is intended as a replacement for the incomplete, yet quite
;; space consuming, list of enabled minor modes that is displayed in the
;; mode line by default.  To use the menu like this, enable Minions mode.

;; Emacs 31 adds support for putting minor-modes in a menu instead of
;; directly in the mode-line, but that menu is less featureful than the
;; menu provided by this package.  The built-in menu doesn't list global
;; modes and because it only lists modes that are already enabled, it
;; cannot be used to enable additional modes.  It also only lists modes
;; that define a mode line lighter, so it does not present a complete
;; list of enabled minor modes.

;; Instead of, or in addition to, making the Minions menu available in
;; the mode line, it can be bound globally, for example:
;;
;;   (keymap-global-set "<S-down-mouse-3>" #'minions-minor-modes-menu)

;; To list a mode even though the defining library has not been loaded
;; yet, you must add it to `minor-mode-list' yourself.  Additionally it
;; must be autoloaded.  For example:
;;
;;   (when (autoloadp (symbol-function 'glasses-mode))
;;     (cl-pushnew 'glasses-mode minor-mode-list))

;; To avoid inserting parenthesis around the modes in the mode-line, set
;; `mode-line-modes-delimiters' (or `minions-mode-line-delimiters' if you
;; are using Emacs 30 or older) to nil.

;;; Code:

(require 'cl-lib)
(require 'compat)

(eval-when-compile (require 'subr-x))

;;; Options

(defgroup minions nil
  "A minor-mode menu for the mode line."
  :group 'mode-line)

(defcustom minions-demoted-modes '(all-global-modes)
  "List of minor modes that are shown in a sub-menu even when enabled.
The element `all-global-modes' causes all global minor modes to
be placed in a sub-menu, even when enabled."
  :group 'minions
  :type '(repeat (symbol :tag "Minor mode function")))

(defcustom minions-promoted-modes
  (nconc
   ;; This returns all the bindings added in "bindings.el".
   (delq nil (mapcar #'car-safe mode-line-mode-menu))
   ;; This is the only binding that is only added once the
   ;; respective library is loaded.
   '(ruler-mode))
  "List of minor modes that are shown in the top-menu even when disabled."
  :group 'minions
  :type '(repeat (symbol :tag "Minor mode function")))

(defcustom minions-prominent-modes nil
  "List of minor modes that are also shown directly in the mode line."
  :group 'minions
  :type '(repeat (symbol :tag "Minor mode function")))

(defcustom minions-mode-line-face nil
  "Face used for the mode menu in the mode line."
  :package-version '(minions . "0.3.2")
  :group 'minions
  :group 'mode-line-faces
  :type '(choice (const :tag "No face" nil) face))

(defcustom minions-mode-line-lighter "≡"
  "Text used for the mode menu in the mode line."
  :package-version '(minions . "0.2.0")
  :group 'minions
  :type 'string)

;;; Element

(defvar minions--mode-line-minor-modes
  '(:eval (propertize minions-mode-line-lighter
                      'face minions-mode-line-face
                      'mouse-face 'mode-line-highlight
                      'help-echo "Minions\nmouse-1: Display minor modes menu"
                      'local-map minions-mode-line-minor-modes-map)))

;;; Mode

;;;###autoload
(define-minor-mode minions-mode
  "Display a minor-mode menu in the mode line.

This replaces the likely incomplete and possibly cut off list of
minor modes that is usually displayed directly in the mode line."
  :group 'minions
  :global t
  (static-if (boundp 'mode-line-minor-modes)
      (setq-default mode-line-minor-modes
                    (if minions-mode
                        minions--mode-line-minor-modes
                      '(:eval (mode-line--minor-modes))))
    (setq-default mode-line-format
                  (if minions-mode
                      (cl-subst 'minions-mode-line-modes
                                'mode-line-modes
                                (default-value 'mode-line-format))
                    (cl-nsubst 'mode-line-modes
                               'minions-mode-line-modes
                               (default-value 'mode-line-format))))))

;;; Menu

(defvar-keymap minions-mode-line-minor-modes-map
  "<mode-line> <down-mouse-1>" #'minions-minor-modes-menu)

(defun minions-minor-modes-menu ()
  "Pop up a menu with minor mode menus and toggles.

Enabled local modes are displayed at the top of the root menu,
while enabled global modes are displayed at its the bottom.
Two sub-menus are used to display the disabled local and global
modes.

Modes listed in `minions-promoted-modes' are displayed in the
root menu even if they are disabled.  Likewise modes listed in
`minions-demoted-modes' are displayed in a sub menu even if they
are enabled."
  (interactive)
  (let ((ltop (make-sparse-keymap))
        (gtop (make-sparse-keymap))
        (tail (make-sparse-keymap))
        (lsub (make-sparse-keymap))
        (gsub (make-sparse-keymap))
        (ldoctop (make-sparse-keymap))
        (gdoctop (make-sparse-keymap))
        (ldocsub (make-sparse-keymap))
        (gdocsub (make-sparse-keymap))
        (gdemote (memq 'all-global-modes minions-demoted-modes)))
    (define-key ltop [--local]  (list 'menu-item "Local Modes"))
    (define-key gtop [--global] (list 'menu-item "Global Modes"))
    (pcase-dolist (`(,fn ,var ,global ,top) (minions--modes))
      (define-key-after
        (pcase (list top global)
          (`(t   t)   gtop)
          (`(t   nil) ltop)
          (`(nil t)   gsub)
          (`(nil nil) lsub))
        (vector fn)
        (or (minions--mode-menu fn var)
            (minions--mode-item fn var)))
      (define-key-after
        (pcase (list top global)
          (`(t   t)   gdoctop)
          (`(t   nil) ldoctop)
          (`(nil t)   gdocsub)
          (`(nil nil) ldocsub))
        (vector fn)
        (minions--help-item fn)))
    (define-key-after ltop [--lsub] (list 'menu-item "More..." lsub))
    (define-key-after ltop [--ldoc] (list 'menu-item "Describe..." ldoctop))
    (define-key-after ltop [--lend] (list 'menu-item "--double-line"))
    (define-key-after gtop [--gsub]
      (list 'menu-item (if gdemote "Toggle..." "More...") gsub))
    (define-key-after gtop [--gdoc]
      (list 'menu-item "Describe..." (if gdemote gdocsub gdoctop)))
    (define-key-after gtop [--gend] (list 'menu-item "--double-line"))
    (define-key-after tail [describe-mode]
      (list 'menu-item "Describe active modes" 'describe-mode))
    (define-key-after tail [--customize]
      (list 'menu-item "Customize this menu"
            (lambda () (interactive) (customize-group 'minions))))
    (define-key-after ldoctop [--lsub] (list 'menu-item "More..." ldocsub))
    (define-key-after gdoctop [--gsub] (list 'menu-item "More..." gdocsub))
    (condition-case nil
        (popup-menu (make-composed-keymap (list ltop gtop tail)))
      (quit nil))))

(defun minions--prominent-modes ()
  (cl-remove-if-not (lambda (mode)
                      (memq (car mode) minions-prominent-modes))
                    minor-mode-alist))

(defun minions--modes ()
  (mapcan
   (lambda (fn)
     (let ((var (and (boundp fn) fn))
           (ignore nil))
       (cl-case fn
         ;; Built-in:
         (auto-fill-function (setq ignore t))
         (auto-fill-mode (setq var 'auto-fill-function))
         (auto-save-mode (setq var 'buffer-auto-save-file-name))
         (buffer-read-only (setq fn 'read-only-mode))
         ;; Third-party:
         (edit-indirect--overlay (setq ignore t)))
       (and (not ignore)
            (fboundp fn)
            (let (global enabled)
              (cond
               ((and (boundp 'global-minor-modes)
                     (memq fn global-minor-modes))
                (setq global t)
                (setq enabled t))
               ((and (boundp 'local-minor-modes)
                     (memq fn local-minor-modes))
                (setq enabled t))
               ((or (get fn 'globalized-minor-mode)
                    (and var (not (local-variable-if-set-p var)))
                    (string-prefix-p "global-" (symbol-name fn)))
                (setq global t)
                (setq enabled (and var (symbol-value var))))
               ((setq enabled (and var (symbol-value var)))))
              (list (list fn var global
                          (and (not (memq fn minions-demoted-modes))
                               (not (and global
                                         (memq 'all-global-modes
                                               minions-demoted-modes)))
                               (and (or enabled
                                        (memq fn minions-promoted-modes))
                                    t))))))))
   (sort minor-mode-list #'string<)))

(defun minions--mode-menu (fn var)
  (and-let* ((menu (or (cdr (assq fn minor-mode-map-alist))
                       (cdr (assq fn minor-mode-overriding-map-alist))))
             (menu (and (keymapp menu)
                        (lookup-key menu [menu-bar])))
             (menu (mouse-menu-non-singleton menu))
             (map  (make-sparse-keymap)))
    (define-key-after map (vector fn) (minions--mode-item fn var))
    (define-key-after map [--builtin] (list 'menu-item "--double-line"))
    (list 'menu-item (symbol-name fn) (make-composed-keymap map menu))))

(defun minions--mode-item (fn var)
  (list 'menu-item (symbol-name fn) fn
        :help (minions--documentation fn)
        :button (cons :toggle var)))

(defun minions--help-item (fn)
  (list 'menu-item (symbol-name fn)
        (lambda ()
          (interactive)
          (describe-minor-mode-from-symbol fn))
        :help (minions--documentation fn)))

(defun minions--documentation (fn)
  (let ((doc (documentation fn t)))
    (and doc
         (string-match "\\`.+" doc)
         (match-string 0 doc))))

;;; Backward Compatibility

(static-if (boundp 'mode-line-modes-delimiters)
    (define-obsolete-variable-alias 'minions-mode-line-delimiters
      'mode-line-modes-delimiters "Minions 1.1.0")
  (defcustom minions-mode-line-delimiters '("(" . ")")
    "Strings placed around mode elements in the mode line."
    :package-version '(minions . "0.3.1")
    :group 'minions
    :type '(choice (const :tag "No delimiters")
                   (cons (string :tag "Before string")
                         (string :tag "After string")))))

(static-if (boundp 'mode-line-minor-modes)
    nil
  (put 'minions-mode-line-modes 'risky-local-variable t)
  (defvar minions-mode-line-modes
    (let ((recursive-edit-help-echo "Recursive edit, type C-M-c to get out"))
      (list (propertize "%[" 'help-echo recursive-edit-help-echo)
            '(:eval (car minions-mode-line-delimiters))
            `(:propertize ("" mode-name)
                          help-echo "Major mode
mouse-1: Display major mode menu
mouse-2: Show help for major mode
mouse-3: Toggle minor modes"
                          mouse-face mode-line-highlight
                          local-map ,mode-line-major-mode-keymap)
            '("" mode-line-process)
            (propertize "%n" 'help-echo "mouse-2: Remove narrowing from buffer"
                        'mouse-face 'mode-line-highlight
                        'local-map (make-mode-line-mouse-map
                                    'mouse-2 #'mode-line-widen))
            `(:propertize ("" (:eval (minions--prominent-modes)))
                          mouse-face mode-line-highlight
                          help-echo "Minor mode
mouse-1: Display minor mode menu
mouse-2: Show help for minor mode
mouse-3: Toggle minor modes"
                          local-map ,mode-line-minor-mode-keymap)
            '(:eval (and (not (member minions-mode-line-lighter '("" nil))) " "))
            minions--mode-line-minor-modes
            '(:eval (cdr minions-mode-line-delimiters))
            (propertize "%]" 'help-echo recursive-edit-help-echo)
            " "))
    "Alternative mode line construct for displaying major and minor modes.
Similar to `mode-line-modes' but instead of showing (a subset
of) the enable minor modes directly in the mode line, list all
minor modes in a space conserving menu."))

;;; Banana!
(provide 'minions)
;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; minions.el ends here
