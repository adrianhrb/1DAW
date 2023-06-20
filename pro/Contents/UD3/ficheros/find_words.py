# ***********************************
# ¿DÓNDE ESTÁN LAS PALABRAS? MATARILE
# ***********************************
from pathlib import Path


def run(data_path: Path, target_word: str) -> list:
    line_counter = 0
    matches = []
    TRASH = ".,;:!¡()'"
    with open(data_path, "r") as song:
        for line in song:
            line_counter+=1
            char_pos = 1
            words_list = line.lower().strip().split()
            for word in words_list:
                if word.strip(TRASH) == target_word.lower():
                    a = len(word.lstrip(TRASH))
                    b = len(word)
                    delta = b-a
                    matches.append((line_counter, char_pos + delta))
                char_pos += len(word) + 1

    return matches


if __name__ == '__main__':
    run('data/find_words/bzrp.txt', 'persona')

