entrada = "Supercalifragilisticoespialidoso"
vowels = "aeiou"
num_vowels = 0

for letter in entrada:
    if letter in vowels:
        num_vowels += 1

print(num_vowels)