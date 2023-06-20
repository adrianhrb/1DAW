def find_items(items: tuple, target: int) -> int:
    """ Count the number that a target appear in a tuple
    :param items: a serie of numeric items
    :type items: tuple
    :param target: the target to count in the tuple
    :type target: int
    
    :return : The number of times that a target appears in the tuple
    :rtype: int """

    return sum([1 for number in items if number == target])