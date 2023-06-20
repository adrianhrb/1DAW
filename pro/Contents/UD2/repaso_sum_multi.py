initial_num = int(input("Dime un nº: "))
limit_num = int(input("Dime un nº: "))  
result = 0

for num in range (initial_num, limit_num + 1):
    if num % initial_num == 0:
        print (num, end=" ")
        result += num
        continue

print(result)
