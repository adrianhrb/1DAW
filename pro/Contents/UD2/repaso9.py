a = 12
b = 44

divisor = a if a < b else b

for num in range(divisor, 0, -1):
    if a % num == 0 and b % num == 0:
        break
    else:
        continue

print(num)
