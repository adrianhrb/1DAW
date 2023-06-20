obj_num = 5
attempts = 0
guess_number = None
while guess_number != obj_num:
    guess_number = float(input("Dime un número: "))
    if guess_number < obj_num:
        attempts += 1
        print("Mayor")
    elif guess_number > obj_num:
        attempts += 1
        print("Menor")

# Si salimos del bucle los números son iguales
attempts += 1
print(f"✅ ¡Enhorabuena! Has encontrado el número en {attempts} intentos")