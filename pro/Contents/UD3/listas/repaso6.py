entry = [[4, 6, 1], [2, 9, 3], [1, 7, 7]]

output = 0

for number in range(len(entry)):
    output += entry[number][number]

print(output)