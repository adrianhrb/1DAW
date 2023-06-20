# ***************
# TUPLA DE DUPLAS
# ***************


def run(input: tuple) -> set:
    first_set, second_set = set(), set()
    output = (first_set, second_set)
    for item1, item2 in input:
        first_set.add(item1)
        second_set.add(item2)
    return output


if __name__ == '__main__':
    run(((4, 3), (8, 2), (7, 5), (8, 2), (9, 1)))

