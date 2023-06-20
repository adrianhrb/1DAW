# ************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO
# ************************************


def factorial(n):
    res = 1
    if n < 0:
        return None
    else:
        for i in range(1,n + 1):
            res = res * i
        return res
