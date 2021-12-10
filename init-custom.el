(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ac-auto-start nil)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"] t)
 '(backup-directory-alist (quote (("." . "~/.emacs_backups"))))
 '(blink-cursor-mode nil)
 '(bm-highlight-style (quote bm-highlight-line-and-fringe))
 '(browse-url-browser-function (quote browse-url-chromium))
 '(calendar-latitude 33.672082)
 '(calendar-location-name "Brenda, AZ")
 '(calendar-longitude -113.937883)
 '(column-number-mode t)
 '(comint-move-point-for-output (quote others))
 '(comint-scroll-to-bottom-on-input (quote this))
 '(compilation-message-face (quote default))
 '(completion-ignored-extensions
   (quote
    (".o" "~" ".bin" ".bak" ".obj" ".map" ".ico" ".pif" ".lnk" ".a" ".ln" ".blg" ".bbl" ".dll" ".drv" ".vxd" ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".exe")))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-prefix-override-inhibit-delay 0.4)
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("ce557950466bf42096853c6dac6875b9ae9c782b8665f62478980cc5e3b6028d" "51b8c4adab95ff23b8f5cf07ea0b9805c8662936fe0d877d61a0dd02b6adc5f6" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "4eaad15465961fd26ef9eef3bee2f630a71d8a4b5b0a588dc851135302f69b16" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "53c542b560d232436e14619d058f81434d6bbcdc42e00a4db53d2667d841702e" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "085b401decc10018d8ed2572f65c5ba96864486062c0a2391372223294f89460" "fc3ba70e150efbe45db40b4b4886fc75716b4f3b1247a4b96e5be7cfbe4bc9e1" "0148d51dda0f69bdd9670469b7a46e1ab2301854558a63dde695f2c1355d8e73" "7eaa5c4ca8d21dab70143f64e2f9d829541a89a02e7d1d2616fa8772bbfce7cc" "948e22090fb44672cb0580529fc0a89598a6aea6bf2c2c78a8339e346365e524" "394504bd559027641b544952d6e9e1c6dcb306b4d1b2c4ad6b98d3e6b5459683" "758da0cfc4ecb8447acb866fb3988f4a41cf2b8f9ca28de9b21d9a68ae61b181" "36d0f600074e9299fb7b6a316161d99faa16a6551ddeda50980ae293e653e7b4" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "8dd5991bf912b39dc4ae77e2d6aa4882949f4441570222eaf25e07ec38c44d50" "fe6330ecf168de137bb5eddbf9faae1ec123787b5489c14fa5fa627de1d9f82b" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "fc2782b33667eb932e4ffe9dac475f898bf7c656f8ba60e2276704fabb7fa63b" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "97a2b10275e3e5c67f46ddaac0ec7969aeb35068c03ec4157cf4887c401e74b1" "65ae93029a583d69a3781b26044601e85e2d32be8f525988e196ba2cb644ce6a" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "16248150e4336572ff4aa21321015d37c3744a9eb243fbd1e934b594ff9cf394" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cea6d15a8333e0c78e1e15a0524000de69aac2afa7bb6cf9d043a2627327844e" "57072d797dc09fcf563051a85a29d6a51d6f2b1a602e029c35b05c30df319b2a" "7c043c631cfe141e6cb08936ae92396619266d67a1ccae59a7aa63064b24aa8f" "bad832ac33fcbce342b4d69431e7393701f0823a3820f6030ccc361edd2a4be4" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "572caef0c27b100a404db8d540fd5b31397f90ab660ef5539ff0863ff9bee26a" "a30d5f217d1a697f6d355817ac344d906bb0aae3e888d7abaa7595d5a4b7e2e3" "28ea856c2f85b4a908fe72e3dea5e28254b969b93cbe88e7cad1ed2fd19b53a1" "e292ec749f785d348969926448e25790356a7ce1a8fda6e695f5e8b70bed786b" "0d19ff470ad7029d2e1528b3472ca2d58d0182e279b9ab8acd65e2508845d2b6" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "86f4407f65d848ccdbbbf7384de75ba320d26ccecd719d50239f2c36bec18628" "ca229a0a89717c8a6fe5cd580ee2a85536fbafce6acb107d33cf38d52e2f492c" "25cfeb08ce2a19741a98639f57f77218badee1523eaec5d1b32831c7f9ed50d8" "96b023d1a6e796bab61b472f4379656bcac67b3af4e565d9fb1b6b7989356610" "40b9e2d35561f6d635cecc0b717e9e002ea3980bef8ec89023f02a89bd630af9" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "ed81411169b1b3e3d4cfc39b09d68ea13e0ff7708dc5b9d0bedb319e071968ad" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "2ed05ad19fa69927c7e19abd73465dbee92ae6b89b24cbfd33d6c12b64568e5a" "fc55a921b2c1d24233b678d133b9899e03144877d558cf6807ed51f83459d2d9" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "96efbabfb6516f7375cdf85e7781fe7b7249b6e8114676d65337a1ffe78b78d9" "1f70ca6096c886ca2a587bc10e2e8299ab835a1b95394a5f4e4d41bb76359633" "faee9b5542e25faa94e5242147429e25822662d55013d9d797c8abed3c2cb58d" "290987f8b1cbe93977fc21403c1e9bdc95013cb0cf29d0f6120768463ee61442" "2fa2edc14dbb434fa1a08262c088a337fc4bb3efc12c89fdb9a288620b58c6f0" "bbd99b10462e3d0f4ac6da09e23e5de1fed4f7fe87d679a6468a14b0b6c8e634" "e80a0a5e1b304eb92c58d0398464cd30ccbc3622425b6ff01eea80e44ea5130e" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "a99e7c91236b2aba4cd374080c73f390c55173c5a1b4ac662eeb3172b60a9814" "f350c66dcff6db73192c4819363b7c1992931841e5ab381b1ed57ef8257a498f" "6e92ca53a22d9b0577ad0b16e07e2e020c8b621197e39fec454048e51b7954cb" "9ffeaafbdeb8d440413888b996730c25ca79f591272f40d5a3a02b0b9b3e6c9a" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" "8ac31e1bc1920b33d478dfafb0b45989a00ede15a2388ea16093e7d0988c48d0" default)))
 '(desktop-save-mode nil)
 '(dired-dwim-target t)
 '(ecb-excluded-directories-regexps (quote ("^\\(CVS\\|\\.[^a-zA-Z]*\\)$")))
 '(ecb-layout-name "left1")
 '(ecb-options-version "2.50")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote (("c:" "c:") ("/" "/"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-toggle-layout-sequence (quote ("left1" "top1")))
 '(ecb-version-check nil)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(emms-player-list (quote (emms-player-mpv)))
 '(explicit-shell-file-name "/bin/bash")
 '(exwm-layout-show-all-buffers nil)
 '(exwm-systemtray-background-color "deep sky blue")
 '(exwm-workspace-show-all-buffers nil)
 '(exwm-workspace-warp-cursor t)
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#383838")
 '(forecast-api-key "a978cac41202734ba2d9e7c9dec803e8")
 '(forecast-units (quote us))
 '(fringe-mode 8 nil (fringe))
 '(help-window-select t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (quote
    ("#EFFF00" "#73CD4F" "#83DDFF" "MediumPurple1" "#66CDAA" "DarkOrange" "HotPink1" "#809FFF" "#ADFF2F")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors
   (quote
    ("#00FF99" "#CCFF99" "#FFCC99" "#FF9999" "#FF99CC" "#CC99FF" "#9999FF" "#99CCFF" "#99FFCC" "#7FFF00")))
 '(hl-paren-colors (quote ("#326B6B")))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces t)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote left))
 '(inhibit-startup-screen t)
 '(kept-new-versions 5)
 '(latex-run-command "pdflatex")
 '(linum-format " %7d ")
 '(ls-lisp-dirs-first t)
 '(ls-lisp-ignore-case t)
 '(ls-lisp-verbosity nil)
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#191919")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(mouse-avoidance-mode (quote jump) nil (avoid))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-M-RET-may-split-line nil)
 '(org-agenda-diary-file "~/org/journal.org")
 '(org-agenda-files (quote ("~/org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (plantuml . t))))
 '(org-completion-use-ido t)
 '(org-default-notes-file "~/org/notes.org")
 '(org-ditaa-jar-path "~/bin/ditaa0_9.jar")
 '(org-indirect-buffer-display (quote current-window))
 '(org-mobile-directory "~/Dropbox/org-mobile/")
 '(org-outline-path-complete-in-steps nil)
 '(org-plantuml-jar-path "~/bin/plantuml.jar")
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 9))))
 '(org-refile-use-outline-path t)
 '(org-replace-disputed-keys t)
 '(org-return-follows-link t)
 '(org-reverse-note-order t)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)" "CANCELED(c)"))))
 '(package-selected-packages
   (quote
    (emms treemacs desktop-environment bufler org-static-blog exwm-x exwm inf-clojure clojure-mode yasnippet xkcd w3 solarized-theme smex rainbow-delimiters projectile phoenix-dark-mono-theme paredit org-bullets org lusty-explorer lua-mode hideshowvis ghc forecast flx-ido expand-region ecb dired-details darkburn-theme company cdlatex bm auctex)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(powerline-color1 "#191919")
 '(powerline-color2 "#111111")
 '(prettify-symbols-unprettify-at-point (quote right-edge))
 '(save-interprogram-paste-before-kill t)
 '(scroll-conservatively 1000)
 '(scroll-preserve-screen-position t)
 '(semantic-symref-grep-shell "bash")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(split-height-threshold 40)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(vc-checkin-switches "-u nomadicnerd")
 '(vc-hg-global-switches nil)
 '(visible-bell t)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(window-divider-default-right-width 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier" :foundry "ibm" :slant normal :weight normal :height 98 :width normal))))
 '(bm-face ((((class color) (min-colors 89)) (:background "#DEB542" :foreground "#fdf6e3"))))
 '(bm-fringe-face ((((class color) (min-colors 89)) (:background "#DEB542" :foreground "#fdf6e3"))))
 '(ecb-default-highlight-face ((((class color) (min-colors 89)) (:background "#268bd2" :foreground "#fdf6e3")))))
