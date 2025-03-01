;; based on ulisp forum posts by j-keck Nov. 18 in "Emacs for programming"

(defvar ulisp-term-port "/dev/ttyACM0")
(defvar ulisp-term-speed 9600)


;; send a string to the ulisp port.
;; send a line at a time, and delay after each to keep ESP32S3 serial buffer from hanging 
(defun ulisp-send-string (s)
  (with-current-buffer ulisp-term-port
     (end-of-buffer)
     (let ((lines (split-string s "\n")))
      (dolist (l lines)
        (insert l)
        (term-send-input)
        (sleep-for 0.4)))))


(defun ulisp-eval-last-expression-in-term ()
 (interactive)
 (let ((expr (buffer-substring-no-properties  
                    (save-excursion (backward-sexp) (point))
                    (point))))
   (ulisp-send-string expr)))


(defun ulisp-eval-region-in-term ()
 (interactive)
 (let ((expr (buffer-substring-no-properties  
                    (region-beginning)
                    (region-end))))
   (ulisp-send-string expr)))


(defun ulisp-connect-term ()
 (interactive)
 (split-window-below)
 (other-window 1)
 (serial-term ulisp-term-port ulisp-term-speed)
 (term-line-mode)
 (other-window 1))


(defun ulisp-disconnect-term ()
  (interactive)
  (pop-to-buffer ulisp-term-port)
  (delete-window)
  (kill-buffer ulisp-term-port))


(global-set-key (kbd "C-c e") 'ulisp-eval-last-expression-in-term)
(global-set-key (kbd "C-c r") 'ulisp-eval-region-in-term)
(global-set-key (kbd "C-c c") 'ulisp-connect-term)
(global-set-key (kbd "C-c d") 'ulisp-disconnect-term)
