frase = input("Dime algo: ")
VOWELS = "aeiou"
nueva_frase = ""

for char in frase:
    if char.lower() in VOWELS:
        continue
    else:
        nueva_frase += char

print(nueva_frase)