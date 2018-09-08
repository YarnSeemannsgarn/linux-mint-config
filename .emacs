(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* Own customizations ********* ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* Package init **** ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Taken from http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; Install required packages packages automaticaly
(setq package-list '(package auto-complete yasnippet php-mode cc-mode web-mode ))

; list the repositories containing them
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
      
; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'package)
(require 'auto-complete)
(require 'yasnippet)
(require 'php-mode)
(require 'cc-mode)
(require 'web-mode)

;; Not in any directory
(load-file "~/.emacs.d/auto-complete-plus/auto-complete+.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* General  ********* ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start in fullscreen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(xterm-mouse-mode 1)
(ac-config-default)
(yas-global-mode 1)

; turn on Semantic
(semantic-mode 1)

;; Tab settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default nxml-child-indent 4)
(setq web-mode-code-indent-offset 4)

;; For changing tab settings in buffer
(defun my-set-indents (n)
  (interactive "p")
  (setq n (if n (prefix-numeric-value n) 2))
  (setq-default tab-width n)
  (setq-default nxml-child-indent n)
  (setq web-mode-code-indent-offset n)
  )

;; Keybindings to easily resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Wind move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Backup folder
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* C/C++ ********* ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq c-basic-offset 4)
(c-set-offset 'access-label '/)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* Web Development ********* ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; Scss-mode (https://github.com/antonj/scss-mode/)
;(require 'scss-mode)

;; Coffee-mode (https://github.com/defunkt/coffee-mode)
;(require 'coffee-mode)
