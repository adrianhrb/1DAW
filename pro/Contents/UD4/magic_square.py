# ***************
# CUADRADO MÁGICO
# ***************


def line_sum(matrix: list) -> int:
    sum_register = sum(matrix[0])
    for line in matrix[1:]:
        if sum(line) != sum_register:
            return False
    return sum_register


def column_sum(matrix: list) -> int:
    sum_register = []
    for i in range(len(matrix)):
        column = 0
        for j in range(len(matrix[0])):
            column += matrix[j][i]
        sum_register.append(column)
    
    if sum(sum_register) // len(sum_register) == sum_register[0]:
        return sum_register[0]


def diagonal_sum(matrix: list) -> int:
    sum_register = 0
    for i in range(len(matrix)):
        sum_register += matrix[i][i]
    return sum_register


def inverse_diagonal_sum(matrix: list) -> int:
    sum_register = 0
    for i in range(len(matrix)):
        sum_register += matrix[i][len(matrix) - i - 1]
    return sum_register


def is_magic_square(matrix: list):
    if len(matrix) == 0:
        return True
    lines = line_sum(matrix)
    columns = column_sum(matrix)
    main_diagonal = diagonal_sum(matrix)
    inverse_diagonal = inverse_diagonal_sum(matrix)

    if lines == columns == main_diagonal == inverse_diagonal:
        return True
    
    return False

