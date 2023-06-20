num = 11

for number in range (2, num // 2):
    if num % number == 0:
        print ("No es primo")
        break
else:
    print("Es primo")