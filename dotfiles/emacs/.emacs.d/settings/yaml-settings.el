;---------------;
;;; yaml mode ;;;
;---------------;

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; binding RET to `newline-and-indent'
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
(put 'upcase-region 'disabled nil)

(provide 'yaml-settings)
