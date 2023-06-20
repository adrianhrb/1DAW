@echo off
REM ##############################################################
REM #
REM NOMBRE: pares.cmd
REM OBJETIVO: Script que saque los pares entre dos números y sus cuadrados
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total = 2, num1 = 1, num2 = 2
REM SALIDAS: La forma rectangular pintada con #
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM               
REM ##############################################################

set num1=%1
set num2=%2

for /l %%i in (%num1%, 1, %num2%) do(
    set /A parcheck=%%i %%2
    if "!parcheck!" EQU 0 (
        set /A cuad=%%i * %%i
        echo El número %%i es par y su cuadrado es %cuad%
    )
)