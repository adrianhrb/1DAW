num = input("Dime un número: ")
target_mult = int(input("Cuántas veces quieres la multiplicación: "))

for number in range (1,target_mult + 1):
    mult = int(num * number)
    result = mult * mult
    print(f'{mult} * {mult} = {result}')
