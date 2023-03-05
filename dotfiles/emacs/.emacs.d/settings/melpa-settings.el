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

;;; themes
(package-install 'solarized-theme)
(package-install 'darcula-theme)

;;; autocomple
(when enable-auto-complete
  (package-install 'auto-complete)
  (package-install 'flycheck)
  (package-install 'helm)
  (package-install 'helm-descbinds))

;;; yasnippet
(when enable-yasnippet
  (package-install 'yasnippet))

;;; java
(when enable-java
  (package-install 'java-snippets))

;;; emacs-lisp
(when enable-yasnippet
  (package-install 'el-autoyas))

;;; web development
(when enable-web-dev 
  (package-install 'ulti-web-mode)
  (package-install 'angular-snippets)
  (package-install 'django-snippets)
  (when enable-yasnippet
    (package-install 'php-auto-yasnippets)))

;;; SCSS
(when enable-scss
  (package-install 'scss-mode))

;;; rlang
(when enable-rstat
  (package-install 'ess)
  (package-install 'r-autoyas))

;;; matlab
(when enable-matlab
  (package-install 'matlab-mode))

;;; markdown
(when enable-markdown
  (package-install 'markdown-mode))

;;; yaml
(when enable-yaml
  (package-install 'yaml-mode))

;;; latex
(when enable-latex
  (package-install 'auctex)
  (package-install 'auto-complete-auctex)
  (package-install 'latex-preview-pane)
  (package-install 'latex-math-preview))

;;; pig
(when enable-pig
  (package-install 'pig-mode)
  (package-install 'pig-snippets))

;;; python
(when enable-python
  (package-install 'jedi))

;;; lisp
(when enable-lisp
  (package-install 'slime)
  (package-install 'lispy))

;;; projectile and neotree
(when enable-ide
  (package-install 'projectile)
  (package-install 'neotree))

;;; zotero
(when enable-zotero
  (package-install 'zotelo))

(provide 'melpa-settings)