# ****************
# SUMANDO MATRICES
# ****************
import filecmp
from pathlib import Path


def run(matrix1_path: Path, matrix2_path: Path) -> bool:
    m1_num = []
    m2_num = []
    sum = []
    str_sum = []
    with open (matrix1_path) as m1:
        for line in m1:
            numbers = line.strip().split(" ")
            matrix_len = len(numbers)
            for number in numbers:
                m1_num.append(int(number))

    with open (matrix2_path) as m2:
        for line in m2:
            numbers = line.strip().split(" ")
            for number in numbers:
                m2_num.append(int(number))
    
    for n1, n2 in zip(m1_num, m2_num):
        addition = n1+n2
        sum.append(str(addition))

    result_path = 'data/sum_matrix/result.dat'
    with open(result_path, "w") as result:
        count = 0
        for number in sum:
            count += 1
            if count == matrix_len:
                count=0
                result.write(number + "\n")
            else:
                result.write(number + " ")
        
    return filecmp.cmp(result_path, 'data/sum_matrix/.expected', shallow=False)


if __name__ == '__main__':
    run('data/sum_matrix/matrix1.dat', 'data/sum_matrix/matrix2.dat')