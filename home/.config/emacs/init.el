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

(use-package beacon
  :ensure t )
;;(package! beacon)
(beacon-mode 1)

;; Advance Things

;; Use Emacs to provide passphrase when opening .gpg files
;; Make sure that `~/.gnupg/gpg-agent.conf` has allow-loopback-pinentry.
(setq epa-pinentry-mode 'loopback)


;; Setup my identity
(setq user-full-name "Francisco Seruca Salgado")
(setq user-mail-address "francisco.p.p.s.salgado@gmail.com")

;; Use external sendmail program to send mail.
(setq send-mail-function 'sendmail-send-it)

;; Ensure msmtp is used, just in case it is not symlinked as "sendmail".
(setq sendmail-program "msmtp")

;; Wait for sendmail completion and display any errors.
(setq mail-interactive t)

;; Pass the From header to msmtp to enable multiple sender configs.
(setq message-sendmail-envelope-from 'header)

;; Use Gnus with my IMAP server.
(setq gnus-select-method '(nnimap "smtp.gmail.com"))

;; Cite reply author with a date.
(setq message-citation-line-format "On %a, %b %d, %Y at %H:%M %N wrote:")
(setq message-citation-line-function 'message-insert-formatted-citation-line)

;; Start message above the quote.
(setq message-cite-reply-position 'above)

;; Keep my reply in the associated thread, as expected with email discussion.
;; This is not necessary for regular newsgroups because the usernet server does it automatically.
;; But since I'm using Gnus with IMAP, here is the necessary setting:
(setq gnus-parameters '((".*" (gcc-self . t))))
(setq gnus-gcc-mark-as-read t)

;; Keep Gnus in it's own window.
(setq gnus-use-full-window nil)

;; Use `g` to refresh the summary. The default key is `M-g`, which is not common.
;;(keymap-set gnus-summary-mode-map "g" 'gnus-summary-rescan-group)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load my local init if present:
(require 'init-local nil t)

;; Make dired do something intelligent when two direcotries are shown
(setq dired-dwim-trget t)

;; Do not outright delete files.
(setq delete-by-moving-to-trash t)

;; Set up multi cursors 
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

;;(use-package the-package-name
;;  :ensure t ;; install if needed
;;  :config
;;  (setq the-package-option 'value)
;;  (global-set-key (kbd "C-x g") 'the-package-command))

(use-package vertico
  :ensure t )
(use-package orderless
  :ensure t )

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

(use-package beacon
  :ensure t )
;;(package! beacon)
(beacon-mode 1)

;; Advance Things

;; Use Emacs to provide passphrase when opening .gpg files
;; Make sure that `~/.gnupg/gpg-agent.conf` has allow-loopback-pinentry.
(setq epa-pinentry-mode 'loopback)


;; Setup my identity
(setq user-full-name "Francisco Seruca Salgado")
(setq user-mail-address "francisco.p.p.s.salgado@gmail.com")

;; Use external sendmail program to send mail.
(setq send-mail-function 'sendmail-send-it)

;; Ensure msmtp is used, just in case it is not symlinked as "sendmail".
(setq sendmail-program "msmtp")

;; Wait for sendmail completion and display any errors.
(setq mail-interactive t)

;; Pass the From header to msmtp to enable multiple sender configs.
(setq message-sendmail-envelope-from 'header)

;; Use Gnus with my IMAP server.
(setq gnus-select-method '(nnimap "smtp.gmail.com"))

;; Cite reply author with a date.
(setq message-citation-line-format "On %a, %b %d, %Y at %H:%M %N wrote:")
(setq message-citation-line-function 'message-insert-formatted-citation-line)

;; Start message above the quote.
(setq message-cite-reply-position 'above)

;; Keep my reply in the associated thread, as expected with email discussion.
;; This is not necessary for regular newsgroups because the usernet server does it automatically.
;; But since I'm using Gnus with IMAP, here is the necessary setting:
(setq gnus-parameters '((".*" (gcc-self . t))))
(setq gnus-gcc-mark-as-read t)

;; Keep Gnus in it's own window.
(setq gnus-use-full-window nil)

;; Use `g` to refresh the summary. The default key is `M-g`, which is not common.
;;(keymap-set gnus-summary-mode-map "g" 'gnus-summary-rescan-group)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load my local init if present:
(require 'init-local nil t)

;; Make dired do something intelligent when two direcotries are shown
(setq dired-dwim-trget t)

;; Do not outright delete files.
(setq delete-by-moving-to-trash t)

;; Set up multi cursors
(use-package beacon
  :ensure t )
(use-package multiple-cursors
  :ensure t
  :bind
  (("C->" . 'mc/mark-next-like-this)
   ("C-<" . 'mc/mark-previous-like-this)))

;; Adjust org-mode for GTD
(use-package org
  :config
  ;; Define task sequence, `|` separates the completed statuses.
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELLED(c@/!)")))

  ;; Record the task completion date.
  (setq org-log-done 'time))

;; Modern Org Style
(use-package org-modern
  :ensure t
  :config
  ;; Add styles for NEXT status
  (setq org-modern-todo-faces
        '(("NEXT" :foreground "purple" :weight bold :background "orange")))
  ;; Activate org-modern
  (global-org-modern-mode))

;; Allow moving task from anywhere into your projects:
(setq org-refile-targets '(("~/org/projects.org" :maxlevel . 1)))

;; Automatically save org files after refile
(advice-add 'org-refile :after (lambda (&rest _) (org-save-all-org-buffers)))

;; Setup capture template to write new tasks to ~/org/inbox.org
(setq org-capture-templates
      '(("t" "todo" entry (file "~/org/inbox.org")
         "* TODO %?\n/Entered on/ %U\n")))

;; Press F6 to capture a task
(global-set-key (kbd "<f8>") 'org-capture)

;; org-agenda provides the GTD dashboard
(use-package org-agenda
  :config
  ;; The agenda pulls data from the following files:
  (setq org-agenda-files '("~/org/projects.org" "~/org/inbox.org"))

  ;; The GTD view
  (setq-default org-agenda-custom-commands
   '(("g" "Get Things Done (GTD)"
      ((agenda ""
         ((org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
          (org-deadline-warning-days 0)))
       (todo "NEXT"
         ((org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
          (org-agenda-prefix-format "  %i %-12:c [%e] ")
          (org-agenda-overriding-header "\nTasks\n")))
       (tags-todo "inbox"
         ((org-agenda-prefix-format "  %?-12t% s")
          (org-agenda-overriding-header "\nInbox\n")))
       (tags "CLOSED>=\"<today>\""
         ((org-agenda-overriding-header "\nCompleted today\n")))))))

  ;; Press F4 to get things done!
  (global-set-key (kbd "<f4>") (lambda () (interactive) (org-agenda nil "g"))))


;; From: https://stackoverflow.com/a/70131908
;; With auto save disabled
(defun org-archive-done-tasks ()
  "Archive all tasks marked DONE in the file."
  (interactive)
  ;; Disable auto save to avoid repeated file write.
  (setq org-archive-subtree-save-file-p nil)
  ;; unwind-protect is like try/finally
  (unwind-protect
    ;; process the entry in reverse to avoid changes in positioning
    (mapc (lambda(entry)
            (goto-char entry)
            (org-archive-subtree))
          (reverse (org-map-entries (lambda () (point)) "TODO=\"DONE\"" 'file)))
    ;; Enable auto save, even if an exception is raised.
    (setq org-archive-subtree-save-file-p t))
  (org-save-all-org-buffers))


;; Transparent Remote Access, Multiple Protocol
(use-package tramp
  :ensure t
  :custom
  ;; Ensure multi-hop stays verbatim, e.g. /ssh:user@host|sudo:host:/path
  ;; Without this setting, the bookmark will be reduced to =/ssh:root@host/=, which doesn't work
  ;; Q: is this worth reporting/fixing upstream?
  (tramp-show-ad-hoc-proxies t))

;; Disable consult preview of remote buffer
;; From: https://github.com/minad/consult/discussions/969#discussioncomment-10871508
(defun buffer-remote-p (buf)
  "Return t when BUF is remote."
  (if-let ((fp (buffer-file-name buf)))
      (file-remote-p fp)
    nil))
(setq consult-preview-excluded-buffers 'buffer-remote-p)

