floor_number = int(input("Dime la planta en EEUU: "))

if 0 < floor_number < 13:
    floor_number -= 1
    print(floor_number)
elif floor_number > 13:
    floor_number -= 2
    print(floor_number)
else:
    print(floor_number)
