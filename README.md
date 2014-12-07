fpuna-tesis-template
====================
Template para proyectos de tesis de la Facultad Politécnica de la Universidad Nacional de Asunción

Requerimientos para la defensa de la tesis
---
1. Tres libros impresos con el formato respectivo, uno de ellos con un CD que debe tener el libro y los reportes en pdf y el código en versión fuente y ejecutable con todos los experimentos de la tesis.
2. constancia de no adeudar ningún tipo de arancel a la FPUNA y a la biblioteca
3. copia de la boleta de pago de derecho a defensa publica.

Estos tres tienen que presentar antes de la defensa.

Dependencias
---
Instalar los paquetes necessarios

```sh
sudo apt-get install texlive-latex-base
sudo apt-get install biblatex
sudo apt-get install texlive-science
sudo apt-get install texlive-latex-extra
```


Generar pdf
---
Para generar el pdf final se creo un pequeño script para facilitar la tarea.

```sh
sh generate.sh
```
