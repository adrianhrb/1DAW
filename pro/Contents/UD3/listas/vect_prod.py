v1 = [4, 3, 8, 1]
v2 = [9, 2, 7, 3]
result = 0
scalar_product = []

for x, y in zip(v1, v2):
    result += x * y
    scalar_product.append(f"{x}·{y}")

final_product = " + ".join(scalar_product)

print(f"{final_product} = {result}")

