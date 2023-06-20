#!/bin/bash
##############################################################################
#
# NOMBRE: crear_usuarios.sh
#OBJETIVO: Script que cree un usuario en base a los datos que se introduzcan
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=3, 1=nombre, 2=apellido, 3=usuario
#SALIDAS: Mensaje de bienvenida con datos y usuario junto a
#         un número aleatorio que se le asigna
#
#FECHA:15/02/2023
#VERSIONES: 1.0 (código inicial)
#	    1.1 (Se añaden las variables al código)
#	    1.2 (Se añade la salida con los argumentos indicados)
#	    1.3 (Se añade la salida con la ejecución del script)
#	    1.4 (Se añade la variable random a la ID)
##############################################################################

nombre=$1
apellidos=$2
usuario=$3

#Analizamos que los argumentos se hayan indicado
if [ -z $nombre ]
then
    echo "Error, no ha indicado el nombre"
    exit
fi  

if [ -z $apellidos ]
then
    echo "Error, no ha indicado apellido"
    exit
fi  

if [ -z $usuario ]
then
    echo "Error, no ha indicado el nombre de usuario"
    exit
fi


echo "Bienvenido $1,"
echo "Tus datos son: $1 $2"
echo "Vamos a crear tu usuario: $3"
echo "Tu nueva id es $RANDOM"

echo "Has ejecutado $0 indicando $# argumentos"
