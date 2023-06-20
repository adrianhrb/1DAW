@echo off
REM ###############################################################################
REM #
REM #NOMBRE:calculadora.sh
REM #OBJETIVO:Realizar una calculadora
REM #AUTOR: Adrián Herrera Brito <adrian.herrera.br@gmail.com>
REM #		Raúl Rodríguez Farrais <raulrodrigue87@gmail.com>
REM #ARGUMENTOS: dos números
REM #SALIDAS: Resultado de la operación que se pide
REM #
REM #VERSIONES: 1.0: Código inicial (15/02/2023)
REM #
REM ###############################################################################


REM Version sin utilizar choice

cls 

echo ........................................................
echo ........................................................
echo Bienvenido a la calculadora, introduce los numeros:
set /p number1= "Dime el numero 1: "
set /p number2= "Dime el numero 2: "
echo ........................................................
echo ........................................................
echo CALCULADORA:
echo 1. Pulsa 1 para Sumar
echo 2. Pulsa 2 para Restar
echo 3. Pulsa 3 para Multiplicar
echo 4. Pulsa 4 para Dividir
echo 5. Pulsa 5 para hacer el Cuadrado de ambos numeros
echo 6. Pulsa 6 para hacer una Doble multiplicación
echo ........................................................
echo ........................................................
set /p opcion="Elige una opcion: "

set /A suma= %number1% + %number2%
set /A resta= %number1% - %number2%
set /A multiplicacion= %number1% * %number2%
set /A division= %number1% / %number2%
set /A cuadrado1= %number1% * %number1%
set /A cuadrado2= %number2% * %number2%
set /A doblemult= %number1% * %number1% * %number2% * %number2%

if %opcion% == 1 (
    echo El resultado de la suma de %number1% y %number2% es: %suma%
) else if %opcion% == 2 (
    echo El resultado de la resta de %number1% y %number2% es: %resta%
) else if %opcion% == 3 (
    echo El resultado de la multiplicacion de %number1% y %number2% es: %multiplicacion%
) else if %opcion% == 4 (
    echo El resultado de la division de %number1% y %number2% es: %division%
) else if %opcion% == 5 (
    echo El cuadrado de %number1% es: %cuadrado1%
    echo ............................
    echo El cuadrado de %number2% es: %cuadrado2%
) else if %opcion% == 6 (
    echo El resultado de la doble multiplicación entre %number1% y %number2% es %doblemult%
)