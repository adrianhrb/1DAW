# **********
# HISTOGRAMA
# **********
import filecmp
from pathlib import Path


def run(data_path: Path) -> bool:
    distinct_letters = []
    counter_list = []
    with open(data_path, "r") as text:
        letter_text = text.read()
        for letter in letter_text:
            if letter not in distinct_letters:
                distinct_letters.append(letter)
        distinct_letters = sorted(distinct_letters)
        for letter in distinct_letters:
            counter = list(letter_text).count(letter)
            counter_list.append(counter)

    
    histogram_path = 'data/histogram/histogram.txt'
    with open(histogram_path, "w") as result:
        item = "█"
        for letter,counter in zip(distinct_letters, counter_list):
            insert = item * counter
            result.write(f'{letter} {insert} {counter}\n')
    

    return filecmp.cmp(histogram_path, 'data/histogram/.expected', shallow=False)


if __name__ == '__main__':
    run('data/histogram/data.txt')

