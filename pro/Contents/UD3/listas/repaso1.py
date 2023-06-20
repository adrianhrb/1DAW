num_list = [6, 3, 9, 2, 10, 31, 15, 7]
max_number = 0
for number in num_list[1:]:
    if number > max_number:
        max_number = number

print(max_number)