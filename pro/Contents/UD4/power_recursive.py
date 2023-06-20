# ******************
# POTENCIA RECURSIVA
# ******************



def power(x: int, n: int, result = 1) -> int:
    result *= x
    if n == 1:
        return result 
    if n == 0:
        return 1
    return power(x, n-1, result)
    
