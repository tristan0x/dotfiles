;;
;; File    .emacs.d/rc.el for emacs conf, part of synconf project.
;; Made by Tristan Carel
;; Mail    <tristan@epita.fr>
;;
;; Started on  Tue Jan 27 08:03:20 2004 Tristan Carel
;; Last update Fri Oct  7 10:17:51 2011 
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

;;; Themes ;;;
;;; ------ ;;;

;;(require 'color-theme)
;;(load-file (expand-file-name "color-theme-blackboard.el" emacs-conf-d))


;; indentation width
;; c-basic-offset


;; ----------------------------------------------------------------------------

;;; Text Mode ;;;
;;; --------- ;;;

;; launch every command that must not be loaded in text-mode
;;	- speedbar
;;	- no toolbar
(if (memq window-system '(x mac w32))
    (progn
      (scroll-bar-mode -1)	;; no scrollbar
      (tool-bar-mode -1)))	;; no toolbar


;; Personal Informations
(load	"personal")

(load	"gpg")

;;(require 'vc-partial-commit)

;;; Language Configuration ;;;
;;; ---------------------- ;;;

;; Use unicode character set
(set-language-environment 'UTF-8)

;; Having accents even in console mode
(if (memq window-system '(nil))
    (progn
      (standard-display-european nil)
      (normal-erase-is-backspace-mode t)))

;; ----------------------------------------------------------------------------

;;; Coding ;;;
;;; ------ ;;;

;; default Epita file header
;;(load		"std")
;;(load		"std_comment")

;; powerfull mode for mutt
;;(require	'post)
;;(load		"post")

;; some C useful macros
;;(load		"c")

;; some LaTeX useful macros
;;(load		"latex")

;; hook for major mode
;;(load		"hook")


(autoload 'gtags-mode' "gtags" "" t)
(autoload	'tuareg-mode	"tuareg"    "Major mode for Caml code" t)
(autoload	'camldebug	"camldebug" "Run the Caml debugger" t)

(autoload	`tiger-mode	"tiger-mode" "Major mode for Tiger code" t)
(autoload	`make-regexp	"make-regexp" t)
(autoload	`flex-mode	"flex-mode" "Major mode for Flex code" t)
(autoload	`bison-mode	"bison-mode" "Major mode for Bison code" t)
(autoload	'cmake-mode	"cmake-mode" "Major mode for CMake code" t)
(autoload 'awesome-mode' "awesome-mode" "Major mode for Awesome" t)

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))



(require 'ido)
(ido-mode t)
(add-to-list 'load-path "~/.emacs.d/mode/rinari")
(require 'rinari)


(autoload	'php-mode	"php-mode"  "Major mode for PHP code" t)

(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
;; Python module content autocompletion


;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/mode/rhtml")
     (require 'rhtml-mode)
     (add-hook 'rhtml-mode-hook
                 (lambda () (rinari-launch)))
(autoload 'css-mode "css-mode" "Major mode for CSS code" t)


;; html generator
(autoload `htmlize-buffer "htmlize" "for generating html" t)
(autoload `htmlize-region "htmlize" "for generating html" t)
(autoload `htmlize-file "htmlize" "for generating html" t)
(autoload `htmlize-file-many-files "htmlize" "for generating html" t)
(autoload `htmlize-file-many-files-dired "htmlize" "for generating html" t)

;; dot mode
(autoload `graphviz-dot-mode	"graphviz-dot-mode" "Major mode for dot" t)

;; fancy comment box
(autoload	'rebox-comment		"rebox" nil t)
(autoload	'rebox-region		"rebox" nil t)
(setq		rebox-default-style	223)

;; default command for 'compile'
'(compile-command	"make -k"	t)

;; load file templates module
;;(load			"auto-template")

;; general bindkeys
;;(load			"bindkeys")

;; Default spell checker
;;(setq-default ispell-program-name "aspell")

(custom-set-variables
 '(py-tab-always-indent nil)
 '(py-indent-offset 2)
 ;; avoid file without final '\n'
 '(next-line-add-newlines nil)
 ;; iswitch configuration
 '(iswitchb-max-to-show 10)
 '(iswitchb-mode t nil (iswitchb))
 '(iswitchb-use-frame-buffer-list t)
 '(iswitchb-use-virtual-buffers t nil (recentf))
 ;; Set Frame title
 '(frame-title-format
   (quote (:eval
	   (concat "[EMACS] "
		   (if buffer-file-name default-directory "%b")))) t)
 ;; make file executable if it's a script
 '(after-save-hook
   (quote (executable-make-buffer-file-executable-if-script-p)))

 ;; buffer name
 '(uniquify-buffer-name-style
   (quote post-forward-angle-brackets) nil (uniquify))

 ;; default to unified diffs
 '(diff-switches "-u")

 ;; Decoration level for fonctification
 '(font-lock-maximum-decoration t)
 '(global-font-lock-mode t nil (font-lock)))


;; 'y' and 'n' character replace 'yes' and 'no' confirmations.
(fset	'yes-or-no-p	'y-or-n-p)

;; Le curseur reste toujours a la meme position quand on scroll
(setq	scroll-preserve-screen-position t)

;; display useless ' ' at the end of line
(setq-default	show-trailing-whitespace t)

;; Tab width set to 2 spaces
(setq-default tab-width 2)
;; Indentation cannot insert tabs
(setq-default indent-tabs-mode nil)
(setq tab-stop-list
      '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50
          52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96
          98 100 102 104 106 108 110 112 114 116 118 120))

;;; Display ;;;
;;; ------- ;;;

;; Show selections
(pc-selection-mode)
(pc-bindings-mode)

(global-set-key			[delete]	'delete-char)
(normal-erase-is-backspace-mode)
(global-set-key			[kp-divide]	"/")

;; don't display the menubar
(menu-bar-mode	-1)

;; display time at the bottom in 24h time format
(display-time)
(setq		display-time-24hr-format	t)

;; very useful switch buffer manager
(iswitchb-mode)

;; Display pictures
(auto-image-file-mode t)

(require 'footnote)
(add-hook 'message-mode-hook 'footnote-mode)

;; Calendar configuration
(setq	european-calendar-style 't)
(setq	calendar-week-start-day 1)
(setq	calendar-day-name-array
	["Dimanche"	"Lundi"		"Mardi"		"Mercredi"
	 "Jeudi"	"Vendredi"	"Samedi"])
(setq	calendar-month-name-array
	["Janvier"	"Février"	"Mars"		"Avril"
	 "Mai"		"Juin"		"Juillet"	"Août"
	 "Septembre"	"Octobre"	"Novembre"	"Décembre"])
(setq vc-follow-symlinks t)

;;; Misc variables ;;;
;;; -------------- ;;;

;; No message at startup
(setq	inhibit-startup-message		t)
;; Don't make ~ files in the working directory
(setq	make-backup-files		nil)
(delete-selection-mode			t)
(setq delete-auto-save-files		t)
(global-auto-revert-mode		t)

(custom-set-variables
 ;; display number of lines/columns at the bottom
 '(line-number-mode		t)
 '(column-number-mode		t)

 ;; Default are too height
 '(buffer-menu-height		10	t)
 '(completion-list-height	10	t)

 ;; No more bip
 '(visible-bell			t)

 ;; stop asking when following symlink
 '(setq vc-follow-symlinks t)

 ;; size of compilation log window
 '(compilation-window-height	15	t)
 '(compilation-scroll-output	t)

 ;; autosave when compiling
 '(compilation-ask-about-save nil	t)
 '(global-auto-revert-mode	t	nil	(autorevert))

 ;; if cursor is at end of line, move up or down
 ;; and the cursor stay at end of line
 '(track-eol			t))

;; ----------------------------------------------------------------------------

;;; Netsoul configuration ;;;
;;; --------------------- ;;;
;; (defun synconf-netsoul-setup ()
;;   (interactive)
;;   (let ((original-buffer (current-buffer)))
;;     (find-file (expand-file-name "netsoul/netsoul-config.el" emacs-conf-d))
;;     (widen)
;;     (erase-buffer)
;;     (auto-template
;;      (expand-file-name "netsoul/netsoul-config.tpl" emacs-conf-d)
;;      (expand-file-name "netsoul/netsoul-config.sub" emacs-conf-d))
;;     (insert "\n")
;;     (save-buffer)
;;     (kill-buffer (current-buffer))
;;     (set-buffer original-buffer)))
;; (if (file-readable-p
;;      (expand-file-name "netsoul/netsoul-config.el" emacs-conf-d))
;;     (load-file
;;      (expand-file-name "netsoul/netsoul-config.el" emacs-conf-d))
;;   (if (y-or-n-p "Do you want to use Enetsoul? ")
;;       (synconf-netsoul-setup)
;;     (progn
;;       (message "created empty netsoul configuration")
;;       (find-file (expand-file-name "netsoul/netsoul-config.el" emacs-conf-d))
;;       (insert "\n")
;;       (save-buffer)
;;       (kill-buffer (current-buffer)))))

;; ----------------------------------------------------------------------------

;;; Orthographe Correction ;;;
;;; ---------------------- ;;;

(defun ispell-check ()
  (interactive)
  (if	mark-active
      (if (< (mark) (point))
	  (ispell-region	(mark) (point))
	(ispell-region		(point) (mark)))
    (ispell-buffer)))

(global-set-key [(control $)]		`ispell-check)
(global-set-key [(meta $)]		`ispell-word)
(global-set-key [(control meta $)]	`ispell-change-dictionary)
(setq		ispell-local-dictionary	"francais")


;;; Some general functions ;;;
;;; ---------------------- ;;;

;; convert a buffer from dos ^M end of lines to unix end of lines
(defun dos2unix ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

;; vice versa
(defun unix2dos ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))

;; Kill all buffers
(defun kill-all-buffers ()
  "Kill all buffers without prompting."
  (interactive)
  (let ((list (buffer-list)))
    (while list
      (let* ((buffer (car list))
	     (name (buffer-name buffer)))
	(kill-buffer buffer))
      (setq list (cdr list)))))

;; Use to create a file which header automatically filled.
(defun touch (filename)
  "Open filename, if it does not exists, create it and use auto-template to
pre-fill the file. Then the buffer is closed."
  (interactive "F")
  (find-file filename)
  (save-buffer)
  (kill-buffer (buffer-name)))

;;; launch the good mode in function of file extension ;;;
;;; -------------------------------------------------- ;;;
(setq auto-mode-alist
      (append
       '(
	 ;; SVN commit message
	 ("svn-commit\\.?[0-9]*\\.tmp"	.	change-log-mode)

	 ;; ChangeLog.txt
	 ("ChangeLog\\.txt"		.	change-log-mode)

	 ;; CMake
	 ("CMakeLists\\.txt\\'"		.	cmake-mode)
	 ("\\.cmake\\'"			.	cmake-mode)

	 ;; mutt
	 ("mutt-"			.	post-mode)

	 ;; Use C++ mode for C headers
	 ("\\.h\\'"			.	c++-mode)

	 ;; Use C++ mode for GPU files
	 ("\\.frag\\'"			.	c++-mode)
	 ("\\.vert\\'"			.	c++-mode)

	 ;; use C++ mode for Swig file
	 ("\\.i\\'"			.	c++-mode)

	 ;; Bison
	 ("\\.y\\y?\\'"			.	bison-mode)

	 ;; Python
	 ("\\.py$"			.	python-mode)
   ("SConscript"      . python-mode)
   ("SConstruct"      . python-mode)

   ("\\.rb$" . ruby-mode)

   ("\\.aws"  . awesome-mode)

	 ;; Flex
	 ("\\.l\\l?\\'"			.	flex-mode)

	 ;; Tiger
	 ("\\.tig\\'"			.	tiger-mode)

	 ("\\.dot\\'"			.	graphviz-dot-mode)

	 ;; sparc asm
	 ("\\.aasm\\'"			.	asm-mode)

	 ;; see tiger coding style
	 ("\\.hcc\\'"			.	c++-mode)

	 ;; Caml
	 ("\\.ml\\w?\\'"		.	tuareg-mode)

	 ;; TODO
	 ("TODO"			.	outline-mode)

	 ;; PHP
	 ("\\.php$"			.	php-mode)

	 ;; gnus configuration file
	 ("\\.gnus"			.	emacs-lisp-mode)

   ;; zsh scripts
   ("\\.zsh"      . shell-script-mode)

	 ;; mutt configuration file
	 ("\\.muttrc$"			.	shell-script-mode))
       auto-mode-alist))



;(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
; '(blink-cursor nil)
; '(browse-url-browser-function (quote browse-url-generic) t)
; '(browse-url-generic-program "mozilla" t)
; '(canlock-password "8b3f7bf6684069fa9507037ebca2d2818ec5e216")
; '(display-time-24hr-format t)
; '(fancy-splash-image "~bardet_h/splash.png")
; '(mail-signature t)
; '(mail-yank-prefix "> ")
; '(smtpmail-default-smtp-server "smtp.epita.fr")
; '(smtpmail-smtp-server "smtp.epita.fr")
; '(smtpmail-smtp-service 25)
;; '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :family "outline-courier new"))))
; '(cursor ((t (:background "orchid")))))

;;; Local Variables:
;;; after-save-hook: (lambda () (byte-compile-file buffer-file-name))
;;; End:


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))
