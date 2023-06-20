# *************
# SUMANDO FILAS
# *************
from pathlib import Path


def run(data_path: Path) -> tuple:
    """ result_sum = []
    with open(data_path, "r") as numbers:
        for line in numbers:
            result = 0
            line = line.strip().split()
            for number in line:
                result += int(number)
            result_sum.append(result)
            
    rsum = tuple(result_sum) """            

    result_sum = []
    with open(data_path, "r") as numbers:
        for row in numbers:
            numbers = [int(n) for n in row.strip().split()]
            sum_row = result_sum.append(sum(numbers))
    rsum = tuple(result_sum)
    return rsum


if __name__ == '__main__':
    run('data/sum_rows/data1.txt')