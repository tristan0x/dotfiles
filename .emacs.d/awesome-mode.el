;;; awesome-mode.el --- Minor mode to dialog with awesome window manager

;;; Copyright (C) 2011 Tristan Carel
;;; Created:  April 2011
;;; Keywords: awesome lua dbus



(defgroup awesome nil
  "Send command to window-manager awesome "
  :group 'tools
  :prefix "awesome-")

(defcustom awesome-command "awesome-client 2>&1"
  "*Shell command used to send lua command to window manager."
  :type 'string
  :group 'awesome)

(defconst awesome-mode-version "0.0.1")

(defconst awesome-output-buffer "*Awesome Output*")
(make-variable-buffer-local 'awesome-output-buffer)

(defun awesome-send-region (start end)
  (interactive "r")
  (shell-command-on-region start end
			   awesome-command
			   awesome-output-buffer))

(defun awesome-send-buffer ()
  (interactive)
  (save-excursion
    (awesome-send-region (point-min) (point-max))))

(require 'derived)

(define-derived-mode 
  awesome-mode lua-mode "Awesome"
  "Major mode for editing awesome scripts"

  (use-local-map awesome-mode-map)
  (define-key awesome-mode-map "\C-c\C-c" 'awesome-send-buffer)
  (define-key awesome-mode-map "\C-c|" 'awesome-send-region)
)


(provide 'awesome-mode)
;;; Local Variables:
;;; after-save-hook: (lambda () (byte-compile-file buffer-file-name))
;;; End:
;;; awesome-mode.el ends here
