number = 35231
number_str = str(number)
number_list = list(number_str)
rev_check = []
for number in number_list:
    rev_check.append(int(number))
rev_digits = rev_check[::-1]