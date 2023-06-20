string_prototype = input("Dime algo: ")
alternative_case = ""
for char in string_prototype:
    if string_prototype.isnumeric():
        print("No afectados caracteres alfabéicos")
        break
    new_char = char.swapcase()
    alternative_case += new_char

print(alternative_case)