# ******************
# FIBONACCI ITERABLE
# ******************


### VERSION GENERANDO EL NUMERO
class Fibonacci:
    def __init__(self, numbers_to_generate: int):
        self.numbers_to_generate = numbers_to_generate
        self.calculated_numbers = 0
        self.a_value = 0
        self.b_value = 1

    def __iter__(self):
        return self

    def __next__(self):
        result = self.a_value
        self.a_value = self.b_value
        self.b_value = result + self.b_value
        self.calculated_numbers += 1
        if self.calculated_numbers > self.numbers_to_generate:
            raise StopIteration
        return result


def run(n: int):
    return list(Fibonacci(n))


# VERSION CON LISTA CONSTRUIDA
# class Fibonacci:
#    def __init__(self, numbers_to_generate: int):
#        a, b = 0, 1
#        self.numbers_to_generate = numbers_to_generate
#        self.fnumbers = [0, 1]
#        for _ in range(numbers_to_generate):
#            result = a + b
#            a = b
#            b = result
#            self.fnumbers.append(result)
#        self.calculated_numebrs = 0
#
#    def __iter__(self):
#        return self
#
#    def __next__(self):
#        if self.calculated_numebrs >= self.numbers_to_generate:
#            raise StopIteration
#        num = self.fnumbers[self.calculated_numebrs]
#        self.calculated_numebrs += 1
#        return num

# def run(n: int):
#    return list(Fibonacci(n))
