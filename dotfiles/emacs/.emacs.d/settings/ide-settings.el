(require 'projectile)
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(provide 'ide-settings)