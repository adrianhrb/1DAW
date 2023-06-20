# *******************
# CREANDO OPERACIONES
# *******************

def make_oper(oper: str):
    def calculator(num1: int, num2: int) -> float:
        match oper:
            case 'add':
                return num1 + num2
            case 'sub':
                return num1 - num2
            case 'mul':
                return num1 * num2
            case 'div':
                return num1 / num2
            case _:
                return None
    return calculator


def run(oper: str, num1: int, num2: int) -> float:
    operation = make_oper(oper)
    result = operation(num1, num2)
    return result



