base = int(input("Dime la base: "))
altura = int(input("Dime la altura: "))

if base == altura:
    area = base * altura
    print("El área es = ", area)
else:
    perimetro = base * 2 + altura * 2
    print("El perimetro es = ", perimetro)