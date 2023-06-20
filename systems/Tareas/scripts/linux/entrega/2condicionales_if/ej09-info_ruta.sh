#!/bin/bash
###############################################################################
#
#NOMBRE:info_ruta.sh
#OBJETIVO:mostrar la información de ficheros, directorios...
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: Ninguno
#SALIDAS: total=1 (en caso de que se indique) ruta=1
#	  
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################

ruta=$1
#Se comprueba que el argumento no esté vacío
if [ -z "$ruta" ]
#Otra forma equivalente = [ ! -n "$ruta" ]
then
	echo "Error: el script $0 debe ejecutarse con un argumento (ruta)"
	exit
fi

#Comprueba que el argumento exista
if [ ! -e "$ruta" ]
then
	echo "La ruta '$ruta' NO existe"
	exit
fi

#Comprueba el tipo de argumento
if [ -d "$ruta" ]
then
	echo "La ruta '$ruta' es un directorio"
elif [ -f "$ruta" ]
then
	echo "La ruta '$ruta' es un fichero"
elif [ -h "$ruta" ]
then
	echo "La ruta '$ruta' es un enlace simbólico"
else
	echo "La ruta '$ruta' es de otro tipo"
fi

#Muestra los permisos
echo -n "Permisos de $ruta: " #Usamos el -n en echo para cancelar el salto de línea

if [ -r "$ruta" ]
then
	echo -n "SI lectura"
else
	echo -n "NO lectura"

fi

if [ -w "$ruta" ]
then
        echo -n "SI escritura"
else
        echo -n "NO escritura"

fi

if [ -x "$ruta" ]
then
        echo -n "SI ejecución"
else
        echo -n "NO ejecución"

fi

#Vamos a ver el tamaño
if [ -s "$ruta" ]
then
	echo "Su tamaño es > 0 bytes"
else
	echo "Está vacío"
fi

