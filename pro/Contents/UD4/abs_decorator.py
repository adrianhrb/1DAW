# *******************************
# DECORANDO CON VALORES ABSOLUTOS
# *******************************


def fabs(func):
    def to_abs(*args):
        res = func(*args)
        return abs(res)
    return to_abs

@fabs
def fprod(a: int, b: int) -> int:
    return a * b


