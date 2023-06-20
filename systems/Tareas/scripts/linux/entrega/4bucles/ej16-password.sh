#!/bin/bash
###############################################################################
#
#NOMBRE:password.sh
#OBJETIVO: Que el usuario ponga la constraseña exactamente igual 
#		   dos veces
#
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: Dos entradas con contraseña y su "check"
#SALIDAS: si ha acertado o no
#
#VERSIONES: 1.0: Código inicial (15/02/23)
#
###############################################################################
read -sp "Indique la contraseña que quiera poner: " password
echo ""
read -sp "Repita la contraseña exactamente igual: " passwordcheck
echo ""

while [ $password != $passwordcheck ]
do
	read -sp "Las contraseñas no coinciden. Vuelva a indicar la contraseña: " password
	echo ""
	read -sp "Repita la contraseña: " passwordcheck
	echo ""
done

echo ""
echo "Contraseña correctamente agregada"
