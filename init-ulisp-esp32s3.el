
;; from ulisp forum, iyzsong post Dec. '21 in "Emacs for programming"
;; dld 2025-02-14 - add flow control on sending to serial by delaying between each line

(defvar ulisp-port-name "/dev/ttyACM3"
  "Serial port name for uLisp.")
(defvar ulisp-port-speed 9600
  "Serial port speed for uLisp.")

(defun dld/comint-send-string-as-lines (process string)
  (if process
      (with-current-buffer (if (processp process)
                               (process-buffer process)
                             (get-buffer process))
        (comint-snapshot-last-prompt))
    (comint-snapshot-last-prompt))
  (let ((lines (split-string string "\n" t)))
    (dolist (l lines)
      (process-send-string process l)
      (process-send-string process "\n")
      (sleep-for 0.05))))

(defun dld/comint-send-region-as-lines (process start end)
  (if process
      (with-current-buffer (if (processp process)
                               (process-buffer process)
                             (get-buffer process))
        (comint-snapshot-last-prompt))
    (comint-snapshot-last-prompt))
  (let ((string (buffer-substring-no-properties
                 (region-beginning)
                 (region-end))))
    (let ((lines (split-string string "\n" t)))
      (dolist (l lines)
        (process-send-string process l)
        (process-send-string process "\n")
        (sleep-for 0.05)))))

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
    (advice-add 'comint-send-string :override #'dld/comint-send-string-as-lines)
    (advice-add 'comint-send-region :override #'dld/comint-send-region-as-lines)
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

(defun disconnect-from-ulisp ()
  (interactive)
  (pop-to-buffer "*ulisp*")
  (kill-buffer "*ulisp*")
  (delete-window)
  (advice-remove 'comint-send-string #'dld/comint-send-string-as-lines)
  (advice-remove 'comint-send-region #'dld/comint-send-region-as-lines))

(global-set-key (kbd "C-c c") 'connect-to-ulisp)
(global-set-key (kbd "C-c d") 'disconnect-from-ulisp)

