num1 = int(input("Dime el primer número: "))
num2 = int(input("Dime el segundo número: "))
num3 = int(input("Dime el tercer número: "))


match num1:
    case n if num1 < num2 and num1 < num3:
        print(f'El número más pequeños es {num1}')
    case n if num2 < num1 and num2 < num3:
        print(f'El número más pequeños es {num2}')
    case n if num3 < num2 and num3 < num1:
        print(f'El número más pequeños es {num3}')
    
    
    


