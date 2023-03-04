;;------------------
;;  Configure MELPA
;;------------------

;; Install
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Configure use-package
(if (not (package-installed-p 'use-package))
  (progn
    (when (not package-archive-contents)
      (package-refresh-contents))
    (package-install 'use-package)))
(require 'use-package)

;; Install packages

;;; autocomple
(package-install 'auto-complete)
(package-install 'yasnippet)

;;; java
(package-install 'java-snippets)

;;; emacs-lisp
(package-install 'el-autoyas)

;;; web development
;; (package-install 'multi-web-mode)
;; (package-install 'php-auto-yasnippets)
;; (package-install 'angular-snippets)
;; (package-install 'django-snippets)

;;; SCSS
(package-install 'scss-mode)

;;; rlang
(package-install 'ess)
(package-install 'r-autoyas)

;;; matlab
(package-install 'matlab-mode)

;;; markdown
(package-install 'markdown-mode)

;;; yaml
(package-install 'yaml-mode)

;;; latex
(package-install 'auctex)
(package-install 'auto-complete-auctex)
;; (package-install 'latex-preview-pane)
;; (package-install 'latex-math-preview)

;;; pig
;; (package-install 'pig-snippets)
;; (package-install 'pig-mode)

;;; python
(package-install 'jedi)

;;; lisp
(package-install 'slime)

;;; neotree
(package-install 'neotree)

;;; themes
(package-install 'solarized-theme)

;; misc utilities
(package-install 'flycheck)
(package-install 'helm)
(package-install 'helm-descbinds)
(package-install 'zotelo)

(provide 'melpa-settings)
