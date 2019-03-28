Estos son comandos básicos y útiles para usar Emacs y no morir en el intento.

The difference between emacs, and vi, is like the difference between making love,
and masturbation.That is to say: ‘vi’ will always be there when you need it.


C = Ctrl
M (META) = Alt
SUPER = Tecla de Windows
SPC = Barra Espacio

http://emacs-bootstrap.com/

############################################################################

*.- Comando de ayuda	.......... C-h

#COMANDOS BÁSICOS DE EMACS

1.- Abrir un archivo.	.......... C-x C-f

2.- Cerrar Emacs	.......... C-x C-c

3.- Cerrar el buffer	.......... C-x k

4.- Cambiar de buffer	.......... C-x b

5.- Guardar un archivo 	.......... C-x C-s

6.- Cancelar alguna acción ....... C-g

7.- Deshacer alguna acción ....... C-x u

8.- Copiar texto	.......... M-w

9.- Pegar texto		.......... C-y

10.- Cortar texto	.......... C-w

11.- Seleccionar todo
     texto		.......... C-SPC

12.- Dividir la pantalla en
     dos horizontalmente.......... C-x 2

13.- Dividir la pantalla en
     verticalmente	.......... C-x 3

14.- Moverse entre
     pantallas		.......... C-x o

15.- Deja solo una ventana
     abierta		.......... C-x 1

16.- Cerrar una ventana	.......... C-x 0

17.- Mueve la pantalla
     para poder mostrar
     el texto		.......... C-l

18.- Se desplaza una pantalla
     hacia abajo	.......... C-v

19.- Se desplaza una pantalla
     hacia arriba	.......... M-v

20.- Buscar Una palabra .......... C-s

21.- Buscar Siguiente	.......... C-s / C-r

22.- Minimiza la ventana
     de Emacs		.......... C-z
############################################################################

#SHELL

23.- Poder usar comandos
     en Emacs		.......... M-x

24.- Compilar Código en Emacs .... M-x compile
     saldra make -k y pondremos
     g++ program.cpp -o program

25.- Ejecutar Shell  	.......... M-x shell

     	      ó

     Ejecutar Shell	.......... M-x eshell

26.- Abrir Shell Python .......... C-c C-p

############################################################################

#MOVERSE POR TEXTO

27.- Moverse un cararcter
     hacia delante	.......... C-f

28.- Moverser un caracter
     hacia atrás	.......... C-b

29.- Moverse una palabra
     hacia adelante	.......... M-f

30.- Moverse una palabra
     hacia atrás	.......... M-b

31.- Moverse a la siguiente
     línea		.......... C-n

32.- Moverse a la línea
     anterior		.......... C-p

33.- Moverse al comienzo
     de una línea	.......... C-a

34.- Moverse al final
     de una línea	.......... C-e

35.- Moverse al inicio
     de una oración	.......... M-a

36.- Moverse al final
     de una oración	.......... M-e

37.- Revisar la ortografía
     sobre alguna palabra ........ M-$

38.- Revisar la ortografía
     de todo el texto
     en el buffer	.......... M-x ispell

############################################################################

#PERSONALIZACIÓN DE EMACS

*El archivo de configuración de Emacs es /.emacs

~Ejemplos de mí Personalización en Emacs.-

39.- Sí quiero quitar la barra de menu y la barra de tareas escribo lo
     siguiente.

     '(menu-bar-mode nill)
     '(tool-bar-mode nill))

40.- Sí quiero que aparezacan numeradas las lineas escribo la siguiente
     línea.

     '(global-linum-mode t)


     La forma gráfica reuqiere ingresar
     M-x customize
############################################################################

#THEME DE EMACS

*Cambiar theme de Emacs

41.- Vamos al archivo de configuración de Emacs
     ~/.emacs y dentro del archivo en mi caso pondremos
     la siguiente línea:

     '(custom-enable-theames (quote (light-blue)))

~También existe la forma de poner un tema de forma gráfica

42.- Ingresamos el comando "customize-themes" y tendremos algunos
     themes por defecto, hay que recordar que al seleccionar
     la casilla de algun tema debemos guardarlo para que
     la configuración permanezca una ves allamos cerrado
     Emacs

#####################################################################

#CONFIGURACIÓN DE PAQUETES

~Lo que vamos a hacer es ampliar nuestra lista de pauqetes
    que por defecto lee Emacs

43.- Visualizar paquetes por defecto de Emacs
     		M-x list-package

*Por defecto Emacs esta conectado al servidor elpa
~Nos conectaremos a un servidor llamado melpa

44.- Entramos a customize
     M-x customize

     -En el filtramos "packages"
     -Vamos a Package Archives ahí añadiremos la url de melpa
     	    https://melpa.org/packages/
     -Recuerda guardarla para futuras sesiones
     -configurar donde se van a guardar los paquetes
     -Vamos a Package User Dir ~/.emacs/<melpa>
     -Reiniciamos la sesión de Emacs

45.- format-all	  Autoidentado

#############################################################

# Company Mode
	 Company mode es un framework que proporciona un completado
	 inteligente de código para los distintos modos de GNU Emacs.

	 	     M-x package-install RET company

# Pomidor
	Pomidor es un paquete que permite tomar tiempos de trabajo,
	basado en la técnica Pomodoro, la cual básicamente se trata
	de dividir las actividades en pequeños ciclos de 30 minutos
	llamados “pomodoros”, de los cuales 25 minutos se los dedica
	a trabajar sin distracciones y 5 minutos a un pequeño descanso.
	Después de 4 pomodoros se puede tomar un descanso de 20 minutos.

	Pomidor notifica cuando es hora de trabajar y cuando se puede descansar.

		     M-x package-install RET pomidor
################################################################


46.- make-directory	.......... crear directorios desde
     				   la barra de Emacs

47.- delete-directory	.......... borrar directorios desde
     				   la barra de Emacs

################################################################

# MELPA

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


# USE-PACKAGE
(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

################################################################

# Spotify

Play			counsel-spotify-play
Toggle play/pause	counsel-spotify-toggle-play-pause
Next song		counsel-spotify-next
Previous song		counsel-spotify-previous

################################################################

# Cambiar configuración de teclas

(global-set-key (kbd "RET" ) 'newline-and-indent)
(global-set-key (kbd "C-;" ) 'comentar-o-descomentar-región)
(global-set-key (kbd "M- /" ) 'hippie-expand)
(global-set-key (kbd "C- +" ) 'aumento de escala de texto'
(global-set-key (kbd "C--" ) 'disminución de escala de texto'
(global-set-key (kbd "Cc Ck" ) 'compilar)
(global-set-key (kbd "Cx g" ) 'magit-status)

################################################################

#JEDI
* Primero se configura The Lazy Installer
* En el directorio ~/.emacs/init.el
* Agregamos lo Siguiente:

(custom-set-variables
 '(inhibit-startup-screen t)
 )

* Reiniciamos Emacs
* Ahora en The Lazy Installer

(url-retrieve
 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el"
 (lambda (s)
   (goto-char (point-max))
   (eval-print-last-sexp)))

* Presionamos C-j

#####################################################################

##jedi
* En ~/.emacs/init.el

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

	M-x el-get-install RET jedi RET
	M-x jedi:install-server RET

###############################################################

# Eliminar Emacs

$ sudo apt-get purge emacs24
$ sudo apt-get remove --auto-remove emacs24-lucid emacs24-nox
