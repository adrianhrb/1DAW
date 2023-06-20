word = input("Dime algo: ")
seen_chars = []

for letter in word.lower():
    if letter.lower() in seen_chars:
        print("No es un isograma")
        break
    if letter:
        seen_chars.append(letter)
else:
    print("Es un isograma")
