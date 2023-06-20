a = 0
print(a)
b = 1
print(b)

for number in range (98):
    result = a + b
    a = b
    b = result
    print(result)