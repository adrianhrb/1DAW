# ********************
# LA PALABRA MÁS LARGA
# ********************
from pathlib import Path


def run(input_path: Path) -> str:
    with open (input_path, "r") as text:
        for line in text:
            words_list = line.strip().split(" ")
            longest_word = words_list[0]
            for word in words_list[1:]:
                if len(word) >= len(longest_word):
                    longest_word = word.strip(".,:;()")

    return longest_word


if __name__ == '__main__':
    run('data/longest_word/python.txt')