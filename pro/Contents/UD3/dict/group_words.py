# ******************
# AGRUPANDO PALABRAS
# ******************


def run(words: list) -> dict:
    group_words = {}
    for word in words:
        first_char = word[0]
        if first_char not in group_words:
            group_words[first_char] = [word]
        else:
            group_words[first_char].append(word)

    return group_words


if __name__ == "__main__":
    run(
        [
            "mesa",
            "móvil",
            "barco",
            "coche",
            "avión",
            "bandeja",
            "casa",
            "monitor",
            "carretera",
            "arco",
        ]
    )
