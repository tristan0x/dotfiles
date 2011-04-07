;;
;; File	   .emacs.d/byte-compile.el for emacs conf
;; Made by Tristan Carel
;; Login   <tristan.carel@gmail.com>
;;
;; Started on  Mon Jul 31 05:17:50 2006 Tristan Carel
;; Last update Thu Apr  7 15:19:40 2011 Tristan Carel
;;
;; Copyright (C) 2006, 2007 Tristan Carel
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
;;
;; $Revision$
;; $Date::                                                                   $
;;

;; recompile all outdated .el files.

(defun update-byte-code-file (file)
  "Recompile the Emacs Lisp file given as parameter if the source code is
newer than the byte code file."
  (interactive "f")
  (if (and (string-match "\\.el$" file)
           (file-newer-than-file-p file (concat file "c")))
      (byte-compile-file file)))

(setq conf-as-byte-code
      '(
        "auto-template.el"
        "bindkeys.el"
        "c.el"
        "color-theme.el"
        "hook.el"
        "latex.el"
        "mode/bison-mode.el"
        "mode/cmake-mode.el"
        "mode/flex-mode.el"
        "mode/gpg.el"
        "mode/php-mode.el"
        "mode/python-mode.el"
        "mode/ruby-mode.el"
        "mode/tiger-mode.el"
        "mode/yaml-mode.el"
        "mode/tuareg/custom-tuareg.el"
        "mode/tuareg/append-tuareg.el"
        "mode/tuareg/tuareg.el"
        "mode/tuareg/camldebug.el"
        "personal.el"
        "post.el"
        "rc.el"
        "rebox.el"
        "std.el"
        "std_comment.el"
        ))

(dolist (file conf-as-byte-code)
  (update-byte-code-file (expand-file-name file emacs-conf-d)))
