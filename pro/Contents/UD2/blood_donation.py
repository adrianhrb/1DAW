age = int(input("¿Cuál es tu edad?: "))
weight = int(input("¿Cuál es tu peso?: "))
heartbeat = int(input("¿Cuál es tu frecuencia cardiaca: "))
platelets = int(input("¿Cuántas plaquetas tienes?: "))

if 18 <= age <= 65:
    if weight > 50:
        if 50 <= heartbeat <= 110:
            if platelets > 150_000:
                print("Usted es apto para donar sangre")
            else:
                print("Usted no tiene plaquetas suficientes para donar")
        else:
            print("Usted no tiene una frencuencia cardiaca dentro del rango óptimo para donar")
    else:
        print("Usted no tiene un peso apto para donar")
else:
    print("Usted no tiene una edad dentro del rango óptimo para donar")
