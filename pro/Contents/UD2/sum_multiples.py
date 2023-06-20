multiple_number = int(input("Dime un número: "))
limit_number = int(input("Dime un número limite: "))
result = 0

for number in range(multiple_number, limit_number):
    if number % multiple_number  == 0:
        print(number, end=" ")
        result += number
    
print(f'= {result}')
