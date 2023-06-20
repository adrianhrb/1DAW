@echo off
REM ##############################################################
REM #
REM NOMBRE: compara.cmd
REM OBJETIVO: Script que compare dos numeros y que indique cual es
REM           mayor o si son iguales
REM AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #      Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM ARGUMENTOS: total=3, 1=nombre, 2=apellido, 3=usuario
REM SALIDAS: Mensaje de bienvenida con datos y usuario
REM #
REM #
REM FECHA:15/02/23
REM VERSIONES: 1.0 (código inicial)
REM               
REM ##############################################################

set /p number1=Introduce el primer número: 
set /p number2=Introduce el segundo número: 

if %number1% EQU %number2% (
  echo Los dos números son iguales.
) else (
  if %number1% GTR %number2% (
    echo %number1% es mayor que %number2%.
  ) else (
    echo %number2% es mayor que %number1%.
  )
)


