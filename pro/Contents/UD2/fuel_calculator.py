litres = float(input("Litros de gasolina: "))
pricePerLitre = float(input("Precio de la gasolia por litro en céntimos: "))

'''if litres >= 2:
    price = litres * pricePerLitre
    discount = 0.05 * litres
    final_price = price - discount
    r_final_price = round(final_price, 2)
    print("El precio final es de: ", r_final_price)
elif 2 < litres <= 4:
    price = litres * pricePerLitre
    discount = 0.10 * litres
    final_price = price - discount
    r_final_price = round(final_price, 2)
    print("El precio final es de: ", r_final_price)
elif 4 < litres <= 6:
    price = litres * pricePerLitre
    discount = 0.15 * litres
    final_price = price - discount
    r_final_price = round(final_price, 2)
    print("El precio final es de: ", r_final_price)
elif 6 < litres <= 8:
    price = litres * pricePerLitre
    discount = 0.20 * litres
    final_price = price - discount
    r_final_price = round(final_price, 2)
    print("El precio final es de: ", r_final_price)
else:
    price = litres * pricePerLitre
    discount = 0.25 * litres
    final_price = price - discount
    r_final_price = round(final_price, 2)
    print("El precio final es de: ", r_final_price)'''

match litres:
    case n if n >= 2:
        price = litres * pricePerLitre
        discount = 0.05 * litres
        final_price = price - discount
        r_final_price = round(final_price, 2)
        print("El precio final es de: ", r_final_price)
    case n if 2 < n <= 4:
        price = litres * pricePerLitre
        discount = 0.10 * litres
        final_price = price - discount
        r_final_price = round(final_price, 2)
        print("El precio final es de: ", r_final_price)
    case n if 4 < n <= 6:
        price = litres * pricePerLitre
        discount = 0.15 * litres
        final_price = price - discount
        r_final_price = round(final_price, 2)
        print("El precio final es de: ", r_final_price)
    case n if 6 < n <= 8:
        price = litres * pricePerLitre
        discount = 0.20 * litres
        final_price = price - discount
        r_final_price = round(final_price, 2)
        print("El precio final es de: ", r_final_price)
    case n if n > 8:
        price = litres * pricePerLitre
        discount = 0.25 * litres
        final_price = price - discount
        r_final_price = round(final_price, 2)
        print("El precio final es de: ", r_final_price)