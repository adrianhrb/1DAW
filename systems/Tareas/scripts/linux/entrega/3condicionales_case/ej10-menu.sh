#!/bin/bash
###############################################################################
#
#NOMBRE:menu.sh
#OBJETIVO: hacer un menú condicional case
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: Ninguno (pide entrada de teclado una vez mostrado el menu)
#SALIDAS: acción indicada
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#
###############################################################################
clear
echo ""
echo "**************"
echo "* M  E  N  Ú *"
echo "**************"
echo ""

echo "1: Indicar el espacio de la raíz (%)"
echo "2: Indicar el espacio de la raíz (Tamaño)"
echo "3: Que me diga el usuario"
echo "4: Nombre de la máquina"
echo "5: Número de usuarios"
echo "6: Total de espacio usado"
echo "7: Crear un archivo Readme.txt para github"
echo "8: Mostrar la fecha actual"
echo ""
read -p "Indica la opción: " opcion

case $opcion in
	1) df -h | cut -d: -f5
	;;
	2) df -m | cut -d: -f2
	;;
	3) whoami 
	;;
	4) hostname
	;;
	5) users | wc -l
	;;
	6) du -h
	;;
	7) touch Readme.txt
	;;
	8) date
	;;
	*) echo "$opcion no es una opción correcta"
	;;
esac
