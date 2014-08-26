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

;; Tab size 2
(setq tab-width 2)

;; Backup folder
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(global-rinari-mode)

;; Rinari recommends
;;(require 'ido) 
;;(ido-mode t)

;; Nxhtml
(load "~/.emacs.d/nxhtml/autostart.el")

;; Workaround the annoying warnings:
;; Warning (mumamo-per-buffer-local-vars):
;; Already 'permanent-local t: buffer-file-name
(when (and (>= emacs-major-version 24)
	   (>= emacs-minor-version 2))
  (eval-after-load "mumamo"
    '(setq mumamo-per-buffer-local-vars
	   (delq 'buffer-file-name mumamo-per-buffer-local-vars))))

;; Scss-mode (https://github.com/antonj/scss-mode/)
(setq exec-path (cons (expand-file-name "~/.rbenv/shims/scss
") exec-path))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; Keybindings to easily resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Wind move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
