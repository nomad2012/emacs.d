;; keybindings to reduce chording & multi-key sequences

(global-unset-key (kbd "M-`"))
(global-unset-key (kbd "<f1>"))
(define-key help-map [f1] nil)
(define-key ctl-x-map [f1] nil)
(global-set-key (kbd "<f1>")   'bm-next)
(global-set-key (kbd "S-<f1>") 'bm-previous)
(global-set-key (kbd "C-<f1>") 'bm-toggle)
(global-set-key (kbd "M-<f1>") 'bm-bookmark-regexp)
(global-set-key (kbd "C-M-<f1>") 'bm-remove-all-current-buffer)
(global-set-key (kbd "<f2>")   'kill-region)                ;; C-w
(global-set-key (kbd "<f3>")   'kill-ring-save)             ;; M-w
(global-set-key (kbd "<f4>")   'yank)                       ;; C-y
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal) ;; C-x C-c
(global-set-key (kbd "<f5>")   'find-file)                  ;; C-x C-f
(global-set-key (kbd "S-<f5>") 'find-file-read-only)        ;; C-x C-r
(global-set-key (kbd "M-<f5>") 'find-alternate-file)        ;; C-x C-v
(global-set-key (kbd "<f6>")   'save-buffer)                ;; C-x C-s
(global-set-key (kbd "S-<f6>") 'write-file)                 ;; C-x C-w
(global-set-key (kbd "<f7>")   'kill-this-buffer)
(global-set-key (kbd "<f8>")   'list-buffers)               ;; C-x C-b
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> d") 'dired)
(global-set-key (kbd "<f9> e") 'ecb-activate)             ;; Emacs Code Browser
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> s") 'shell)
(global-set-key (kbd "<f9> I") 'bh/punch-in)
(global-set-key (kbd "<f9> O") 'bh/punch-out)
(global-set-key (kbd "<f10>")  'org-agenda)
(global-set-key (kbd "S-<f10>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f11>")  'kmacro-start-macro-or-insert-counter) ;; was <f3>
(global-set-key (kbd "<f12>")  'kmacro-end-or-call-macro)   ;; was <f4>
(global-set-key (kbd "C-z")    'undo)                       ;; C-_, C-/, C-x u
(global-set-key (kbd "C-x t")  'toggle-truncate-lines)      ;; wrap/truncate
(global-set-key (kbd "C-x w")  'toggle-word-wrap)           ;; word wrap


;; remap lwindow, rwindow, and apps keys to C-x and C-c prefixes
(setq w32-pass-lwindow-to-system nil) ;; prevent lwindow from activating Start Menu
(setq w32-pass-rwindow-to-system nil) ;; prevent rwindow from activating Start Menu
(setq w32-lwindow-modifier 'nil)      ;; make sure it's not used as a modifier
(setq w32-rwindow-modifier 'nil)      ;; make sure it's not used as a modifier
(define-key key-translation-map [lwindow] [?\C-x]) 
(define-key key-translation-map [rwindow] [?\C-x]) 
(define-key key-translation-map [apps] [?\C-c]) 

; even with the below, f1 still wants to be help; <f1> <f1> still acts like C-x C-h
;(global-unset-key (kbd "<f1>"))
;(define-key help-map [f1] nil)
;(define-key ctl-x-map [f1] nil)
;(define-key key-translation-map [f1] [?\C-x]) 

;; C-a   <home>    move-beginning-of-line
;; C-b   <left>    backward-char
;; C-c   <apps>    mode-specific-prefix
;; C-d   <delete>  delete-char
;; C-e   <end>     move-end-of-line
;; C-f   <right>   forward-char
;; C-g             keyboard-quit
;; C-h   <f1>      help
;; C-i   <tab>     TAB
;; C-j             newline-and-indent
;; C-k             kill-line
;; C-l             recenter-top-bottom
;; C-m   RET       newline
;; C-n   <down>    next-line
;; C-o             open-line
;; C-p   <up>      previous-line
;; C-q             quoted-insert
;; C-r             isearch-backward
;; C-s             isearch-forward
;; C-t             transpose-chars
;; C-u             universal-argument
;; C-v   <next>    scroll-up
;; C-w   <f2>      kill-region
;; M-w   <f3>      kill-ring-save
;; C-x   <lwindow> control-x-prefix
;; C-y   <f4>      yank
;; C-z             undo
;; C-]             abort-recursive-edit
;; C-_             undo
;; C-SPC           set-mark-command
;; C--             negative-argument
;; C-/             undo

;; M-%             query-replace

;; should remap these to non-chorded keys for sticky modifiers
;; C-x @ S         event-apply-shift-modifier
;; C-x @ a         event-apply-alt-modifier
;; C-x @ c         event-apply-control-modifier
;; C-x @ h         event-apply-hyper-modifier
;; C-x @ m         event-apply-meta-modifier
;; C-x @ s         event-apply-super-modifier

;; useless bindings
;; <f2>            2C-command            -- replaced with kill-region
;; C-@             set-mark-command      -- use C-SPC instead
;; C-\             toggle-input-method   -- never use
;; C-t             transpose-chars       -- never use
;; C-z             suspend-frame         -- replaced with undo

;; available (unbound) keys
;; C-x c
;; C-x g
;; C-x j
;; C-x p
;; C-x t
;; C-x w
;; C-x x
;; C-x y
