;;
;; personal.el for emacs conf
;;
;; Made by Tristan Carel
;; Mail    <tristan@epita.fr>
;;
;; Started on  Sun Sep 19 02:35:49 2004 Tristan Carel
;; Last update Mon Aug 28 15:13:37 2006 Tristan Carel
;;

;;; Personal Informations ;;;
;;; --------------------- ;;;

(defgroup user-details nil
  "User's informations."
  :group 'Environment)

(defcustom user-login-name (getenv "USER")
  "Login of the user."
  :group 'user-details
  :type	'(string))

(setq user-full-name (getenv "FULLNAME"))

(defcustom user-nickname (getenv "NICKNAME")
  "Nickname of the user."
  :group 'user-details
  :type '(string))

(defcustom user-mail-address (getenv "EMAIL")
  "Primary email of the user."
  :group 'user-details
  :type '(string))

(defcustom user-location (getenv "LOCATION")
  "Location of the user."
  :group 'user-details
  :type '(string))

(custom-set-variables
 '(user-mail-address (getenv "EMAIL"))
 '(mail-host-address
   (if (string-match "@\\(.+\\)$" user-mail-address)
       (substring user-mail-address (match-beginning 1) (match-end 1))
     "localdomain"))
 '(next-line-add-newlines nil))

;;; Local Variables:
;;; after-save-hook: (lambda () (byte-compile-file buffer-file-name))
;;; End:
