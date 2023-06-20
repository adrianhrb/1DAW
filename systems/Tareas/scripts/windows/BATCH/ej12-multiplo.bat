@echo off
REM ###############################################################################
REM #
REM #NOMBRE:multiplo.sh
REM #OBJETIVO: Utilizar bucles para ver si un numero es multiplo
REM #           de otros que se han dado como entrada
REM #AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #       Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM #ARGUMENTOS: Todos aquellos que se introduzcan por teclado
REM #SALIDAS: Si el numero es o no multiplo
REM #
REM #VERSIONES: 1.0: Código inicial (15/02/2023)
REM #
REM ###############################################################################

set parametros= %*
set /p mult="Dime el multiplo: "
 
for %%i in (%parametros%) do (
    set /A resto=%%i %%%mult%
    if "!resto!" EQU 0 (
        echo %%i es múltiplo de %mult%.
    ) else (
        echo %%i no es múltiplo de %mult%.
    )
)