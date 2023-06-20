# *******************
# CONSONANTES COMUNES
# *******************


def run(text1: str, text2: str) -> str:
    #Opción 1
    """ restricted_chars = "aeiou "
    cons_set = {char for char in text1 if char not in restricted_chars and char in text2}
    cconst = "".join(sorted(cons_set)) """

    #Opción 2
    NOT_VALID_CHARS = set("aeiouAEIOU ")
    resultant_set = set(text1) & set(text2) - NOT_VALID_CHARS
    cconst = "".join(sorted(resultant_set))
    return cconst


if __name__ == '__main__':
    run('Flat is better than nested', 'Readability counts')