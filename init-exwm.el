(require 'exwm)
(require 'ido)
(require 'move-border)
(require 'desktop-environment)

(defun dld/exwm-config-all ()
  "configuration of EXWM."

  ;; xrandr configuration (multi-monitor support)
  (setq jw/x11-screen-list (jw/env-list "X11_SCREEN_LIST"))
  (setq jw/x11-screen-order-list (jw/env-list "X11_SCREEN_ORDER_LIST"))
  (setq jw/x11-screen-mode-list (jw/env-list "X11_SCREEN_MODE_LIST"))
  (setq jw/x11-screen-rate-list (jw/env-list "X11_SCREEN_RATE_LIST"))
  (setq jw/x11-screen-disabled-list (jw/env-list "X11_SCREEN_DISABLED_LIST"))
  (setq jw/exwm-workspace-list (jw/env-list "EXWM_WORKSPACE_LIST"))
  (setq jw/x11-screen-preferred (jw/env-str "X11_SCREEN_PREFERRED"))
  (setq jw/x11-display-dpi (jw/env-str "X11_DISPLAY_DPI"))
  (let ((env-var (getenv "X11_SCREEN_USE_ALL_AVAILABLE")))
    (setq jw/x11-screen-use-all-available
          (if (and (> (length env-var) 0) (string= "yes" env-var))
              t
            nil)))

  (setq exwm-randr-workspace-monitor-plist (jw/build-workspace-monitor-plist jw/exwm-workspace-list))
  (add-hook 'exwm-randr-screen-change-hook 'jw/exwm-change-screen-hook)
  (exwm-randr-enable)
  
  ;; Set the initial workspace number.
  (unless (get 'exwm-workspace-number 'saved-value)
    (setq exwm-workspace-number 4))
  
  ;; Make class name the buffer name
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))
  
  ;; When window title updates, use it to set the buffer name
  (add-hook 'exwm-update-title-hook #'dld/exwm-update-title)

  ;; Global keybindings.
  (unless (get 'exwm-input-global-keys 'saved-value)
    (setq exwm-input-global-keys
          `(
            ([?\s-R] . exwm-reset)                   ;; reset EXWM to line mode
            ([?\s-w] . exwm-workspace-switch)        ;; Switch to another workspace
            (,(kbd "s-<left>") . windmove-left)      ;; Move to window to the left of current one
            (,(kbd "s-<down>") . windmove-down)      ;; Move to window below current one
            (,(kbd "s-<up>") . windmove-up)          ;; Move to window above current one
            (,(kbd "s-<right>") . windmove-right)    ;; Move to window to the right of current one
            (,(kbd "S-s-<left>") . buf-move-left)    ;; Move buffer to window to left of current one
            (,(kbd "S-s-<down>") . buf-move-down)    ;; Move buffer to window below current one
            (,(kbd "S-s-<up>") . buf-move-up)        ;; Move buffer to window above current one
            (,(kbd "S-s-<right>") . buf-move-right)  ;; Move buffer to window to right of current one
            (,(kbd "s-\\") . my-toggle-window-split) ;; Swap between left/right and top/bottom split
            (,(kbd "s-<kp-2>") . (lambda ()          ;; Move window border down by 5 lines
                                   (interactive)
                                   (move-border-down 5)))
            (,(kbd "s-<kp-4>") . (lambda ()          ;; Move window border left by 8 columns
                                   (interactive)
                                   (move-border-left 8)))
            (,(kbd "s-<kp-6>") . (lambda ()          ;; Move window border right by 8 columns
                                   (interactive)
                                   (move-border-right 8)))
            (,(kbd "s-<kp-8>") . (lambda ()          ;; Move window border up by 5 lines
                                   (interactive)
                                   (move-border-up 5)))
            (,(kbd "s-q") . kill-current-buffer)
            ([pause] . toggle-current-window-dedication)
            (,(kbd "s-d") . toggle-current-window-dedication)
            (,(kbd "s-i") . exwm-input-toggle-keyboard)
            (,(kbd "s-c") . (lambda ()
                              (interactive)
                              (start-process-shell-command "chrome" nil "google-chrome")))
            (,(kbd "s-t") . (lambda ()
                              (interactive)
                              (start-process-shell-command "xfce4-terminal" nil "xfce4-terminal")))

            ([?\s-r] . (lambda (command)             ;; run command
                    (interactive (list (read-shell-command "run: ")))
                    (start-process-shell-command command nil command)))
            
            ([?\s-`] . (lambda ()                    ;; switch to workspace 0
                         (interactive)
                         (exwm-workspace-switch-create 0)))
            
            ;; 's-N': Switch to certain workspace.
            ,@(mapcar (lambda (i)
                        `(,(kbd (format "s-%d" i)) .
                          (lambda ()
                            (interactive)
                            (exwm-workspace-switch-create ,i))))
                      (number-sequence 0 9)))))

  (exwm-input-set-key (kbd "C-c 0")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 0)
                      (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 0)))))
  (exwm-input-set-key (kbd "C-c 1")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 1)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 1)))))
  (exwm-input-set-key (kbd "C-c 2")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 2)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 2)))))
  (exwm-input-set-key (kbd "C-c 3")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 3)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 3)))))
  (exwm-input-set-key (kbd "C-c 4")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 4)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 4)))))
  (exwm-input-set-key (kbd "C-c 5")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 5)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 5)))))
  (exwm-input-set-key (kbd "C-c 6")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 6)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 6)))))
  (exwm-input-set-key (kbd "C-c 7")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 7)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 7)))))
  (exwm-input-set-key (kbd "C-c 8")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 8)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 8)))))
  (exwm-input-set-key (kbd "C-c 9")
                      (lambda()
                        (interactive)
                        (exwm-move-window-to-workspace 9)
                        (run-with-idle-timer 0.05 nil (lambda() (exwm-workspace-switch 9)))))

  ;; Line-editing shortcuts
  (unless (get 'exwm-input-simulation-keys 'saved-value)
    (setq exwm-input-simulation-keys
          '(([?\C-b] . [left])
            ([?\C-f] . [right])
            ([?\C-p] . [up])
            ([?\C-n] . [down])
            ([?\C-a] . [home])
            ([?\C-e] . [end])
            ([?\M-v] . [prior])
            ([?\C-v] . [next])
            ([?\C-d] . [delete])
            ([?\C-k] . [S-end delete]))))
  ;;(require 'exwm-systemtray)
  ;;(exwm-systemtray-enable)
  ;; Enable EXWM -- currently done in .xinitrc.exwm
  (exwm-enable)
  ;; enable desktop-environment for volume/brightness keys
  (desktop-environment-mode)
  ;; Update panel indicator when workspace changes
  (add-hook 'exwm-workspace-switch-hook #'efs/send-polybar-exwm-workspace)
  ;; additional initialization taken from Emacs from Scratch by System Crafters
  (add-hook 'exwm-init-hook #'efs/exwm-init-hook)
  ;; Configure Ido
  (dld/exwm-config-ido)
  ;; Other configurations
  (dld/exwm-config-misc))

(defun dld/exwm-config--fix/ido-buffer-window-other-frame ()
  "Fix `ido-buffer-window-other-frame'."
  (defalias 'exwm-config-ido-buffer-window-other-frame
    (symbol-function #'ido-buffer-window-other-frame))
  (defun ido-buffer-window-other-frame (buffer)
    "This is a version redefined by EXWM.

You can find the original one at `exwm-config-ido-buffer-window-other-frame'."
    (with-current-buffer (window-buffer (selected-window))
      (if (and (derived-mode-p 'exwm-mode)
               exwm--floating-frame)
          ;; Switch from a floating frame.
          (with-current-buffer buffer
            (if (and (derived-mode-p 'exwm-mode)
                     exwm--floating-frame
                     (eq exwm--frame exwm-workspace--current))
                ;; Switch to another floating frame.
                (frame-root-window exwm--floating-frame)
              ;; Do not switch if the buffer is not on the current workspace.
              (or (get-buffer-window buffer exwm-workspace--current)
                  (selected-window))))
        (with-current-buffer buffer
          (when (derived-mode-p 'exwm-mode)
            (if (eq exwm--frame exwm-workspace--current)
                (when exwm--floating-frame
                  ;; Switch to a floating frame on the current workspace.
                  (frame-selected-window exwm--floating-frame))
              ;; Do not switch to exwm-mode buffers on other workspace (which
              ;; won't work unless `exwm-layout-show-all-buffers' is set)
              (unless exwm-layout-show-all-buffers
                (selected-window)))))))))

(defun dld/exwm-config-ido ()
  "Configure Ido to work with EXWM."
  (ido-mode 1)
  (add-hook 'exwm-init-hook #'dld/exwm-config--fix/ido-buffer-window-other-frame))

(defun dld/exwm-config-misc ()
  "Other configurations."
  ;; Make more room
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

    (require 'exwm)
    (require 'exwm-randr)
    (defun jw/env-list (env-string)
      "Return list of strings in environment variable env-string.
  nil if empty or undefined."
      (let ((env-var (getenv env-string)))
        (if env-var
            (split-string env-var)
          nil)))
    (defun jw/env-str (env-string)
      "Return string in environment variable env-string.
  nil if empty or undefined."
      (let ((env-var (getenv env-string)))
        (if (> (length env-var) 0)
            env-var
          nil)))

(defun exwm-move-window-to-workspace(workspace-number)
  (interactive)
  (let ((frame (exwm-workspace--workspace-from-frame-or-index workspace-number))
        (id (exwm--buffer->id (window-buffer))))
    (exwm-workspace-move-window frame id)))

(defun jw/build-workspace-monitor-plist (list)
  (let (transformed-list first second (rev-list (reverse list)))
    (while rev-list
      (setq second (car rev-list))
      (setq first (string-to-number (car (cdr rev-list))))
      (setq transformed-list (cons first (cons second transformed-list)))
      (setq rev-list (cdr (cdr rev-list)))
      )
    transformed-list))

(defun jw/xrandr-output-list ()
  "Return list of connected X11 screens, according to xrandr."
  (interactive)
  (let* ((xrandr-output-regexp "\n\\([^ ]+\\) connected ")
         (find-outputs
          (lambda ()
            (let (output-list)
              (call-process "/usr/bin/xrandr" nil t nil)
              (goto-char (point-min))
              (while (re-search-forward xrandr-output-regexp nil 'noerror)
                (setq output-list (cons (match-string 1) output-list))
                (forward-line))
              (reverse output-list))))
         (output-list (with-temp-buffer
                        (funcall find-outputs))))
    output-list))


(defun jw/exwm-change-screen-hook ()
  "Execute xrandr to select and position available screens according to X11_SCREEN_* environment variables."
  (let* ((output-list (jw/xrandr-output-list))
         (available-screens (seq-intersection jw/x11-screen-list output-list))
         (available-order-screens (seq-intersection jw/x11-screen-order-list output-list))
         ;; See "--auto" in xrandr(1) and https://github.com/ch11ng/exwm/issues/529.
         (unavailable-screens (seq-difference jw/x11-screen-list output-list))
         (available-disabled-screens (seq-intersection jw/x11-screen-disabled-list output-list))
         (available-screen-modes
          (let (mode-list
                mode screen
                (x-screen-list jw/x11-screen-list)
                (x-mode-list jw/x11-screen-mode-list))
            (while x-screen-list
              (setq screen (car x-screen-list))
              (setq x-screen-list (cdr x-screen-list))
              (setq mode (car x-mode-list))
              (setq x-mode-list (cdr x-mode-list))
              (if (seq-contains available-screens screen)
                  (setq mode-list (cons mode mode-list))))
            (reverse mode-list)))
         (available-screen-rates
          (let (rate-list
                rate screen
                (x-screen-list jw/x11-screen-list)
                (x-rate-list jw/x11-screen-rate-list))
            (while x-screen-list
              (setq screen (car x-screen-list))
              (setq x-screen-list (cdr x-screen-list))
              (setq rate (car x-rate-list))
              (setq x-rate-list (cdr x-rate-list))
              (if (seq-contains available-screens screen)
                  (setq rate-list (cons rate rate-list))))
            (reverse rate-list))))
    (if available-screens
        ;; Start building xrandr command line
        (let* ((x-primary-screen
                (if (and jw/x11-screen-preferred (seq-contains available-screens jw/x11-screen-preferred))
                    jw/x11-screen-preferred
                  (car available-screens)))
               (screen-pos (seq-position available-screens x-primary-screen))
               (x-primary-mode (elt available-screen-modes screen-pos))
               (x-primary-rate (elt available-screen-rates screen-pos))
               (xrandr-dpi-args
                (if jw/x11-display-dpi
                    (list jw/x11-display-dpi "--dpi")))
               (xrandr-primary-args (list x-primary-rate "--rate" x-primary-mode "--mode" "--primary" x-primary-screen "--output"))
               screen
               disabled-list
               (xrandr-disabled-args
                (progn
                  (while available-disabled-screens
                    (setq screen (car available-disabled-screens))
                    (setq available-disabled-screens (cdr available-disabled-screens))
                    (setq disabled-list (cons "--output" disabled-list))
                    (setq disabled-list (cons screen disabled-list))
                    (setq disabled-list (cons "--off" disabled-list)))
                  disabled-list))
               (unavailable-screen-list unavailable-screens)
               u-s-list
               (xrandr-unavailable-screen-args
                (progn
                  (while unavailable-screen-list
                    (setq screen (car unavailable-screen-list))
                    (setq unavailable-screen-list (cdr unavailable-screen-list))
                    (setq u-s-list (cons "--output" u-s-list))
                    (setq u-s-list (cons screen u-s-list))
                    ;; (setq u-s-list (cons "--auto" u-s-list))
                    (setq u-s-list (cons "--off" u-s-list)))
                  u-s-list))
               (screen-list available-screens)
               rest-list
               (xrandr-rest-available-screen-args
                (if jw/x11-screen-use-all-available
                    ;; Add remaining available screens, except the primary screen
                    (progn
                      (while screen-list
                        (setq screen (car screen-list))
                        (setq screen-list (cdr screen-list))
                        (if (not (string= screen x-primary-screen))
                            (progn
                              (setq rest-list (cons "--output" rest-list))
                              (setq rest-list (cons screen rest-list))
                              (setq rest-list (cons "--mode" rest-list))
                              (setq rest-list (cons (elt available-screen-modes (seq-position available-screens screen)) rest-list))
                              (setq rest-list (cons "--rate" rest-list))
                              (setq rest-list (cons (elt available-screen-rates (seq-position available-screens screen)) rest-list)))))
                      rest-list)
                  ;; Disable remaining available screens, except the primary screen
                  (progn
                    (while screen-list
                      (setq screen (car screen-list))
                      (setq screen-list (cdr screen-list))
                      (if (not (string= screen x-primary-screen))
                          (progn
                            (setq rest-list (cons "--output" rest-list))
                            (setq rest-list (cons screen rest-list))
                            (setq rest-list (cons "--off" rest-list)))))
                    rest-list)))
               (screen-order-list available-order-screens)
               order-list
               left-screen
               (xrandr-screen-order-args
                (if (and jw/x11-screen-use-all-available
                         (> (length screen-order-list) 1))
                    (progn
                      (setq left-screen (car screen-order-list))
                      (setq screen-order-list (cdr screen-order-list))
                      (while screen-order-list
                        (setq screen (car screen-order-list))
                        (setq screen-order-list (cdr screen-order-list))
                        (setq order-list (cons "--output" order-list))
                        (setq order-list (cons screen order-list))
                        (setq order-list (cons "--right-of" order-list))
                        (setq order-list (cons left-screen order-list))
                        (setq left-screen screen))
                      (reverse order-list))))
               (xrandr-args (reverse (append xrandr-rest-available-screen-args xrandr-unavailable-screen-args
                                             xrandr-disabled-args xrandr-primary-args xrandr-dpi-args))))
          (progn
            (setq jw/debug-output-list output-list)
            (setq jw/debug-xrandr-args xrandr-args)
            (setq jw/debug-xrandr-order-args xrandr-screen-order-args)
            (apply #'call-process
                   "/usr/bin/xrandr" nil nil nil
                   xrandr-args)
            (if xrandr-screen-order-args
                (apply #'call-process
                       "/usr/bin/xrandr" nil nil nil
                       xrandr-screen-order-args)))
          )
      )
    )
  )

(defun dld/exwm-update-title ()
  (pcase exwm-class-name
    ("Google-chrome" (exwm-workspace-rename-buffer (format "Chrome: %s" exwm-title)))))

(defvar efs/polybar-process nil
  "Holds the process of the running Polybar instance, if any")

(defun efs/kill-panel ()
  (interactive)
  (when efs/polybar-process
    (ignore-errors
      (kill-process efs/polybar-process)))
  (setq efs/polybar-process nil))

(defun efs/start-panel ()
  (interactive)
  (efs/kill-panel)
  (setq efs/polybar-process (start-process-shell-command "polybar" nil "polybar panel")))

(defun efs/send-polybar-hook (module-name hook-index)
  (start-process-shell-command "polybar-msg" nil (format "polybar-msg hook %s %s" module-name hook-index)))

(defun efs/send-polybar-exwm-workspace ()
  (efs/send-polybar-hook "exwm-workspace" 1))

(defun efs/run-in-background (command)
  (let ((command-parts (split-string command "[ ]+")))
    (apply #'call-process `(,(car command-parts) nil 0 nil ,@(cdr command-parts)))))

(defun efs/exwm-init-hook ()
  ;; Make workspace 1 be the one where we land at startup
  (exwm-workspace-switch-create 1)

  ;; Open eshell by default
  ;;(eshell)

  ;; NOTE: The next two are disabled because we now use Polybar!

  ;; Show battery status in the mode line
  ;;(display-battery-mode 1)

  ;; Show the time and date in modeline
  ;;(setq display-time-day-and-date t)
  ;;(display-time-mode 1)
  ;; Also take a look at display-time-format and format-time-string

  ;; Start the Polybar panel
  (efs/start-panel)

  ;; Launch apps that will run in the background
  (efs/run-in-background "nm-applet")
  (efs/run-in-background "pasystray")
  (efs/run-in-background "blueman-applet")
  (efs/run-in-background "solaar")
  )



(provide 'dld/exwm-config)

