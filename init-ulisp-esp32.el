
;; from ulisp forum, iyzsong post Dec. '21 in "Emacs for programming"
;; dld 2025-02-14 - add flow control on sending to serial by delaying between each line

(defvar ulisp-port-name "/dev/ttyACM3"
  "Serial port name for uLisp.")
(defvar ulisp-port-speed 9600
  "Serial port speed for uLisp.")

(defun dld/comint-flowcontrolled-send (proc string)
  "Override function for sending to PROC input STRING.
This just sends STRING plus a newline.  To override this,
set the hook `comint-input-sender'."
  (let ((send-string
         (if comint-input-sender-no-newline
             string
           ;; Sending as two separate strings does not work
           ;; on Windows, so concat the \n before sending.
           (concat string "\n"))))
    (let (lines))
    (comint-send-string proc send-string))
  (if (and comint-input-sender-no-newline
       (not (string-equal string "")))
      (process-send-eof)))

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
    (setq-local comint-input-sender (function dld/comint-flowcontrolled-send))
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

