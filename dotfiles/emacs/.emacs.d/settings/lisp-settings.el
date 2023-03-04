;;---------------;
;;; lisp mode  ;;;
;;---------------;

;;-------
;; slime
;;-------
(require 'slime)
(setq inferior-lisp-program "clasp")

;; Multiple lisps
(setq slime-lisp-implementations
      '((clasp ("clasp"))
        (cmucl ("cmucl" "-quiet"))
        (sbcl ("sbcl") :coding-system utf-8-unix)))

;; keymaps
(add-hook 'slime-load-hook
          (lambda ()
            (define-key slime-prefix-map (kbd "M-h") 'slime-documentation-lookup)))

;;-------
;; lispy
;;-------
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(provide 'lisp-settings)
