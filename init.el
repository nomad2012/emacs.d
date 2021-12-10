(setq custom-file "~/.emacs.d/init-custom.el")
(load custom-file)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;    (load
;;     (expand-file-name "~/.emacs.d/elpa/package.el"))
;;  (package-initialize))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;
;; miscellaneous settings
;;
;; this fixes PageUp/PageDown, among other things 
;; (but C-x/C-c/C-v override was too much, so don't set full cua-mode)
(cua-selection-mode 1)
;; shift-arrows move cursor between windows (and now frames, too!)
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

;; save and restore window configurations
(winner-mode)

;; reduce annoying confirmation prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
        kill-buffer-query-functions))

;; enable company mode for auto-completion in all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; things grabbed from lolsmacs.el
(show-paren-mode)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

(global-hl-line-mode)

(setq whitespace-style '(tab-mark))
(global-whitespace-mode)

(size-indication-mode)

(delete-selection-mode 1)

;; better kill ring
(require 'browse-kill-ring)
(global-set-key (kbd "S-<f4>") 'browse-kill-ring)
;; miscellaneous overrides
;;(defalias 'list-buffers 'ibuffer)
(defalias 'list-buffers 'bufler)
;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

(delete-selection-mode 1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; ibuffer groups
(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("Org" ;; all org-related buffers
              (mode . org-mode))  
            ;; ("ROS"
            ;;  (filename . "~/catkin_ws/"))
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
            ;;("ERC"   (mode . erc-mode))
            ("EXWM" (mode . exwm-mode))))))

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
(setq pdb-path '/usr/bin/pdb
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
;;(require 'ecb)

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

;; use flx package for ido matching
(require 'flx-ido)
(flx-ido-mode 1)

;; IDO-style matching for M-x commands
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "<menu>") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'bm) ; bookmark support

;; When running in Windows, we want to use an alternate shell so we
;; can be more unixy.
;;(setq shell-file-name "C:/MinGW/msys/1.0/bin/bash")
;;(setq explicit-shell-file-name shell-file-name)
;;(setenv "PATH"
;;    (concat ".:/usr/local/bin:/mingw/bin:/bin:"
;;        (replace-regexp-in-string " " "\\\\ "
;;            (replace-regexp-in-string "\\\\" "/"
;;                (replace-regexp-in-string "\\([A-Za-z]\\):" "/\\1"
;;                    (getenv "PATH"))))))

;; org-mode setup
;(load "~/.emacs.d/init-org-mode")

;; custom key bindings
(load "~/.emacs.d/init-keybindings")

;;(autoload 'extempore-mode "~/.linuxbrew/Cellar/extempore/0.59/extras/extempore.el" "" t)
;;(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))
;;(setq user-extempore-directory "~/.linuxbrew/Cellar/extempore/0.59")

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))


;; (eval-after-load 'clojure-mode
;;   '(font-lock-add-keywords
;;     'clojure-mode `(("\\(#\\){"
;;                      (0 (progn (compose-region (match-beginning 1)
;;                                                (match-end 1) "∈")
;;                                nil))))))

(require 'rainbow-delimiters)
(require 'paredit)

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/clojure-mode"))
(autoload 'clojure-mode "clojure-mode" "" t)
;;(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))

;; allow me to dedicate a window to displaying a particular buffer,
;; so emacs doesn't use it for other things
(defun toggle-current-window-dedication ()
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/cider"))
;(require 'cider)

;; yasnippet mode
;(require 'yasnippet)
;(yas-global-mode 1)

;; allow resizing windows by dragging dividers
(window-divider-mode)
(setq display-buffer-alist
      `(;; no window
        ("\\`\\*Async Shell Command\\*\\'"
         (display-buffer-no-window))
        ;; top side window
        ("\\*\\(world-clock\\).*"
         (display-buffer-in-side-window)
         (window-height . 0.16)
         (side . top)
         (slot . -1))
        ("\\*\\(Flymake diagnostics\\|Package-Lint\\).*"
         (display-buffer-in-side-window)
         (window-height . 0.16)
         (side . top)
         (slot . 0))
        ("\\*Messages.*"
         (display-buffer-in-side-window)
         (window-height . 0.16)
         (side . top)
         (slot . 1))
        ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|Flymake log\\)\\*"
         (display-buffer-in-side-window)
         (window-height . 0.16)
         (side . top)
         (slot . 2))
        ;; left side window
        ;; right side window
        ("\\*\\(.* # Help.*\\|Help\\)\\*"    ; See the hooks for `visual-line-mode'
         (display-buffer-reuse-mode-window display-buffer-in-side-window)
         (window-width . 0.33)
         (side . right)
         (slot . 1))
        ("\\*keycast\\*"
         (display-buffer-in-side-window)
         (dedicated . t)
         (window-width . 0.25)
         (side . right)
         (slot . -1)
         (window-parameters . ((no-other-window . t)
                               (mode-line-format . none))))
        ;; bottom side window
        ("\\*Org Select\\*"
         (display-buffer-in-side-window)
         (dedicated . t)
         (side . bottom)
         (slot . 0)
         (window-parameters . ((mode-line-format . none))))
        ;; bottom buffer (NOT side window)
        ("\\*\\(Output\\|Register Preview\\).*"
         (display-buffer-reuse-mode-window display-buffer-at-bottom))
        ;; below current window
        ("\\*.*\\(e?shell\\|v?term\\).*"
         (display-buffer-reuse-mode-window display-buffer-below-selected))
        ("\\*\\vc-\\(incoming\\|outgoing\\|git : \\).*"
         (display-buffer-reuse-mode-window display-buffer-below-selected)
         ;; NOTE 2021-10-06: we cannot `fit-window-to-buffer' because
         ;; the height is not known in advance.
         (window-height . 0.2))
        ("\\*\\(Calendar\\|Bookmark Annotation\\).*"
         (display-buffer-reuse-mode-window display-buffer-below-selected)
         (window-height . fit-window-to-buffer))))

(setq window-combination-resize t)
(setq even-window-sizes 'height-only)
(setq window-sides-vertical nil)
(setq switch-to-buffer-in-dedicated-window 'pop)

(require 'org-static-blog)
(load "~/.emacs.d/init-org-static-blog")

;; allow fast startup of additional sessions with emacsclient
;(unless (server-running-p) (server-start))
(server-start)

;; make emacs my window manager
(require 'exwm)
(load "~/.emacs.d/init-exwm")
(dld/exwm-config-all)
