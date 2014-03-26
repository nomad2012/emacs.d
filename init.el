(setq custom-file "~/.emacs.d/init-custom.el")
(load custom-file)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;(when
;    (load
;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;  (package-initialize))
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;
;; miscellaneous settings
;;
; this fixes PageUp/PageDown, among other things 
; (but C-x/C-c/C-v override was too much, so don't set full cua-mode)
(cua-selection-mode 1)
; shift-arrows move cursor between windows (and now frames, too!)
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)
; reduce annoying confirmation prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))
; better kill ring
(require 'browse-kill-ring)
(global-set-key (kbd "S-<f4>") 'browse-kill-ring)
;; miscellaneous overrides
(defalias 'list-buffers 'ibuffer)

(delete-selection-mode 1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; ibuffer groups
(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("Org" ;; all org-related buffers
              (mode . org-mode))  
            ("Mail"
              (or  ;; mail-related buffers
               (mode . message-mode)
               (mode . mail-mode)
               ;; etc.; all your mail related modes
               ))
            ("CW Port"
              (filename . "c:/Dennis/"))
            ("MyProject2"
              (filename . "src/myproject2/"))
            ("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . python-mode)
                (mode . emacs-lisp-mode)
                (mode . makefile-mode)
                (mode . shell-mode)
                (mode . eshell-mode)
                ;; etc
                )) 
            ("ERC"   (mode . erc-mode))))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

;;
;; python support
;;
;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook 
	  '(lambda () 
	     (define-key python-mode-map "\C-m" 'newline-and-indent)))
;; set path to pdb
(setq pdb-path 'c:/Python26/pdb.bat
      gud-pdb-command-name (symbol-name pdb-path))
;; default pdb argument
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
			    (file-name-nondirectory buffer-file-name)))))


;;
;; CEDET/EBC
;;
;;(add-to-list 'load-path "~/cedet/common")
(require 'cedet)

;; Enable EDE (Project Management) features 
(global-ede-mode 1)

;; Enabling Semantic (code-parsing, smart completion) features 
;; Select one of the following:
;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)
;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)
;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)
;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)
;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; enable Emacs Code Browser (ECB)
;;(add-to-list 'load-path "~/ecb-2.40")
(require 'ecb)


;; org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;; org-remember mode
;;(org-remember-insinuate)
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)

;; org-bullets mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; set theme
;;(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)
(load-theme 'darkburn t)

;; auto-complete mode
;(add-to-list 'load-path "~/.emacs.d/")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;(ac-config-default)
;(global-set-key (kbd "M-/") 'auto-complete)


;; toggle horizontal/vertical window split
(defun my-toggle-window-split ()
  "Vertical split shows more of each line, horizontal split shows
more lines. This code toggles between them. It only works for
frames with exactly two windows."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x \\") 'my-toggle-window-split) 


;; buffer-move
(require 'buffer-move)
(global-set-key (kbd "<C-kp-8>") 'buf-move-up)
(global-set-key (kbd "<C-kp-2>") 'buf-move-down)
(global-set-key (kbd "<C-kp-4>") 'buf-move-left)
(global-set-key (kbd "<C-kp-6>") 'buf-move-right)


;; change dired to use a single buffer instead of 1 per directory
(require 'dired-single)
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
        loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer "..")))))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))


;; add visible markers in fringe for foldable sections
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                    'python-mode-hook))
  (add-hook hook 'hideshowvis-enable))
(define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

(defcustom hs-fringe-face 'hs-fringe-face
  "*Specify face used to highlight the fringe on hidden regions."
  :type 'face
  :group 'hideshow)

(defface hs-fringe-face
  '((t (:foreground "#888" :box (:line-width 2 :color "grey75" :style released-button))))
  "Face used to highlight the fringe on folded regions"
  :group 'hideshow)

(defcustom hs-face 'hs-face
  "*Specify the face to to use for the hidden region indicator"
  :type 'face
  :group 'hideshow)

(defface hs-face
  '((t (:background "#ff8" :box t)))
  "Face to hightlight the ... area of hidden regions"
  :group 'hideshow)

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let* ((marker-string "*fringe-dummy*")
           (marker-length (length marker-string))
           (display-string (format "(%d)..." (count-lines (overlay-start ov) (overlay-end ov))))
           )
      (overlay-put ov 'help-echo "Hidden text. C-c,= to show")
      (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'hs-fringe-face) marker-string)
      (overlay-put ov 'before-string marker-string)
      (put-text-property 0 (length display-string) 'face 'hs-face display-string)
      (overlay-put ov 'display display-string)
      )))

(setq hs-set-up-overlay 'display-code-line-counts)

;; IDO-style matching for M-x commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'bm) ; bookmark support

;; When running in Windows, we want to use an alternate shell so we
;; can be more unixy.
(setq shell-file-name "C:/MinGW/msys/1.0/bin/bash")
(setq explicit-shell-file-name shell-file-name)
(setenv "PATH"
    (concat ".:/usr/local/bin:/mingw/bin:/bin:"
        (replace-regexp-in-string " " "\\\\ "
            (replace-regexp-in-string "\\\\" "/"
                (replace-regexp-in-string "\\([A-Za-z]\\):" "/\\1"
                    (getenv "PATH"))))))

(load "~/.emacs.d/init-keybindings")

;; allow fast startup of additional sessions with emacsclient
(server-start)
