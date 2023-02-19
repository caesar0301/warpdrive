;------------------------;
;;; Python Programming ;;;
;------------------------;

;; -----------------------
;; python.el configuration
;; -----------------------
; from python.el
(require 'python)

;; set indent level
(add-hook 'python-mode-hook '(lambda ()
 (setq python-indent 4)))

; jedi python completion
(require 'jedi)
(setq jedi:setup-keys t)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)

;; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string
                          "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))
(if window-system (set-python-path-from-shell-PYTHONPATH))
(setq auto-mode-alist
      (append
       (list '("\\.pyx" . python-mode))
       auto-mode-alist))

; keybindings
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c !") 'python-shell-switch-to-shell))
(eval-after-load 'python
  '(define-key python-mode-map (kbd "C-c |") 'python-shell-send-region))

;; -------------------------
;; IPython/notebook config
;; -------------------------

; set ipython env.
;;(setq
;; python-shell-interpreter "ipython"
;; python-shell-interpreter-args (if (system-is-mac)
;;                                   "--gui=osx --matplotlib=osx --colors=Linux"
;;                                 (if (system-is-linux)
;;                                     "--gui=wx --matplotlib=wx --colors=Linux"))
;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;; python-shell-completion-setup-code
;;   "from IPython.core.completerlib import module_completion"
;; python-shell-completion-module-string-code
;;   "';'.join(module_completion('''%s'''))\n"
;; python-shell-completion-string-code
;;   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

; use autocompletion, but don't start to autocomplete after a dot
;;(setq ein:complete-on-dot -1)
;;(setq ein:use-auto-complete 1)

; set python console args
;;(setq ein:console-args
;;      (if (system-is-mac)
;;          '("--gui=osx" "--matplotlib=osx" "--colors=Linux")
;;        (if (system-is-linux)
;;           '("--gui=wx" "--matplotlib=wx" "--colors=Linux"))))

; timeout settings
;;(setq ein:query-timeout 1000)

; IPython notebook
;;(include-elget-plugin "emacs-ipython-notebook/lisp")
;;(require 'ein)

; shortcut function to load notebooklist
;;(defun load-ein ()
;;  (ein:notebooklist-load)
;;  (interactive)
;;  (ein:notebooklist-open))

(provide 'python-settings)
