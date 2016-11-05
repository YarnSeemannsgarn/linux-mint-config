(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t))
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
(setq package-list '(package auto-complete yasnippet auto-complete-c-headers php-mode))

; list the repositories containing them
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
      
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
(require 'auto-complete-c-headers)
(require 'php-mode)
(require 'cc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* General  ********* ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start in fullscreen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(xterm-mouse-mode 1)
(ac-config-default)
(yas-global-mode 1)

; turn on Semantic
(semantic-mode 1)

;; Tab settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

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

; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
  (setq c-basic-offset 4)
  (c-set-offset 'access-label '/)
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ********* Web Development ********* ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Scss-mode (https://github.com/antonj/scss-mode/)
;(require 'scss-mode)

;; Coffee-mode (https://github.com/defunkt/coffee-mode)
;(require 'coffee-mode)
