# *****************
# NÚMEROS PERFECTOS
# *****************


def is_perfect(n: int):
    def divisors(n: int):
        return (num for num in range(1, n) if n % num == 0)
    return sum(divisors(n)) == n 
