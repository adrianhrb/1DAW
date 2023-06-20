entry = [0, 0, 1, 2, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 4, 4]
num = entry[0]
new_list = []


for number in entry[1:]:
    if number != num:
        new_list.append(number)
        num = number

print(new_list)