edad = int(input("Dime tu edad: "))

match edad: 
    case n if n < 14:
        print("Drink toddy")
    case n if 14 <= n < 18:
        print("Drink coke")
    case n if 18 <= n < 21:
        print("Drink beer")
    case n if n >= 21:
        print("Drink whisky")