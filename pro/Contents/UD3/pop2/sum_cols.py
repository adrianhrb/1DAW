# ****************
# SUMANDO COLUMNAS
# ****************
from pathlib import Path


def run(data_path: Path) -> tuple:
    
    all_rows = []
    with open(data_path, "r") as numbers:
        for line in numbers:
            line = line.strip().split()
            all_rows.append(line)
    
    sums = []
    for i in range(len(all_rows[1])):
        sum = 0
        for j in range(len(all_rows)):
            sum += int(all_rows[j][i])
        sums.append(sum)
        
    csum = tuple(sums)
    
    return csum


if __name__ == '__main__':
    run('data/sum_cols/data1.txt')