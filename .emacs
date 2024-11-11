;;;;;;;;;;;;;;;;;;
;; Package init ;;
;;;;;;;;;;;;;;;;;;

; Taken from http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; Install required packages packages automaticaly
(setq package-list '(package
                     auto-complete
                     yasnippet
                     php-mode
                     cc-mode
                     web-mode
                     typescript-mode
                     scss-mode
                     coffee-mode
                     git-modes))

; list the repositories containing
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; Require packages
(dolist (pkg package-list)
  (require pkg))

; Git submodules (which are not in Melpa etc. packages)
(load-file "~/.emacs.d/auto-complete-plus/auto-complete+.el")
(load-file "~/.emacs.d/emacs-prisma-mode/prisma-mode.el")


;;;;;;;;;;;;;
;; General ;;
;;;;;;;;;;;;;

; Start in fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

; Prevent menubar
(menu-bar-mode -1)

; Prevent startup screen
(setq inhibit-startup-screen t)

; Load theme
(load-theme 'misterioso t)

; Set font size
(set-face-attribute 'default nil :height 150)

(xterm-mouse-mode 1)
(ac-config-default)
(yas-global-mode 1)

; turn on Semantic
(semantic-mode 1)

; Tab settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default nxml-child-indent 4)
(setq web-mode-code-indent-offset 4)

; For changing tab settings in buffer
(defun my-set-indents (n)
  (interactive "p")
  (setq n (if n (prefix-numeric-value n) 2))
  (setq-default tab-width n)
  (setq-default nxml-child-indent n)
  (setq web-mode-code-indent-offset n)
)

; Keybindings to easily resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

; Wind move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; Backup folder
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

; Auto refresh buffers when files are changed on disk
(global-auto-revert-mode t)

; font sizing with Ctrl key and mouse scroll
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)


;;;;;;;;;;;
;; C/C++ ;;
;;;;;;;;;;;

(setq c-basic-offset 4)
(c-set-offset 'access-label '/)


;;;;;;;;;;;;;;;;;;;;;
;; Web Development ;;
;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
