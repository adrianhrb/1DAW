# *****************
# SUMA DE COCIENTES
# *****************


def sum_quot(n: int) -> float:
    k = 1/n
    if n == 1:
        return k
    return  k + sum_quot(n - 1)
    

