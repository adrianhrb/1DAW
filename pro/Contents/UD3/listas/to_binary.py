number = 11
binary_list = []

"""while number != 0:
    bin_number = number % 2
    number -= (number // 2) + (number % 2)
    if bin_number == 0:
        binary_list.append(0)
    else:
        binary_list.append(1)"""
while number != 0:
    bin_number = number % 2
    number -= (number // 2) + (number % 2)
    binary_list.append(bin_number)

real_binary = list(reversed(binary_list))
string = [str(num) for num in real_binary]
final_res = "".join(string)
print(final_res)