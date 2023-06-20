# *************************
# BUSCANDO PALABRAS COMUNES
# *************************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    with open(input_path, "r") as text:
        sentences = [line.lower().strip().split() for line in text]

    n_common_sequence = []
    for sentence1 in sentences:
        set1 = set(sentence1)
        for sentence2 in sentences:
            set2 = set(sentence2)
            n_common_sequence.append(len(set1 & set2))
            
    output_path = 'data/common_words/output.txt'
    with open(output_path, "w") as result:
        for n in n_common_sequence:
            result.write(f'{n}\n')

    return filecmp.cmp(output_path, 'data/common_words/.expected', shallow=False)


if __name__ == '__main__':
    run('data/common_words/minizen.txt')