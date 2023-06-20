entry = [0, 10, [20, 30], 40, 50, [60, 70, 80], [90, 100, 110, 120]]
flattened_list = []

"""for number in entry:
    if type(number) == list:
        for num in number:
            flattened_list.append(num)
    else:
        flattened_list.append(number)"""

for number in entry:
    if type(number) == list:
        flattened_list.extend(number)
    else:
        flattened_list.append(number)

print(flattened_list)