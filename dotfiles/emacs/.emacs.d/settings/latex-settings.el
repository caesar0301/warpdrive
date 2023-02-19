;-----------;
;;; LaTeX ;;;
;-----------;

(require 'auto-complete-auctex)
(load "auctex.el" nil t t)

;; preview side-by-side pane
; (latex-preview-pane-enable)

;; Support Zotero library with zotelo.el
(add-hook 'TeX-mode-hook 'zotelo-minor-mode)

;; math preview
; (autoload 'latex-math-preview-expression "latex-math-preview" nil t)
; (autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
; (autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
; (autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)

; basic configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq-default TeX-master t)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'linum-mode)

; start reftex-mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

; spell checking
(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

; custome LaTex command with -shell-escape option.
; useful for converting eps to pdf
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("LaTeX" "%`%l -shell-escape  %(mode)%' %t"
                  TeX-run-command nil t)))

; always start the server for inverse search
(setq TeX-source-correlate-mode t)
(setq-default TeX-source-correlate-start-server t)

; set preview programs
(setq TeX-view-program-list
      '(("SumatraPDF" "SumatraPDF.exe %o") ; windows
        ("Gsview" "gsview32.exe %o") ; windows
        ("Okular" "okular --unique %o")
        ("Evince" "evince --page-index=%(outpage) %o")
        ("Firefox" "firefox %o")
        ("Skim"
         (concat
          "/Applications/Skim.app/Contents/SharedSupport/displayline"
          " %n %o %b")) ; mac
        ))

; System specific settings
(if (system-is-mac)
    (progn
      (require 'tex-site)
      (require 'font-latex)
      (setq TeX-view-program-selection
            (quote (((output-dvi style-pstricks) "dvips and gv")
                    (output-dvi "xdvi")
                    (output-pdf "Skim")
                    (output-html "xdg-open")))))

  (if (system-is-linux)
      (setq TeX-view-program-selection
            (quote (((output-dvi style-pstricks) "dvips and gv")
                    (output-dvi "xdvi")
                    (output-pdf "Evince")
                    (output-html "xdg-open"))))))

(provide 'latex-settings)
