entrada = input("Dime algo: ")
remove_target = "1234567890"
replacement_text = " ~#$%^&!@*():;"
corrected_text = ""

for char in entrada:
    if char in remove_target:
        new_char = char.replace(char, replacement_text)
        corrected_text += new_char
    else:
        corrected_text += char

print(corrected_text)