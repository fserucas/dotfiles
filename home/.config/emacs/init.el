(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(consult orderless vertico markdown-mode magit eglot go-mode treeview evil ## yaml-mode bash-completion)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(use-package zenburn-mode
;;y  :ensure t)
;;(load-theme 'zenburn t)
(set-face-attribute 'default nil
:font "Source Code Pro Medium"
:height 130)
(set-fontset-font t 'latin "Noto Sans")

;;(use-package the-package-name
;;  :ensure t ;; install if needed
;;  :config
;;  (setq the-package-option 'value)
;;  (global-set-key (kbd "C-x g") 'the-package-command))

(use-package vertico
:ensure t )
(use-package orderless
:ensure t )
(use-package which-key
:ensure t )
(use-package consult
:ensure t)
(use-package orderless
:ensure t)
(use-package vertico
:ensure t)
(use-package markdown-mode
:ensure t)
(use-package magit
:config
  ;; Add option to create a GitLab MR
  (transient-append-suffix 'magit-push "-F" '(1 "-m" "Create Merge Request" "--push-option=merge_request.create"))
(global-set-key (kbd "C-x g") 'magit-status)
(magit-auto-revert-mode)
:ensure t)
(use-package eglot
:ensure t)
(use-package go-mode
:ensure t)
(use-package treeview
:ensure t)
(use-package evil
:ensure t)
(use-package yaml-mode
:ensure t)
(use-package bash-completion
:ensure t)
(use-package sudo-edit
:ensure t)
(use-package transpose-frame
:ensure t)


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
(setq backup-directory-alist '(("." . "~/.config/emacs/backups/")))

;; Store custom variables in ~/.emacs.d/custom.el (instead of ~/.emacs)
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Ensure buffer names are unique
(use-package uniquify-files
:ensure t)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Which key C-h shows a tooltip of the available keys
(which-key-mode)

;; Press F7 for terminal
(use-package shell
:ensure t)
(global-set-key (kbd "<f7>") 'shell)

;; Enable indentation and completion using the TAB key.
(setq tab-always-indent 'complete)

;; Make the completion suggest file paths.
(add-hook 'completion-at-point-functions #'cape-file)

(use-package corfu
:ensure t)
(use-package corfu-terminal
:ensure t)
(use-package cape
:ensure t)

;; Activate in buffer completion everywhere.
(global-corfu-mode)

;; enable corfu in terminal.
;; This is needed until child frame support for terminal Emacs arrives.
(unless (display-graphic-p)
(corfu-terminal-mode +1))

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
(global-set-key (kbd "<f8>") 'evil-mode)

;; Add MELPA registry for Magit.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Quick access to Magit.
(global-set-key (kbd "C-x g") 'magit-status)

;; Eglot Format
(global-set-key (kbd "C-x e") 'eglot-format)

;; Comment Uncomment Region
(global-set-key (kbd "<f6>") 'comment-or-uncomment-region )

;; Show the ediff control window inside the current frame, don't create a new window.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Snippet
;; (use-package the-package-name
;;   :ensure t ;; install if needed
;;   :config
;;   (setq the-package-option 'value)
;;   (global-set-key (kbd "C-x g") 'the-package-command))

(column-number-mode)
(dynamic-completion-mode)

;; Line wrap
(global-visual-line-mode t)

(use-package beacon
:ensure t )
;;(package! beacon)
(beacon-mode 1)

;; ;; Advance Things

;; ;; Use Emacs to provide passphrase when opening .gpg files
;; ;; Make sure that `~/.gnupg/gpg-agent.conf` has allow-loopback-pinentry.
;; (setq epa-pinentry-mode 'loopback)

;; ;; Use `g` to refresh the summary. The default key is `M-g`, which is not common.
;; ;;(keymap-set gnus-summary-mode-map "g" 'gnus-summary-rescan-group)

;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ;; Load my local init if present:
;; (require 'init-local nil t)

;; ;; Make dired do something intelligent when two direcotries are shown
;; (setq dired-dwim-trget t)

;; ;; Do not outright delete files.
;; (setq delete-by-moving-to-trash t)

;; ;; Set up multi cursors
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(consult orderless vertico markdown-mode magit eglot go-mode treeview evil ## yaml-mode bash-completion)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; ;;(use-package the-package-name
;; ;;  :ensure t ;; install if needed
;; ;;  :config
;; ;;  (setq the-package-option 'value)
;; ;;  (global-set-key (kbd "C-x g") 'the-package-command))

;; (use-package vertico
;;   :ensure t )
;; (use-package orderless
;;   :ensure t )

;; ;; To load this while using emacs run M-x eval-buffer

;; ;; Setup completion framework
;; (vertico-mode)
;; (setq completion-styles '(orderless basic))
;; (global-set-key (kbd "C-x b") 'consult-buffer)

;; ;; to be able to use the mouse
;; (xterm-mouse-mode)
;; ;; Use shift + arrow keys to change window.
;; (windmove-default-keybindings)

;; ;; to load files when they change
;; (auto-revert-mode)

;; ;; Remember commands and files for easy access.
;; (savehist-mode)
;; (save-place-mode)
;; (recentf-mode)

;; ;; Record window configuration and enable
;; ;; `M-x winner-undo` command to undo layout changes.
;; (winner-mode)

;; ;; Keep auto-save and backup files in one flat directory
;; ;; (instead of next to the original files)
;; (setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;; ;; Store custom variables in ~/.emacs.d/custom.el (instead of ~/.emacs)
;; (setq custom-file (locate-user-emacs-file "custom.el"))

;; ;; Ensure buffer names are unique
;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'forward)

;; ;; Which key C-h shows a tooltip of the available keys
;; (which-key-mode)


;; ;; Press F7 for terminal
;; (global-set-key (kbd "<f7>") 'vterm)

;; ;; Enable indentation and completion using the TAB key.
;; (setq tab-always-indent 'complete)

;; ;; Make the completion suggest file paths.
;; (add-hook 'completion-at-point-functions #'cape-file)

;; ;; Activate in buffer completion everywhere.
;; (global-corfu-mode)

;; ;; enable corfu in terminal.
;; ;; This is needed until child frame support for terminal Emacs arrives.
;; (unless (display-graphic-p) (corfu-terminal-mode +1))

;; ;; For manual corfu, use SPC to add orderless separator.
;; (keymap-set corfu-map "SPC"  'corfu-insert-separator)

;; ;; show completion automatically after a short delay
;; ;;(setq corfu-auto t)

;; ;; This mode changes the definition of a word boundary so that word commands
;; ;; stop at "Gtk" and "Window" in "GtkWindow"
;; (add-hook 'prog-mode-hook 'subword-mode)

;; ;; Activate flymake for every prog-mode buffers.
;; (add-hook 'prog-mode-hook 'flymake-mode)

;; ;; Use F3 to jump to the next error.
;; (global-set-key (kbd "<f3>") 'flymake-goto-next-error)

;; ;; Use F6 to enable evil-mode.
;; (global-set-key (kbd "<f6>") 'evil-mode)

;; ;; Add MELPA registry for Magit.
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; ;; Quick access to Magit.
;; (global-set-key (kbd "C-x g") 'magit-status)

;; ;; Show the ediff control window inside the current frame, don't create a new window.
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ;; Snippet
;; ;; (use-package the-package-name
;; ;;   :ensure t ;; install if needed
;; ;;   :config
;; ;;   (setq the-package-option 'value)
;; ;;   (global-set-key (kbd "C-x g") 'the-package-command))

;; (column-number-mode)

;; (use-package beacon
;;   :ensure t )
;; ;;(package! beacon)
;; (beacon-mode 1)

;; ;; Advance Things

;; ;; Use Emacs to provide passphrase when opening .gpg files
;; ;; Make sure that `~/.gnupg/gpg-agent.conf` has allow-loopback-pinentry.
;; (setq epa-pinentry-mode 'loopback)


;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ;; Load my local init if present:
;; (require 'init-local nil t)

;; ;; Make dired do something intelligent when two direcotries are shown
;; (setq dired-dwim-trget t)

;; ;; Do not outright delete files.
;; (setq delete-by-moving-to-trash t)

;; ;; Set up multi cursors
;; (use-package beacon
;;   :ensure t )
;; (use-package multiple-cursors
;;   :ensure t
;;   :bind
;;   (("C->" . 'mc/mark-next-like-this)
;;    ("C-<" . 'mc/mark-previous-like-this)))

;; ;; Adjust org-mode for GTD
;; (use-package org
;;   :config
;;   ;; Define task sequence, `|` separates the completed statuses.
;;   (setq org-todo-keywords
;;         '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c@/!)")))

;;   ;; Record the task completion date.
;;   (setq org-log-done 'time))

;; ;; Modern Org Style
;; (use-package org-modern
;;   :ensure t
;;   :config
;;   ;; Add styles for NEXT status
;;   (setq org-modern-todo-faces
;;         '(("NEXT" :foreground "purple" :weight bold :background "orange")))
;;   ;; Activate org-modern
;;   (global-org-modern-mode))

;; ;; Allow moving task from anywhere into your projects:
;; (setq org-refile-targets '(("~/org/projects.org" :maxlevel . 1)))

;; ;; Automatically save org files after refile
;; (advice-add 'org-refile :after (lambda (&rest _) (org-save-all-org-buffers)))

;; ;; Setup capture template to write new tasks to ~/org/inbox.org
;; (setq org-capture-templates
;;       '(("t" "todo" entry (file "~/org/inbox.org")
;;          "* TODO %?\n/Entered on/ %U\n")))

;; ;; Press F6 to capture a task
;; (global-set-key (kbd "<f8>") 'org-capture)

;; ;; org-agenda provides the GTD dashboard
;; (use-package org-agenda
;;   :config
;;   ;; The agenda pulls data from the following files:
;;   (setq org-agenda-files '("~/org/projects.org" "~/org/inbox.org"))

;;   ;; The GTD view
;;   (setq-default org-agenda-custom-commands
;;    '(("g" "Get Things Done (GTD)"
;;       ((agenda ""
;;          ((org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
;;           (org-deadline-warning-days 0)))
;;        (todo "NEXT"
;;          ((org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
;;           (org-agenda-prefix-format "  %i %-12:c [%e] ")
;;           (org-agenda-overriding-header "\nTasks\n")))
;;        (tags-todo "inbox"
;;          ((org-agenda-prefix-format "  %?-12t% s")
;;           (org-agenda-overriding-header "\nInbox\n")))
;;        (tags "CLOSED>=\"<today>\""
;;          ((org-agenda-overriding-header "\nCompleted today\n")))))))

;;   ;; Press F4 to get things done!
;;   (global-set-key (kbd "<f4>") (lambda () (interactive) (org-agenda nil "g"))))


;; ;; From: https://stackoverflow.com/a/70131908
;; ;; With auto save disabled
;; (defun org-archive-done-tasks ()
;;   "Archive all tasks marked DONE in the file."
;;   (interactive)
;;   ;; Disable auto save to avoid repeated file write.
;;   (setq org-archive-subtree-save-file-p nil)
;;   ;; unwind-protect is like try/finally
;;   (unwind-protect
;;     ;; process the entry in reverse to avoid changes in positioning
;;     (mapc (lambda(entry)
;;             (goto-char entry)
;;             (org-archive-subtree))
;;           (reverse (org-map-entries (lambda () (point)) "TODO=\"DONE\"" 'file)))
;;     ;; Enable auto save, even if an exception is raised.
;;     (setq org-archive-subtree-save-file-p t))
;;   (org-save-all-org-buffers))


;; ;; Transparent Remote Access, Multiple Protocol
;; (use-package tramp
;;   :ensure t
;;   :custom
;;   ;; Ensure multi-hop stays verbatim, e.g. /ssh:user@host|sudo:host:/path
;;   ;; Without this setting, the bookmark will be reduced to =/ssh:root@host/=, which doesn't work
;;   ;; Q: is this worth reporting/fixing upstream?
;;   (tramp-show-ad-hoc-proxies t))

;; ;; Disable consult preview of remote buffer
;; ;; From: https://github.com/minad/consult/discussions/969#discussioncomment-10871508
;; (defun buffer-remote-p (buf)
;;   "Return t when BUF is remote."
;;   (if-let ((fp (buffer-file-name buf)))
;;       (file-remote-p fp)
;;     nil))
;; (setq consult-preview-excluded-buffers 'buffer-remote-p)


(use-package lsp-mode
:ensure t)
(use-package lsp-ui
:ensure t)
(use-package company
:ensure t)
(use-package flycheck
:ensure t)
(use-package projectile
:ensure t)

;; Setting Dhall LSP Server
;; dhall-mode highlight the syntax and run dhall format on save
;; https://docs.dhall-lang.org/howtos/Text-Editor-Configuration.html
(use-package dhall-mode
:ensure t
:config (setq
    ;; uncomment the next line to disable automatic format
    ;; dhall-format-at-save nil

    ;; comment the next line to use unicode syntax
    dhall-format-argumenjts (\` ("--ascii"))

    ;; header-line is obsoleted by lsp-mode
    dhall-use-header-line nil))

;; lsp-mode provides the lsp client and it configure flymake to explain errors
(use-package lsp-mode
:ensure t
:init (setq lsp-keymap-prefix "C-c l")
:hook ((dhall-mode . lsp))
:commands lsp)

(setenv "LSP_USE_PLISTS" "true")
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

;; lsp-ui shows type annotations on hover
(use-package lsp-ui
:ensure t
:hook ((lsp-mode-hook . lsp-ui-mode)))

;; company-lsp simplifies completion-at-point
;;(use-package completion-at-point
;;  :ensure t
;;  :after company
;;  :init
;;  (push 'completion-at-point company-backends))
(push 'completion-at-point company-backends)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-idle-delay 0.500)
;;(setq  lsp-ui-doc-show-with-mouse nil)

;; Python LSP
(use-package lsp-pyright
:ensure t
:custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
(require 'lsp-pyright)
(lsp))))  ; or lsp-deferred


(use-package yaml-mode
:ensure t)
;;(use-package flymake-yamllint
;;  :ensure t
;;  :config
;;  (add-hook 'yaml-mode-hook 'flymake-yamllint-setup))

;; matching symbol

(global-set-key "%" 'match-paren)

(defun match-paren (arg) "Go to the matching paren if on a paren; otherwise insert %." (interactive "p")
(cond ((looking-at "\\s(")
(forward-list 1)
(backward-char 1))
((looking-at "\\s)")
(forward-char 1)
(backward-list 1))
(t (self-insert-command (or arg 1 )))))

;; Get Environment Variables
(defvar *gemini-api-key* (getenv "GEMINI_API_KEY"))

;; GPTel
;; M-x gptel to run the prompt buffer
;; api-key "api-key"
;; chat gpt token key gpt-token-key
(use-package gptel
:ensure t)
(use-package gptel
:ensure t
:config (setq ;; Granite Dense
        ollama-local-backed (gptel-make-ollama "Ollama Granite Dense"
:host "openwebui.podman.internal:11434"
:stream t
:models '(granite3.1-dense:8b))

	;; Granite Code
        ollama-local-backed (gptel-make-ollama "Ollama Granite Code"
:host "openwebui.podman.internal:11434"
:stream t
:models '(granite-code:20b))
ramalama (gptel-make-openai "Ramalama Gemma3 12b"
:host "openwebui.podman.internal:8081"
:protocol "http"
:stream t
:models '(test))
gemini-red-hat (gptel-make-gemini "Gemini Red Hat"
:key *gemini-api-key*
:stream t)
gptel-backend gemini-red-hat))

;; Gptel auto-complete
;; Install package unless in not installed
(unless
 (package-installed-p 'gptel-autocomplete)
 (package-vc-install
 '(gptel-autocomplete :url "https://github.com/JDNdeveloper/gptel-autocomplete.git")))

(require 'gptel-autocomplete)

;; GPTel gptel-autocomplete key bindings
;; Create prefix command
(define-prefix-command 'gptel-autocomplet-prefix-map)
(global-set-key (kbd "C-q") 'gptel-autocomplet-prefix-map)
;; Bind commands to the prefix
(define-key gptel-autocomplet-prefix-map (kbd "q") 'gptel-complete)
(define-key gptel-autocomplet-prefix-map (kbd "w") 'gptel-accept-completion)
;; Bind example to set in existing prefix
;;(global-set-key (kbd "C-x q") 'gptel-complete)
;;(global-set-key (kbd "C-x w") 'gptel-accept-completion)


;;(use-package gptel
;;  :ensure t
;;  :config
;;  (setq api-key "api-key"
;;	gpt-backend (gptel-make-openai "GPT Github Model"
;;          :host "models.inference.ai.azure.com"
;;          :endpoint "/chat/completions"
;;          :stream t
;;          :key api-key
;;          :models '(gpt-4o))
;;	mistral-backend (gptel-make-openai "Mistral Github Model"
;;          :host "models.inference.ai.azure.com"
;;          :endpoint "/chat/completions"
;;          :stream t
;;          :key api-key
;;          :models '(Ministral-3B))
;;	;; podman run --network=host -d -v ollama:/root/.ollama --name ollama ollama/ollama
;;	;; podman run --network=host -it --rm ollama/ollama pull llama3.3
;;	;; To test the model, run the prompt with
;;	;; podman run --network=host -it --rm ollama/ollama run llama3.3
;;	ollama-local-backed (gptel-make-ollama "Local Ollama 3.2"
;;          :host "localhost:11434"
;;          :stream t
;;          :models '(llama3.2:latest))
;;	;; Use the default backend
;;        gptel-backend gpt-backend
;;        ))

;; (use-package jira
;;   :demand t
;;   :config
;;   (setq jira-username "jira-email") ;; Jira username (usually, an email)
;;   (setq jira-base-url "jira-url") ;; Jira instance URL
;;   ;; API token for JIRA
;;   ;; See https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/
;;   (setq jira-token "jira-token"))

;; Haskell LSP
(use-package eglot
:ensure t
:config (add-hook 'haskell-mode-hook 'eglot-ensure)
:config (setq-default eglot-workspace-configuration '((haskell (plugin (stan (globalOn .
:json-false))))))  ;; disable stan
  :custom (eglot-autoshutdown t)  ;; shutdown language server after closing last file
  (eglot-confirm-server-initiated-edits nil)  ;; allow edits without confirmation
  )

;; ;; Elpaca Lisp Package Manager
;; (defvar elpaca-installer-version 0.11)
;; (defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
;; (defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
;; (defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
;; (defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
;;                               :ref nil :depth 1 :inherit ignore
;;                               :files (:defaults "elpaca-test.el" (:exclude "extensions"))
;;                               :build (:not elpaca--activate-package)))
;; (let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
;;        (build (expand-file-name "elpaca/" elpaca-builds-directory))
;;        (order (cdr elpaca-order))
;;        (default-directory repo))
;;   (add-to-list 'load-path (if (file-exists-p build) build repo))
;;   (unless (file-exists-p repo)
;;     (make-directory repo t)
;;     (when (<= emacs-major-version 28) (require 'subr-x))
;;     (condition-case-unless-debug err
;;         (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
;;                   ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
;;                                                   ,@(when-let* ((depth (plist-get order :depth)))
;;                                                       (list (format "--depth=%d" depth) "--no-single-branch"))
;;                                                   ,(plist-get order :repo) ,repo))))
;;                   ((zerop (call-process "git" nil buffer t "checkout"
;;                                         (or (plist-get order :ref) "--"))))
;;                   (emacs (concat invocation-directory invocation-name))
;;                   ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
;;                                         "--eval" "(byte-recompile-directory \".\" 0 'force)")))
;;                   ((require 'elpaca))
;;                   ((elpaca-generate-autoloads "elpaca" repo)))
;;             (progn (message "%s" (buffer-string)) (kill-buffer buffer))
;;           (error "%s" (with-current-buffer buffer (buffer-string))))
;;       ((error) (warn "%s" err) (delete-directory repo 'recursive))))
;;   (unless (require 'elpaca-autoloads nil t)
;;     (require 'elpaca)
;;     (elpaca-generate-autoloads "elpaca" repo)
;;     (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
;; (add-hook 'after-init-hook #'elpaca-process-queues)
;; (elpaca `(,@elpaca-order))

;; ;; Typst LSP and Highlighter
;; (use-package typst-ts-mode
;;   :ensure t
;;   (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
;;   :custom
;;   (typst-ts-mode-watch-options "--open"))

;; (unless
;;  (package-installed-p 'typst-ts-mode)
;;  (package-vc-install
;;  '(typst-ts-mode :url "https://codeberg.org/meow_king/typst-ts-mode.git" :rev "develop")))

;; (use-package typst-ts-mode
;;   :ensure t
;;   :custom
;;   (typst-ts-watch-options "--open")
;;   (typst-ts-mode-grammar-location (expand-file-name "tree-sitter/libtree-sitter-typst.so" user-emacs-directory))
;;   (typst-ts-mode-enable-raw-blocks-highlight t)
;;   :config
;;   (keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu))

;; File extension mode set for Typst
(require 'typst-ts-mode)
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))

;; Acitivities Session manager
;; https://github.com/alxlphapapa/activities.el
(use-package activities
:ensure t
:init (activities-mode)
(activities-tabs-mode)
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)
:bind (("C-x C-a C-n" . activities-new)
("C-x C-a C-d" . activities-define)
("C-x C-a C-a" . activities-resume)
("C-x C-a C-s" . activities-suspend)
("C-x C-a C-k" . activities-kill)
("C-x C-a RET" . activities-switch)
("C-x C-a b" . activities-switch-buffer)
("C-x C-a g" . activities-revert)
("C-x C-a l" . activities-list)))


;; Aider for emacs - AI Pair Programming Companioun
(use-package aider
:ensure t
:config
  ;; For latest gemini model
  ;; Configuration for aider are on ~/.aider.conf.yml
  ;;(setq aider-args '("--model" "gemini" "--no-auto-accept-architect" )) ;; add --no-auto-commits if you don't want it
  ;;(setenv "GEMINI_API_KEY" anthropic-api-key)
  ;; Or chatgpt model
  ;; (setq aider-args '("--model" "o4-mini"))
  ;; (setenv "OPENAI_API_KEY" <your-openai-api-key>)
  ;; Or use your personal config file
  (setq aider-args `("--config" ,(expand-file-name "~/.aider.conf.yml")))
  ;; ;;
  ;; Optional: Set a key binding for the transient menu
  (global-set-key (kbd "C-c a") 'aider-transient-menu) ;; for wider screen
  ;; or use aider-transient-menu-2cols / aider-transient-menu-1col, for narrow screen
  (aider-magit-setup-transients) ;; add aider magit function to magit menu
  ;; auto revert buffer
  (global-auto-revert-mode 1)
(auto-revert-mode 1))


;; Rust
(use-package rust-mode
:ensure t )

(use-package flycheck-rust
:ensure t )

;; Lisp
(use-package elisp-format
:ensure t)

(use-package elisp-lint
:ensure t)

;; Highlight Columns
(use-package hl-column)
;;(global-hl-column-mode)
