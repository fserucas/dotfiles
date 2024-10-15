(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult orderless vertico markdown-mode magit eglot go-mode treeview evil ## yaml-mode bash-completion)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; To load this while using emacs run M-x eval-buffer

;; Setup completion framework
(vertico-mode)
(setq completion-styles '(orderless basic))
(global-set-key (kbd "C-x b") 'consult-buffer)

;; to be able to use the mouse
(xterm-mouse-mode)
;; Use shift + arrow keys to change window.
(windmove-default-keybindings)

;; to load files when they change
(auto-revert-mode)

;; Remember commands and files for easy access.
(savehist-mode)
(save-place-mode)
(recentf-mode)

;; Record window configuration and enable
;; `M-x winner-undo` command to undo layout changes.
(winner-mode)

;; Keep auto-save and backup files in one flat directory
;; (instead of next to the original files)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;; Store custom variables in ~/.emacs.d/custom.el (instead of ~/.emacs)
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Ensure buffer names are unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Which key C-h shows a tooltip of the available keys
(which-key-mode)

;; Press F7 for terminal
(global-set-key (kbd "<f7>") 'vterm)

;; Enable indentation and completion using the TAB key.
(setq tab-always-indent 'complete)

;; Make the completion suggest file paths.
(add-hook 'completion-at-point-functions #'cape-file)

;; Activate in buffer completion everywhere.
(global-corfu-mode)

;; enable corfu in terminal.
;; This is needed until child frame support for terminal Emacs arrives.
(unless (display-graphic-p) (corfu-terminal-mode +1))

;; For manual corfu, use SPC to add orderless separator.
(keymap-set corfu-map "SPC"  'corfu-insert-separator)

;; show completion automatically after a short delay
;;(setq corfu-auto t)

;; This mode changes the definition of a word boundary so that word commands
;; stop at "Gtk" and "Window" in "GtkWindow"
(add-hook 'prog-mode-hook 'subword-mode)

;; Activate flymake for every prog-mode buffers.
(add-hook 'prog-mode-hook 'flymake-mode)

;; Use F3 to jump to the next error.
(global-set-key (kbd "<f3>") 'flymake-goto-next-error)

;; Use F6 to enable evil-mode.
(global-set-key (kbd "<f6>") 'evil-mode)

;; Add MELPA registry for Magit.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Quick access to Magit.
(global-set-key (kbd "C-x g") 'magit-status)

;; Show the ediff control window inside the current frame, don't create a new window.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Snippet 
;; (use-package the-package-name
;;   :ensure t ;; install if needed
;;   :config
;;   (setq the-package-option 'value)
;;   (global-set-key (kbd "C-x g") 'the-package-command))

(column-number-mode)
