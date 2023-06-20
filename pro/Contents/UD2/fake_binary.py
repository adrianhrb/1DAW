digits_string = input("Dime una serie de nº: ")

change_0 = "01234"
change_1 = "56789"
resultant_string = ""

for digit in digits_string:
    if digit in change_0:
        replace_0 = digit.replace(digit, "0")
        resultant_string += replace_0
    else:
        replace_1 = digit.replace(digit, "1")
        resultant_string += replace_1

print(resultant_string)


