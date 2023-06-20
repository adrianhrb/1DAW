@echo off
REM ###############################################################################
REM #
REM #NOMBRE:imc.sh
REM #OBJETIVO:calcular el índice de masa corporal de una persona
REM #
REM #
REM #AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM #ARGUMENTOS: 2 argumentos, altura y peso
REM #SALIDAS: el calculo de su imc con un mensaje que indica el rango
REM #		  en el que se encuentra
REM #VERSIONES: 1.0: Código inicial (15/02/2023)
REM #
REM ###############################################################################

set peso=%1
set altura=%2

set /a imc=(10000*%peso%) / (%altura%*%altura%)

if %imc% lss 16 (
    echo Tu masa corporal es de %imc% imc, tienes delgadez severa.
) else if %imc% lss 17 (
    echo Tu masa corporal es de %imc% imc, tienes delgadez moderada.
) else if %imc% lss 19 (
    echo Tu masa corporal es de %imc% imc, tienes delgadez leve.
) else if %imc% lss 25 (
    echo Tu masa corporal es de %imc% imc, tienes un peso normal.
) else if %imc% lss 30 (
    echo Tu masa corporal es de %imc% imc, tienes sobrepeso.
) else (
    echo Tu masa corporal es de %imc% imc, tienes obesidad.
)