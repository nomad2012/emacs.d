
;; from ulisp forum, iyzsong post Dec. '21 in "Emacs for programming"

(defvar ulisp-port-name "/dev/ttyACM0"
  "Serial port name for uLisp.")
(defvar ulisp-port-speed 9600
  "Serial port speed for uLisp.")

(require 'inf-lisp)
(defun connect-to-ulisp (port speed)
  "Run a uLisp serial process, input and output via buffer *ulisp*."
  (interactive
   (if current-prefix-arg
       (list
        (read-file-name "Serial port: " "/dev" ulisp-port-name)
        ulisp-port-speed)
     (list ulisp-port-name ulisp-port-speed)))
  (with-current-buffer (make-comint-in-buffer "ulisp" "*ulisp*" nil)
    (setq-local inferior-lisp-buffer "*ulisp*")
    (inferior-lisp-mode))
  (when (not (string-equal
              "serial"
              (process-type (get-buffer-process "*ulisp*"))))
    (make-serial-process
     :buffer "*ulisp*"
     :port port
     :speed speed
     :noquery t))
  (setq-local inferior-lisp-buffer "*ulisp*")
  (pop-to-buffer "*ulisp*"))

(global-set-key (kbd "C-c c") 'connect-to-ulisp)

