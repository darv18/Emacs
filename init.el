
;;;;;;;;;;;;;;;;;;;Paquetes;;;;;;;;;;;;;;;;;;;;;;;;

;;Configuración de MELPA danRV18
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;USE-PACKAGE
;;(unless (featurep 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package)
;;  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bubbles-colors (quote ("orange" "violet")))
 '(bubbles-graphics-theme (quote balls))
 '(bubbles-grid-size (quote (20 . 15)))
 '(custom-enabled-themes (quote (light-blue)))
 '(global-linum-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (scratch symon mwe-log-commands autopair ido-vertical-mode company-jedi ipython-shell-send jedi use-package format-all elpygen python company)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;Desarrollo;;;;;;;;;;;

;;Habilitar Elpy
;;(elpy-enable)

;;python
;;(add-hook 'python-mode-hook
;;          (lambda ()
;;            (setq python-indent-offset 1)))
(defun configure-python-mode
  (setq python-indent-offset 2))

(add-hook 'python-mode-hook 'configure-python-mode)

;;Hace que Emacs sepa que existe python2 y python3
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))

;;Definir lenguajes que entiende babel
(org-babel-do-load-languages'org-babel-do-load-languages
 '((dot . t)
   (emacs-lisp . t)
   (latex . t)
   (python . t)
   (shell . t)
   (php . t)))

;;;;;;;;;;;;;;;;;;;;org-mode;;;;;;;;;;;;;;;;;;;;;

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))
;;;;;;;;;;;;;;;;;;;;;;agenda;;;;;;;;;;;;;;;;;;;;;;;

 (global-set-key (kbd "C-c a") 'org-agenda)
 (setq org-agenda-show-log t
       org-agenda-todo-ignore-scheduled t
       org-agenda-todo-ignore-deadlines t)
 (setq org-agenda-files (list "~/Dropbox/org/agenda.org"))

;;Información del dueño
(setq user-full-name "Daniel Rodriguez")
(setq user-mail-address "<correo>@gmail.com")

;;;;;;;;;;;;;Personalización;;;;;;;;;;;;;

;;Simple monitor de sistema en el miniBuffer
(symon-mode t)

;;Seguridad de las conexiones
(setq network-security-level 'high)

;; reloj con formato 24 horas
;; Mostrar fecha y hora
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;;Mostrar horas en lugar de días
;(setq org-duration-format 'h:mm)

;;Mostrar Bateria
(display-battery-mode 1)

;;fullscreen
(toggle-frame-fullscreen)

;;tema para la barra inferior
;;(require 'powerline)
;;(powerline-default-theme)

;;Modo jedi
(use-package company-jedi
  :ensure t)
(add-hook 'python-mode-hook
          (lambda ()
            (company-mode 1)))

;;Remplazar "yes" y "no" por "y" y "n"
(fset 'yes-or-no-p'y-or-n-p)

;;Para que ido sea vertical
(ido-vertical-mode t)

;;Mensaje en el Buffer
;;scratch
(setq initial-scratch-message "Este es un mensaje de prueba")

;;Modificación en el buffer de inicio
;;No se muestra la ventana principal
(setq inhibit-splash-screen nil)

;;Guardar la sesión al cerrar Emacs y
;;restaurarla
;;(desktop-save-mode 1)

;;The Lazy Installer
;;(custom-set-variables
;; '(inhibit-startup-screen t)
;; )

;;;;;;;;;;;;;;;;;Syntaxis;;;;;;;;;;;;;;

;;Diccionario
(setq ispell-dictionary "español")

;;Auto Identación
(setq global-auto-complete-mode t)

;;Auto-complete y Company
;;(global-auto-complete-mode t)
(global-company-mode t)

;;Modo para cerrar paréntesis automáticamente
(autopair-global-mode t)

;;Iluminar parentesis y llaves
(show-paren-mode t)

;;Emparejar parectesis y llaves
;(electric-pair-mode 1)

;;Flycheck-Mode Chequeo de syntaxis
(global-flycheck-mode 1)

;;Eliminar espacios en blanco al final de la línea
;automaticamnete al guardar el archivo
(add-hook 'before-save-hook'delete-trailing-whitespace)
(add-hook 'write-file-hooks'delete-trailing-whitespace nil t)

;;Es un sistema de plantillas para Emacs. Provee templates de distintos
;;lenguajes para que podamos expandir un modelo de función por ejemplo
;;a partir de una abreviación.
(yas-global-mode 1)

;;;;;;;;;;;;;;;Funciones de Teclas;;;;;;;;;;;;;;;;;
;;fullscreen
;;(global-set-key(kbd"C-c w")'toggle-frame-fullscreen)

;;Comentar varias líneas de Código
(global-set-key(kbd"C-c c")'comment-region)

;;Descomentar Varias líneas de Código
(global-set-key(kbd"C-c d")'uncomment-region)

;;Ir a una linea en especifico
(global-set-key(kbd"C-c i")'goto-line)

;;Aumenta/Disminuye la fuente C-- y C-+
(global-set-key(kbd"C--")'text-scale-decrease)
(global-set-key(kbd"C-+")'text-scale-increase)

;;Auto Identación
(global-set-key(kbd"RET")'newline-and-indent)

;;Mostrar/Esconder los números de líneas <F5>
(global-set-key(kbd"<f5>")'global-linum-mode)

;;Abrir Blog de notas <F6>
(global-set-key(kbd"<f6>")'remember)

;;Entrar a la terminal ansi-terminal <F7>
(global-set-key(kbd"<f7>")'(lambda()(interactive)(ansi-term "/bin/bash")))

;;;;;;;;;;;;;;;;;Acceso Rapido a Directorios;;;;;;;;;;;;;;;;;

;;Lanzar ~/.emacs/init.el "C-c 1"
(global-set-key(kbd"C-c 1")(lambda()(interactive)(find-file"~/.emacs.d/init.el")))

;;Lanzar directorio de estructuras
(global-set-key(kbd"C-c 2")(lambda()(interactive)(find-file"~/Documentos/Estructuras")))

;;Lanzar directorio de Python
(global-set-key(kbd"C-c 3")(lambda()(interactive)(find-file"~/Documentos/Python")))

;;Lanzara directorio de Scripts
(global-set-key(kbd"C-c 4")(lambda()(interactive)(find-file"~/Documentos/Scripts")))

;;;;;;;;;;;;;;;;;;;;;;;Movimiento entre ventanas;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Arriba
(global-set-key[s-up]'windmove-up)

;;Abajo
(global-set-key[s-down]'windmove-down)

;;Derecha
(global-set-key[s-right]'windmove-right)

;;Izquierda
(global-set-key[s-left]'windmove-left)
