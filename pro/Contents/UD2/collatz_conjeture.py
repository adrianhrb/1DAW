hotpo = int(input("Dime un número: "))
times_to_perform_1 = 0

while hotpo != 1:
    if hotpo % 2 == 0:
        hotpo /= 2
        times_to_perform_1 += 1
    else:
        hotpo = 3 * hotpo + 1
        times_to_perform_1 += 1
    
print(f'Para llegar al nº 1 necesitas {times_to_perform_1} repeticiones')