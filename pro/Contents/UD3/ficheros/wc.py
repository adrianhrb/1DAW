# ****************
# CONTANDO COMO WC
# ****************
from pathlib import Path


def run(input_path: Path) -> tuple:
    num_lines = 0
    num_words = 0
    num_bytes = 0

    with open(input_path, "r") as f:
        for line in f:
            num_bytes += len(line.encode('utf-8'))
            num_lines += 1
            words = line.split()
            for word in words:
                    num_words += 1

    return num_lines, num_words, num_bytes


if __name__ == '__main__':
    run('data/wc/lorem.txt')