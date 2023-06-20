# **********************
# FRECUENCIA DE PALABRAS
# **********************
from pathlib import Path


def run(input_path: Path, lower_bound: int) -> dict:
    freq = {}
    word_list = []
    with open(input_path, "r") as text:
        for line in text:
            strip_line = line.strip().split(" ")
            for word in strip_line:
                word_list.append(word.lower())
    longes_word = word_list[0]
    for word in word_list[1:]:
        counter = word_list.count(word)
        if counter >= lower_bound:
            freq[word] = counter


    return freq


if __name__ == '__main__':
    run('data/word_freq/cistercian.txt', 9)