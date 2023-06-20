a = int(input("Qué numero es a?: "))
b = int(input("Qué numero es b?: "))
c = int(input("Qué numero es c?: "))

numerator1 = -b + ((b ** 2 - 4 * a * c)) ** 1/2
numerator2 = -b - ((b ** 2 - 4 * a * c)) ** 1/2
denominator = 2 * a

x1 = numerator1 / denominator
x2 = numerator2 / denominator

print(f'El resultado de x1 es {x1}')
print(f'El resultado de x2 es {x2}')