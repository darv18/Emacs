;;Configuración de MELPA danRV18
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (light-blue)))
 '(global-linum-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (company-jedi ipython-shell-send jedi use-package format-all elpygen python company )))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Habilitar Elpy
;;(elpy-enable)

;;USE-PACKAGE
(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

;;(require 'powerline)
;;(powerline-default-theme)

;;Modo jedi
(use-package company-jedi
  :ensure t)
(add-hook 'python-mode-hook
          (lambda ()
            (company-mode 1)))


;; reloj con formato 24 horas
;; Mostrar fecha y hora
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; Añadir automáticamente paréntesis, llave y comillas
;; de cierre al insertar la de apertura.
;(setq skeleton-pair t)
;(global-set-key “[” ‘skeleton-pair-insert-maybe)
;(global-set-key “(” ‘skeleton-pair-insert-maybe)
;(global-set-key “ { ” ‘skeleton-pair-insert-maybe)
;(global-set-key “‘” ‘skeleton-pair-insert-maybe)

;;Hace que Emacs sepa que existe python2 y python3
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))

;;Auto-complete
(global-auto-complete-mode t)
