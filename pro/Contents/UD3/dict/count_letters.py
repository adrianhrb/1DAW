# ***************
# CONTANDO LETRAS
# ***************


def run(sentence: str) -> dict:
    counter = {}
    for letter in sentence:
        counter[letter] = counter.get(letter, 0) + 1

    return counter


if __name__ == "__main__":
    run("boom")
