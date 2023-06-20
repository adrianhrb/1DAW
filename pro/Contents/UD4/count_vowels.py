# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************


""" def count_vowels(text:str, num_vowels = 0):
    VOWELS = "aeiou"
    if text[0] in VOWELS:
        num_vowels += 1
    if len(text) == 1:
        return num_vowels
    return count_vowels(text[1:], num_vowels) """

def count_vowels(text: str):
    VOWELS = "aeiou"
    if len(text) == 1:
        if text[0] in VOWELS:
            return 1
        return 0
    return count_vowels(text[0]) + count_vowels(text[1:])