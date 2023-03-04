;-------------------
;;; Custom Functions
;--------------------

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun system-is-windows()
  (interactive)
  (string-equal system-type "windows-nt"))

(defun create-directory (dir)
  (unless (file-exists-p dir)
    (make-directory dir)))

; set PATH, when we don't load .bashrc
; function from https://gist.github.com/jakemcc/3887459
(defun set-exec-path-from-shell-PATH ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo -n $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))


;;-----------
;; Systems
;;-----------

;; set PATH, because we don't load .bashrc
(if window-system (set-exec-path-from-shell-PATH))

;; language
(setq current-language-environment "English")
;; Set window title to full file name
(setq frame-title-format '("%b %+%+ %f"))

;; set command key to be meta instead of option
(if (system-is-mac)
    (setq mac-command-modifier 'meta))

;; access remove content via SSH
;; just do "C-x C-f //user@remoteserver:remote-path"
(setq tramp-default-method "ssh")

;; open compressed file automatically
(auto-compression-mode 1)

;; disable backup
(setq backup-inhibited nil)

;; disable auto save
(setq auto-save-default nil)

;; load local env values for emacs terminal
(setq shell-command-switch "-ic")
(setenv "PATH"
  (concat "/usr/texbin" ":"
    (getenv "PATH")))

;;-------
;; Edit
;;-------

;; syntax flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; spelling check
(setq ispell-program-name "aspell")
(dolist
    (hook
     '(text-mode-hook
       rst-mode-hook
       change-log-mode-hook
       log-edit-mode-hook
       TeX-mode-hook
       ))
  (add-hook
   hook (lambda () (flyspell-mode 1))))

;; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode 1)

;; show line and colume number
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")
(column-number-mode 1)

;; highlight lines that go beyond thw columnus limit
;(require 'whitespace)
;(setq whitespace-style '(face empty tabs lines-tail trailing))
;(global-whitespace-mode nil)
;(setq whitespace-line-column 79)

;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

;; text decoration
(require 'font-lock)
(global-font-lock-mode 1)
(global-hi-lock-mode nil)
(setq jit-lock-contextually 1)
(setq jit-lock-stealth-verbose 1)

;; always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; indentation styles
(setq c-basic-offset 4)
(setq c-default-style (quote (
    (c-mode . "bsd")
    (java-mode . "java")
    (awk-mode . "awk")
    (other . "gnu"))))

;; ignore case when searching
(setq-default case-fold-search 1)

;; set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)

;; require final newlines in files when they are saved
(setq require-final-newline nil)

;; add a new line when going to the next line
(setq next-line-add-newlines nil)

;; set default font size
(set-face-attribute 'default nil :height 140)

;;---------
;; Windows
;;---------

;; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode 0)

;; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 40))
  (add-to-list 'default-frame-alist '(width . 88)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; window modifications
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; don't blink the cursor
(blink-cursor-mode 0)

;; don't show the startup screen
(setq inhibit-startup-screen 1)

;; don't show the menu bar
(menu-bar-mode 0)

;; don't show the scroll bar
(if window-system (scroll-bar-mode 0))

;; make sure transient mark mode is enabled (it should be by default,
;; but just in case)
(transient-mark-mode 1)

;; if there is size information associated with text, change the text
;; size to reflect it
(size-indication-mode 1)

;; word wrap at specific column number
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
  '(lambda() (set-fill-column 79)))

;; wrap line respecting words
(global-visual-line-mode nil)

;; each line of text gets one line on the screen (i.e., text will run off
;; the left instead of wrapping around onto a new line)
(setq-default truncate-lines 1)

;; truncate lines even in partial-width windows
(setq truncate-partial-width-windows 0)

(provide 'basic-settings)