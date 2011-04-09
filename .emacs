;;
;; .emacs for emacs conf
;;
;; Made by Tristan Carel
;; Mail    <tristan.carel@gmail.com>
;;
;; Started on  Wed Dec 28 19:44:33 2005 Tristan Carel
;; Last update Thu Apr  7 15:43:54 2011 Tristan Carel
;;

(setq emacs-conf-d (expand-file-name "~/.emacs.d"))

(setq load-path
      (append load-path
              (mapcar 'expand-file-name
                      (cons emacs-conf-d
                            '("~/.emacs.d/mode"
                              "~/.emacs.d/color-theme-6.6.0"
                              "~/.emacs.d/mode/tuareg")))))



(mapcar '(lambda (arg) (load-file (expand-file-name arg)))
        '("~/.emacs.d/byte-compile.el"
          "~/.emacs.d/rc.el"))
