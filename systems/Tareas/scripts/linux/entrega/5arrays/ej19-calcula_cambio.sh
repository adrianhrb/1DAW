#!/bin/bash
###############################################################################
#
#NOMBRE: 
#OBJETIVO: Un programa que calcule el cambio con billetes predefinidos
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: El precio que cuesta el artículo y una entrada con lo pagado
#SALIDAS: Cúantos billetes de cada hay que devolver

#VERSIONES: 1.0: Código inicial (15/02/23)
#
###############################################################################
precio=$1

read -p "Indique el dinero que se ha pagado: " pago

echo "Se ha comprado un algo de $precio euros y se han pagado $pago euros"

cambio=$(($pago - $precio))
echo "El cambio son $cambio euro(s), debe entregar:"

for i in 500 200 100 50 20 10 5 2 1
do
	devolucion=$(($cambio / $i))
	if [ $devolucion -gt 0 ]
	then
		echo "Hay que devolver $devolucion billetes de $i"
		cambio=$(($cambio - $devolucion * $i))
	fi
done
