;-------------------;
;;; Auto-Complete ;;;
;-------------------;

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)

;; hack to fix ac-sources after pycomplete.el breaks it
(add-hook 'python-mode-hook
    '(lambda ()
        (setq ac-sources '(ac-source-pycomplete
            ac-source-abbrev
            ac-source-dictionary
            ac-source-words-in-same-mode-buffers))))

;;*********enable skeleton-pair insert globally***************
; (setq skeleton-pair t)
; (setq skeleton-pair-on-word t)
; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
; (global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
; (global-set-key (kbd "\`") 'skeleton-pair-insert-maybe)
; (global-set-key (kbd "<") 'skeleton-pair-insert-maybe)

(provide 'auto-complete-settings)