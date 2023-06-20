entry = input("Dime algo: ")
result = 0

for char in entry:
    letter_number = ord(char)
    media = letter_number / len(entry)
    result += media
print(result)