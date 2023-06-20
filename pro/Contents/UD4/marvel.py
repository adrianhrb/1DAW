""" def separated_numbers(values: list):
    pares = []
    impares = []
    for i in values:
        if i % 2 == 0:
            pares.append(i)
        else:
            impares.append(i)
    
    return pares, impares

print(separated_numbers([6,5,2,1,7])) """


""" def all_numbers(n: int):
    if n == 0:
        return print(n)
    print(n)

    return all_numbers(n-1)

all_numbers(6) """

# FUNCIÓN PARA CALCULAR LA NOTA DE UN ESTUDIANTE. 1 Y 2 VALEN 30% Y LA 3 VALE 40%:

""" def notas_curso(n1: int, n2:int, n3:int):
    primer_trimestre = n1 * 0.3 
    segundo_trimestre = n2 * 0.3 
    tercer_trimestre = n3 * 0.4 
    nota_final = (primer_trimestre + segundo_trimestre + tercer_trimestre)
    return nota_final

print(notas_curso(5, 6, 4)) """

# CÁCLCULO DE IVA

""" def iva_calculator(price: int):
    iva_amount = price * 0.19
    return price + iva_amount

print(iva_calculator(100)) """

# MOSTRAR TABLA DE MULTIPLICAR DE UN Nº

""" def tabla_multiplicar(n: int, mult = 0):
    res = n * mult
    print(f'{n} * {mult} = {res}')
    if mult == 10:
        return
    return tabla_multiplicar(n, mult+1)

tabla_multiplicar(6) """

# MEJORA DE SALARIO

""" def mejora_salario(salario: float, porcentaje: float):
    mejora = salario * (porcentaje / 100)
    return salario + mejora

print(mejora_salario(1000, 10)) """

# DECORADORES CON PARÁMETROS PARA ORDENAR

def sorter(ascending=False):
    def decorator(func):
        def wrapper(*args, **kwargs):
            return sorted(func(*args, **kwargs), reverse = not ascending)
        return wrapper
    return decorator

@sorter()
def suma_lista(values1: list, values2: list):
    return values1 + values2

print(suma_lista([5,6,7,8], [1,2,3,4]))
