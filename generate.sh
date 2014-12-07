#/bin/bash

NAME=tesis

#~ Function que sirve para eliminar los archivos temporales
clean(){
    find . -type f -name "*-blx.bib" -exec rm -f {} \;
    find . -type f -name "*.synctex.gz" -exec rm -f {} \;
    find . -type f -name "*.aux" -exec rm -f {} \;
    find . -type f -name "*.log" -exec rm -f {} \;
    find . -type f -name "*.bbl" -exec rm -f {} \;
    find . -type f -name "*.lot" -exec rm -f {} \;
    find . -type f -name "*.blg" -exec rm -f {} \;
    find . -type f -name "*.bcf" -exec rm -f {} \;
    find . -type f -name "*.run.xml" -exec rm -f {} \;
    find . -type f -name "*.lof" -exec rm -f {} \;
    find . -type f -name "*.toc" -exec rm -f {} \;
    find . -type f -name "*.fdb_latexmk" -exec rm -f {} \;
    find . -type f -name "*.orig" -exec rm -f {} \;
    find . -type f -name "*.loa" -exec rm -f {} \;
    find . -type f -name "*.snm" -exec rm -f {} \;
    find . -type f -name "*.nav" -exec rm -f {} \;
    find . -type f -name "*.out" -exec rm -f {} \;
}


#~ Funcion que costruye
build(){
    pdflatex $NAME
    biber $NAME
    pdflatex $NAME
    pdflatex $NAME
    evince $NAME.pdf&
}

#~ Funcion que costruye el ppt
build_ppt(){
    pdflatex $NAME
    evince $NAME.pdf&
}

if [ -n "$1" ] && [ "$1" = "clean" ]
then
    clean

elif [ -n "$1" ] && [ "$1" = "paper" ]
then
    cd ieee-paper
    NAME=paper-i3e
    echo $NAME
    clean
    build
    clean

elif [ -n "$1" ] && [ "$1" = "ppt" ]
then
    cd presentacion
    NAME=presentacion
    echo $NAME
    clean
    build_ppt
    clean

elif [ -n "$1" ] && [ "$1" = "all" ]
then
    cd book
    clean
    build
    cd ../ieee-paper
    NAME=paper-i3e
    echo $NAME
    build
    cd ../presentacion
    NAME=presentacion
    echo $NAME
    build_ppt
    clean
elif [ -n "$1" ]
then
    NAME=$1
    echo $NAME
    clean
    build
    clean
else
    cd book
    clean
    build
    clean
fi
