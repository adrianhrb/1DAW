# *****************
# HAN CANTADO LÍNEA
# *****************
from pathlib import Path


def run(input_path: Path, line_no: int) -> str:
    line_counter = 0
    line = None
    with open(input_path, "r") as text:
        for line_t in text:
            line_counter += 1
            if line_counter == line_no:
                line = line_t.strip()
            
    return line


if __name__ == '__main__':
    run('data/get_line/nasdaq.txt', 20)