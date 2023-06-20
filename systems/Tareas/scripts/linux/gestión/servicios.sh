#!/bin/bash
#############################################################
#
# Nombre: servicios.sh
# Objetivo: Un script que va a analizar un servicio (si existe)
# 			y que va a realizar varias acciones dependiendo del
#			estado del servicio
#
# Autor: Yerobe García <yerogargonz@gmail.com>
#	     Adrián Herrera <adrian.herrera.br@gmail.com>
#
# Argumentos: total=1
#               1- Nombre del servicio a analizar
#
# Salida: La salida dependerá de las opciones que se elijan en
#		  el menú y del estado del argumento anterior además
#		  de si existe o no.
#
# Fecha: 2023-03-16
#
# Versiónes: 1.0 (código inicial)
#
##############################################################

name_service=$1

while [ -z $name_service ]
do
	read -p "Escriba el nombre de un servicio para analizar: " name_service
done

exist=$(systemctl status $name_service | wc -l)
echo $exist
if [[ $exist -gt 0 ]]
then
	clear
	echo "El servicio indicado <<<$name_service>>> tiene la siguiente información: "
	active=$(systemctl is-active $name_service)
	enabled=$(systemctl is-enabled $name_service)
	if [[ $active == active ]]
	then
		echo "El servicio SI está activo"
	else
		echo "El servicio NO está activo"
	fi
	if [[ $enabled == enabled ]]
	then
		echo "El servicio SI está habilitado"
	elif [[ $enabled == masked ]]
	then
		echo "El servicio está enmascarado"
	else
		echo "El servicio NO está habilitado"
	fi
else
	echo "El servicio indicado no existe o no es un servicio"
	exit 10
fi


while true
do
	echo ""
	echo ""
	echo "***********"
	echo "* M E N Ú *"
	echo "***********"
	echo ""
	echo ""
	active=$(systemctl is-active $name_service)
	enabled=$(systemctl is-enabled $name_service)
	if [[ $active == inactive ]] && [[ $enabled != masked ]]
	then
		echo "1. Activar el servicio"
	elif [[ $active == active ]] && [[ $enabled != masked ]]
	then
		echo "1. Desactivar el servicio"
	else
		echo "El servicio está enmascarado y no se puede iniciar ni habilitar"
	fi

	if [[ $enabled == enabled ]]
	then
		echo "2. Deshabilitar el servicio"
	elif [[ $enabled == disabled ]]
	then
		echo "2. Habilitar el servicio"
	fi

	if [[ $enabled != masked ]]
	then
		echo "3. Enmascarar servicio"
	elif [[ $enabled == masked ]]
	then
		echo "3. Desenmascarar el servicio"
	fi

	echo "4. Configuración del servicio"
	echo "5. Aplicar cambios dejando el servicio activo"
	echo "6. Aplicar cambios dejando el servicio en su estado"
	echo "7. Tiempo de carga de la máquina"
	echo "8. Tiempo de carga de este servicio"
	echo "9. Apagar"
	echo "10. Reiniciar"
	echo "11. Salir"
	echo ""
	read -p "Indica una opción: " opcion
	echo ""
	echo ""
	case $opcion in
		1) if [[ $enabled != masked ]] && [[ $active == inactive ]]
		   then
			sudo systemctl start $name_service
		   elif [[ $enabled != masked ]] && [[ $active == active ]]
		   then
			sudo systemctl stop $name_service
		   fi
		;;
		2) if [[ $enabled == enabled ]]
		   then
			sudo systemctl disable $name_service
		   elif [[ $enabled == disabled ]]
		   then
			sudo systemctl enable $name_service
		   fi
		;;
		3) if [[ $enabled == masked ]]
		   then
			sudo systemctl unmask $name_service
		   else
			sudo systemctl mask $name_service
		   fi
		;;
		4) systemctl show $name_service
		;;
		5) sudo systemctl reload-or-restart $name_service
		;;
		6) sudo systemctl reload-or-try-restart $name_service
		;;
		7) systemd-analyze
		;;
		8) systemd-analyze blame | grep $name_service
		;;
		9) poweroff
		;;
		10) reboot
		;;
		11) exit
	esac

done
