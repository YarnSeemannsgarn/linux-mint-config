;;; Emacs-config --- Finally make use of lsp
;;; Commentary:
;;; Code:

;; Package setup
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Syntax Highlighting for TypeScript
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((typescript-mode . lsp-deferred)
         (ruby-mode . lsp-deferred)
         (sh-mode . lsp-deferred))
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-enable-snippet t
        lsp-completion-enable t)


  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  :hook
  (setq lsp-ui-doc-enable t
        lsp-ui-sideline-enable t
        lsp-ui-imenu-enable t
        lsp-ui-peek-enable t))

;; Auto-completion
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; Linting
(use-package flycheck
  :init ())

(use-package flycheck-pos-tip
  :init ())


;; Tree View for Project Files
(use-package treemacs
  :bind
  ("C-x t t" . treemacs))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-symbols)

;; JSON mode
(use-package json-mode
  :ensure t
  :config
  (setq json-mode-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode)))

;; Code Formatting with Prettier
(use-package prettier-js
  :ensure t
  :hook (typescript-mode . prettier-js-mode)
  :commands (prettier-js))
(add-hook 'before-save-hook 'prettier-js nil t)

(use-package prisma-mode
  :load-path "~/.emacs.d/emacs-prisma-mode/")

(use-package simple
  :ensure nil
  :bind
  (([mouse-8] . pop-global-mark)        ;; Go to the previous position
   ([mouse-9] . jump-to-register)))    ;; Go to the next position

;; Activate global mark saving to track cursor positions
(setq set-mark-command-repeat-pop t)


;(use-package projectile
;  :ensure t
;  :config
;  (projectile-mode +1)
;  (setq projectile-completion-system 'default)
;  :bind-keymap
;  ("C-c p" . projectile-command-map))
;
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))
;
;;; Ivy Integration for LSP
;(use-package lsp-ivy
;  :ensure t
;  :after (lsp-mode ivy))


;;;;;;;;;;;;;
;; General ;;
;;;;;;;;;;;;;

(add-to-list 'default-frame-alist '(fullscreen . maximized))

; Prevent menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

; Prevent startup screen
(setq inhibit-startup-screen t)

(use-package jetbrains-darcula-theme
  :config
  (load-theme 'jetbrains-darcula t))

; Set font size
(set-face-attribute 'default nil :height 130)

(xterm-mouse-mode 1)

; Keybindings to ily resize windows
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

(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)

(electric-pair-mode 1)

(provide '.emacs)
;;; .emacs ends here

