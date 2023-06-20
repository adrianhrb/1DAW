#!/bin/bash
#############################################################
#
# Nombre: entrega_procesos.sh
# Objetivo: un script que permite interactuar con los procesos del sistema,
# ofreciendo diferentes opciones en función del uso que hacen de los recursos
# del sistema
# Autor: Javier García <javigh1903@movistar.es>
#	 Adrián Herrera <adrian.herrera.br@gmail.com>
#
# Argumentos: total=2,
#               1-maxCPU: %máximo de uso de CPU,
#               2-maxMem: %máximo de uso de la memoria
# Salida: dependiendo de lo que se pida por el usuario se realizan diferentes
# acciones
#
# Fecha: 2023-03-10
#
# Versiónes: 1.0 (código inicial)
#
##############################################################

trap 'echo "Interrumpiendo"; exit 0;' SIGINT
trap 'echo "Finalizando ejecución"; exit 0;' SIGTERM
trap 'uptime;' SIGUSR1
trap 'pkill -u $USER -SIGCONT;' SIGUSR2

maxCPU=$1
maxMem=$2

if [[ -z $maxCPU || -z $maxMem ]]
then
         echo "Se deben indicar dos argumentos"
         exit 100
fi

if [[ $maxCPU -lt 0 || $maxMem -lt 0 ]]
then
         echo "Los argumentos deben ser mayores que 0"
         exit 200
fi

if [[ $maxMem -gt 100 ]]
then
         echo "La memoria maxima debe ser menor a 100"
         exit 150
fi

#Colocamos las traps dentro de la función para que a la hora de llamar a la función del menú
#se ejecuten al instante y no se esperen los 30 segundos del sleep 30 del bucle while
menu(){
    trap 'echo "Interrumpiendo"; exit 0;' SIGINT
    trap 'echo "Finalizando ejecución"; exit 0;' SIGTERM
    trap 'uptime;' SIGUSR1
    trap 'killall -u $USER -s CONT;' SIGUSR2
    echo "¿Que quiere hacer con el proceso?"
    echo "1: Continuar comprobando"
    echo "2: Disminuir la prioridad del proceso"
    echo "3: Interrumpir el proceso"
    echo "4: Terminar el proceso"
    echo "5: Finalizar de inmediato el proceso"
    echo "6: Detener el proceso de forma evitable"
    echo "7: Detener el proceso de forma inevitable"
    echo ""
    read -p "Indica la opción: " opcion
    if [[ $1 == "cpu" ]]
    then
                case $opcion in
                    1) echo "Se sigue registrando"
                    ;;
                    2) renice +3 $cpu_PID
                    ;;
                    3) kill -2 $cpu_PID
                    ;;
                    4) kill -15 $cpu_PID
                    ;;
                    5) kill -9 $cpu_PID
                    ;;
                    6) kill -20 $cpu_PID
                    ;;
                    7) kill -19 $cpu_PID
		    ;;
                esac
    else

	        case $opcion in
                    1) echo "Se sigue registrando"
                    ;;
                    2) renice +3 $memory_PID
                    ;;
                    3) kill -2 $memory_PID
                    ;;
                    4) kill -15 $memory_PID
                    ;;
                    5) kill -9 $memory_PID
                    ;;
                    6) kill -20 $memory_PID
                    ;;
                    7) kill -19 $memory_PID
		    ;;
                esac
    fi
}

while true
do
         #Usando pmem y pcpu que sustituye el uso de %cpu. Recursos extraidos de las
         #siguientes fuentes: https://eltallerdelbit.com/como-saber-que-procesos-consumen-mas-cpu-en-linux/
         #https://stackoverflow.com/questions/58335227/how-to-print-specific-columns-from-file-using-bash
         memory_check=$(ps -eo pid,pmem,comm --sort=-pmem h | head -n 1 | awk '{print $2}')
         memory_PID=$(ps -eo pid,pmem,comm --sort=-pmem h | head -n 1 | awk '{print $1}')
         cpu_check=$(ps -eo pid,pcpu,comm --sort=-pcpu h | head -n 1 | awk '{print $2}')
         cpu_PID=$(ps -eo pid,pcpu,comm --sort=-pcpu h | head -n 1 | awk '{print $1}')

	loaded_cpu=$(bc <<< "$cpu_check>$maxCPU")
	loaded_mem=$(bc <<< "$memory_check>$maxMem")

         if [[ $loaded_cpu -eq 1 ]]
         then
		ps -eo pid,pcpu,comm --sort=-pcpu  | head -n 2
                menu "cpu"

	elif [[ $loaded_mem -eq 1 ]]
	then
		ps -eo pid,pmem,comm --sort=-pmem  | head -n 2
		menu "mem"

	 fi

	sleep 30
done
