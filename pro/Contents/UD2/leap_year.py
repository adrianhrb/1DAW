entrada = 2008
condition1 = entrada % 4 == 0 and entrada % 100 != 0
condition2 = entrada % 400 == 0
if condition1 or condition2:
    print("Es un año bisiesto")
else:
    print("No es bisiesto")