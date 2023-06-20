start_number = int(input("Dime un número: "))
square_number = start_number
while True:
    result = square_number ** (1/2)
    if result == int:
        print (f'The nearest square number of {start_number} is {square_number}')
    else:
        square_number += 1