#!/bin/bash
###############################################################################
#
#NOMBRE: rutas.sh
#OBJETIVO: ejecutar el script de rutas (ej09) siempre y cuando el elemento de
#          el directorio actual tenga más de 4 caracteres
#           
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: NO
#SALIDAS: La ejecución del script siempre y cuando se cumpla la condición 
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

dir=$(ls)
for file in $dir
do
    if [ ${#file} -gt 4 ]
    then
        if [ -d "$file" ]
    then
        echo "La ruta '$file' es un directorio"
    elif [ -f "$file" ]
    then
        echo "La ruta '$file' es un fichero"
    elif [ -h "$file" ]
    then
        echo "La ruta '$file' es un enlace simbólico"
    else
        echo "La ruta '$file' es de otro tipo"
    fi

    #Muestra los permisos
    echo -n "Permisos de $file: " #Usamos el -n en echo para cancelar el salto de línea

    if [ -r "$file" ]
    then
        echo -n "SI lectura"
    else
        echo -n "NO lectura"

    fi

    if [ -w "$file" ]
    then
            echo -n "SI escritura"
    else
            echo -n "NO escritura"

    fi

    if [ -x "$file" ]
    then
            echo -n "SI ejecución"
    else
            echo -n "NO ejecución"

    fi

    #Vamos a ver el tamaño
    if [ -s "$file" ]
    then
        echo "Su tamaño es > 0 bytes"
    else
        echo "Está vacío"
    fi
done