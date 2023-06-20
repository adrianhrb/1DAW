#!/bin/bash
###############################################################################
#
#NOMBRE:calculadora.sh
#OBJETIVO:Realizar una calculadora
#AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
#		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
#ARGUMENTOS: total=2,  num1=1 , num2=2
#SALIDAS: Resultado de la operación que se pide
#
#VERSIONES: 1.0: Código inicial (15/02/2023)
#	    1.1 Cambiamos el read -p para que no se pregunte (15/02/2023)
###############################################################################
num1=$1
num2=$2
#read -p "Introduzca una opción: " opcion
opciones=("Sumar" "Restar" "Dividir" "Multiplicar" "Cuadrado" "Doble multiplicacion" "Salir")

select opcion in "${opciones[@]}"
do
	case $opcion in
		Sumar) echo "El resultado de sumar $num1+$num2 es $(( num1 + num2 ))"
		  ;;
		Restar) echo "El resultado de restar $num1-$num2 es $(( num1-num2 ))"
	  	;;
		Multiplicar) echo "El resultado de multiplicar $num1*$num2 es $(( num1*num2 ))"
		  ;;
		Dividir) echo "El resultado de dividir $num1/$num2 es $(( num1/num2 ))"
		  ;;
		Cuadrado) echo "El resultado de hacer el cuadrado de ambos numeros seria $num1 = $(( num1*num1 )) y $num2 = $(( num2*num2 ))"
		  ;;
		Doble multiplicacion) echo "El resultado de la doble multiplicacion entre $num1 y $num2 seria $(( num1*num2*num1*num2 ))"
		  ;;
		Salir) break ;;
		*) echo "Opción incorrecta. Elija una del menú."
	esac
done
