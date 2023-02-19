;; R mode with ESS mode configuration
(require 'ess-site)
(require 'ess-eldoc)

;;ESS will not print the evaluated commands, also speeds
;;up the evaluation
(setq ess-eval-visibly-p nil)
;;not prompted each time starting an interactive R session
(setq ess-ask-for-ess-directory nil)

;;show matching parentheses
(show-paren-mode 1)

;; set indentation with old two whitespaces
(setq ess-default-style 'DEFAULT)

;; R style
;;; ESS
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++ 'quiet)
            ;; Because
            ;;                                 DEF GNU BSD K&R C++
            ;; ess-indent-level                  2   2   8   5   4
            ;; ess-continued-statement-offset    2   2   8   5   4
            ;; ess-brace-offset                  0   0  -8  -5  -4
            ;; ess-arg-function-offset           2   4   0   0   0
            ;; ess-expression-offset             4   2   8   5   4
            ;; ess-else-offset                   0   0   0   0   0
            ;; ess-close-brace-offset            0   0   0   0   0
            (add-hook 'local-write-file-hooks
                      (lambda ()
                        (ess-nuke-trailing-whitespace)))))

;; (setq ess-nuke-trailing-whitespace-p 'ask)
;; or even
;; (setq ess-nuke-trailing-whitespace-p t)

(provide 'r-settings)
