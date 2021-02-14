(setq doom-scratch-initial-major-mode 'org-mode)

(provide 'config)

;; (setq projectile-mode-line "Projectile")
;; (setq projectile-track-known-projects-automatically 'nil)

;; (require 'fast-scroll)
;; (fast-scroll-config)
;; (fast-scroll-mode 1)
(setq fast-but-imprecise-scrolling 't)
(setq jit-lock-defer-time 0)
(setq display-line-numbers-type nil)
(setq doom-theme 'doom-tomorrow-night)
;;(setq doom-theme 'doom-nord-light)
(setq doom-modeline-enable-word-count nil)

(after! gcmh
  (setq gcmh-high-cons-threshold 33554432))

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* & *Messagesh*
(kill-buffer "*scratch*")
(kill-buffer "*Messages*")
(setq-default message-log-max nil)
(setq inhibit-startup-buffer-menu t)

;;(add-to-list 'company-backends 'company-nixos-options)

(map! :leader
      :desc "Tangle current file" "c t"   #'org-babel-tangle
      :desc "Tangle current file" "t t"   #'org-babel-tangle

      :desc "Highlight"    "t h"   #'hl-todo-mode
      :desc "Time"         "t T"   #'display-time

      :desc "Dired" "d d"   #'dired-jump

      :desc "Run code" "t c c" #'org-ctrl-c-ctrl-c
      :desc "Toggle command log mode" "t c m" #'command-log-mode
      :desc "Show command log buffer" "t c l" #'clm/toggle-command-log-buffer

   ;; :desc "Terminal buffer" "o T" #'vterm

      :desc "Presentation"      "t p"   #'org-present
      :desc "Quit presentation" "P q"   #'org-present-quit
      :desc "Next Slide"        "P h"   #'org-present-prev
      :desc "Prevous Slide"     "P l"   #'org-present-next
      :desc "Big Mode"          "P b"   #'org-present-big
      :desc "Small Mode"        "P s"   #'org-present-small
      :desc "First Slide"       "P B"   #'org-present-beginning
      :desc "End Slide"         "P E"   #'org-present-end
      )

(map! :leader
      (:prefix-map ("N" . "NixOS")
        :desc "NixOS Options" "h" #'helm-nixos-options))

(map! :leader
      (:prefix-map ("M" . "mode")

        :desc "Shell" "s" #'shell-script-mode))

(map! :leader
      (:prefix-map ("e" . "eval")

        :desc "Eval Sexp" "s" #'eval-last-sexp))

(map! :leader
      (:prefix-map ("T" . "Text")

        :desc "Figlet Border" "f b" #'figlet-border
        :desc "Figlet Future" "f f" #'figlet-future
        :desc "Figlet Pagga"  "f p" #'figlet-pagga
        :desc "Figlet Small"  "f s" #'figlet-small
        :desc "Figlet Future Border" "f F" #'figlet-future-border

        :desc "List - Lorem Ipsum" "l" #'lorem-ipsum-insert-list
        :desc "Sentences - Lorem Ipsum" "s" #'lorem-ipsum-insert-sentences
        :desc "Paragraphs - Lorem Ipsum" "p" #'lorem-ipsum-insert-paragraphs))

(evil-better-visual-line-on)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "J") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-up)
;; split-window-right

(map! (:after dired
       :map dired-mode-map
       :n "H" #'dired-up-directory
       :n "L" #'dired-find-file
       :n "<backspace>" #'dired-up-directory
       ))

;;(set-window-margins nil 2)

(setq doom-font (font-spec :family "Iosevka" :size 15)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 15)
      doom-big-font (font-spec :family "Iosevka" :size 24))

(setq-default left-margin-width 4 right-margin-width 4)
(set-window-buffer nil (current-buffer))



(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(when (file-exists-p "~/.doom.d/banner")
  (setq +doom-dashboard-banner-padding '(2 . 2)
        +doom-dashboard-banner-file "arkiv.png"
        +doom-dashboard-banner-dir "~/.doom.d/banner"))

;;  NIXOS ICON

(display-time-mode 1)
(setq display-time-format "%Y-%m-%d | %R [%Z] ")
(display-battery-mode 1) ;; Battery ERROR

;; Header
(setq-default header-line-format " ")
;;(set-face-attribute 'header-line nil  :height 150)

;; Doom Modeline
(setq doom-modeline-lsp t)
(setq doom-modeline-height 35)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-continuous-word-count-modes nil)

(custom-set-faces
  '(mode-line ((t (:family "Iosevka Term" :height 1.0))))
  '(mode-line-inactive ((t (:family "Iosevka Term" :height 1.0)))))

;;(setq centaur-tabs-set-bar 'over
;;      centaur-tabs-set-icons t
;;      centaur-tabs-gray-out-icons 'buffer
;;      centaur-tabs-height 18
;;      centaur-tabs-set-modified-marker t
;;      centaur-tabs-style "bar"
;;      centaur-tabs-modified-marker "•")
;;(map! :leader
;;      :desc "Toggle tabs on/off"
;;      "t c" #'centaur-tabs-local-mode)
;;(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
;;                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
;;                                               (kbd "g <down>")  'centaur-tabs-forward-group
;;                                               (kbd "g <up>")    'centaur-tabs-backward-group)

(setq evil-normal-state-cursor '("#dddddd" box))
(setq evil-visual-state-cursor '("#dddddd" box))
(setq evil-insert-state-cursor '("#dddddd" bar))

(setq company-idle-delay 0)
(setq company-tooltip-limit 6)
(setq company-dabbrev-downcase nil)
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-ignore-case nil)
(setq company-selection-wrap-around t)
(setq company-selection-default 0)

(defun figlet-border (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f term -F border" (current-buffer) t))

(defun figlet-future (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f future" (current-buffer) t))

(defun figlet-future-border (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f future -F border" (current-buffer) t))

(defun figlet-pagga (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "toilet -w 200 -f pagga -F border" (current-buffer) t))

(defun figlet-small (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "figlet -f small" (current-buffer) t))

(setq yas-snippet-dirs '("~/Project/NixOS/doom/snippets"))

(setq org-ellipsis " ")
(setq org-hide-emphasis-markers t)
(setq org-hide-leading-stars t)
(setq org-hidden-keywords '(title subtitle))

;; (eval-after-load 'org '(define-key org-mode-map
;;                (kbd "+") 'trigger-org-company-complete))

(custom-set-faces!
  '(org-document-title      :height 2.0 :foreground "#eaeaea")
  '(org-document-info       :height 1.0 :foreground "#cccccc" :italic t))

(custom-set-faces!
  '(link                    :height 1.0 :foreground "#5E81AC" :italic t)
  )

(custom-set-faces!
  '(org-level-1 :foreground "#eaeaea" :weight extra-bold :height 1.50 )
  '(org-level-2 :foreground "#dddddd" :weight bold       :height 1.20 )
  '(org-level-3 :foreground "#cccccc" :weight bold       :height 1.10 )
  '(org-level-4 :foreground "#bbbbbb" :weight bold       :height 1.00 )
  '(org-level-5 :foreground "#aaaaaa" :weight bold       :height 0.90 ))

(lambda () (progn
  (setq left-margin-width 8)
  (setq right-margin-width 8)
  (set-window-buffer nil (current-buffer))))

;; (defun arc/org-mode-visual-fill ()
;;   (setq visual-fill-column-width 250
;;         visual-fill-column-center-text t)
;;   (visual-fill-column-mode 1))

;; Hook in HOOKS FOREVER
;; (prettify-symbols-mode t)
(global-prettify-symbols-mode t)
(global-hl-todo-mode t)

;; BulletPoint: "※","⛬","⬢","‖"
;;(setq org-bullets-bullet-list '("⛬" "⬢" "⬢" "⬢" "⬢" "⬢"))
(setq org-bullets-bullet-list '("⌬" "⬢" "⬢" "⬢" "⬢" "⬢"))
;;(setq org-bullets-bullet-list '("⬢"))

;; Company mode
(defun trigger-org-company-complete ()
  (interactive)
  (if (string-equal "#" (string (preceding-char)))
    (progn
      (insert "+")
      (company-complete))
    (insert "+")))

(defun trigger-org-company-complete () (interactive)
  (if (string-equa(setq org-hide-emphasis-markers t))))

;;(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

(setq deft-directory "~/notebook"
      deft-extensions '("org" "md")
      deft-recursive t)

(add-to-list 'load-path "~/Project/NixOS/doom/misc/")
(autoload 'org-present "org-present" nil t)

(setq hl-todo-keyword-faces
      '(("HOLD"   . "#D3869B")
        ("TITLE"  . "#FABD2F")
        ("TODO"   . "#FABD2F")
        ("LINK"   . "#5E81AC")
        ("NOTE"   . "#B8BB26")
        ("DONE"   . "#808080")
        ("HACK"   . "#FE8019")
        ("FIXME"  . "#FB4934")))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'display-time-mode)
;;(add-hook 'after-init-hook 'exwm-init)

(add-hook 'after-init-hook(lambda ()(setq indent-tabs-mode nil)))
(add-hook 'after-init-hook(lambda ()(setq tab-width 2)))
(add-hook 'after-init-hook(lambda ()(setq evil-shift-width 2)))

(add-hook 'org-mode-hook (lambda () (hl-todo-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (add-hook 'org-mode-hook (lambda () (arc/org-mode-visual-fill)))
(add-hook 'org-mode-hook ;; Prettify Symbols
          (lambda ()
            (push '("#+begin_src" . "λ") prettify-symbols-alist)
            (push '("#+end_src" . "λ") prettify-symbols-alist)))
(add-hook 'org-mode-hook
          '(lambda ()
             (add-hook 'write-contents-functions
                       'delete-trailing-whitespace)))

(add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
(add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(global-hl-todo-mode 1)
(global-hi-lock-mode 1)
;;(perfect-margin-mode 1)

(setq figlet-default-font "Future")

(defun arc/set-wallpaper ()
  (interactive)
  ;; NOTE: You will need to update this to a valid background path!
  (start-process-shell-command
      "feh" nil  "feh --bg-scale ~/Pictures/HD/streets.png"))
(arc/set-wallpaper)
;; Transparency (disable outside emacs)
(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha 85 85))
;;(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
;;(add-to-list 'default-frame-alist '(fullscreen . 'maximized))

(defun arc/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))
(setq exwm-workspace-number 4)
(add-hook 'exwm-update-class-hook #'arc/exwm-update-class)

(require 'exwm-randr)
(exwm-randr-enable)
;; (start-process-shell-command "xrandr" nil "xrandr --output Virtual-1 --primary --mode 2048x1152 --pos 0x0 --rotate normal")

;; Load the system tray before exwm-init
(require 'exwm-systemtray)
(exwm-systemtray-enable)

(map! :leader
      (:prefix-map ("E" . "EXWM")
        :desc "EXWM init" "i" #'exwm-init))

;; These keys should always pass through to Emacs
(setq exwm-input-prefix-keys
  '(?\C-x
    ?\C-u
    ?\C-h
    ?\M-x
    ?\M-`
    ?\M-&
    ?\M-:
    ?\C-\M-j  ;; Buffer list
    ?\C-\ ))  ;; Ctrl+Space

;; Ctrl+Q will enable the next key to be sent directly
(define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

(setq exwm-input-global-keys
      `(
        ([?\s-r] . exwm-reset)

        ;; Move between windows
        ([?\s-h] . windmove-left)
        ([?\s-j] . windmove-down)
        ([?\s-k] . windmove-up)
        ([?\s-l] . windmove-right)

        ([?\s-a] . (lambda () (interactive) (exwm-workspace-switch-create 1)))
        ([?\s-s] . (lambda () (interactive) (exwm-workspace-switch-create 2)))
        ([?\s-d] . (lambda () (interactive) (exwm-workspace-switch-create 3)))
        ([?\s-p] . (lambda () (interactive) (exwm-workspace-switch-create 0)))

        ;; Launch applications via shell command
        ([?\s-o] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))

        ;; Switch workspace
        ([?\s-w] . exwm-workspace-switch)
        ([?\s-`] . (lambda () (interactive) (exwm-workspace-switch-create 0)))

        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                    (interactive)
                    (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))

(exwm-enable)

;;(defun arc/make-tangled-files-executable ()
;;  (set-file-modes (buffer-file-name) #o755))
;;(add-hook 'org-babel-post-tangle-hook 'arc/make-tangled-files-executable)
