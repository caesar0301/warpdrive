;-------------------;
;;; Markdown mode ;;;
;-------------------;

(require 'markdown-mode)
(setq auto-mode-alist
      (append
       (list '("\\.text" . markdown-mode)
	     '("\\.md" . markdown-mode)
	     '("\\.markdown" . markdown-mode)
	     )
       auto-mode-alist))

(provide 'markdown-settings)
