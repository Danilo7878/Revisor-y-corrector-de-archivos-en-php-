Danilo Sandoval 1167216
Proyecto, analizador de léxico de lenguaje php
Utilizando Jflex para crear un archivo .java a partir de uno .flex
el cual contiene expresiones regulares para las palabras reservadas, tipos de datos, operadores etc.

utilización muy sencilla:
contiene 2 botones, uno sirve para cargar la dirección del archivo .php a analizar
(permite escogerlo con un cuadro de diálogo)

una vez cargado, el segundo botón sirve para realizar el proceso de análisis del archivo
comparando con los tokens generados por los match encontrados en el archivo leído y el .flex
 si el archivo contiene errores los mostrará en un área de texto y además generará un archivo .txt
con la misma información en el mismo directorio del archivo original.
Si el archivo no contiene errores y coincide completamente con el lenguaje definido, crea un
archivo con extensión .out, sin los comentarios y corrigiendo los casos de mayúsculas y minúsculas
en este caso solo se mostrará en la aplicación que el análisis terminó.
****si aún no se carga ningún archivo php, este botón simplemente no hará nada***

