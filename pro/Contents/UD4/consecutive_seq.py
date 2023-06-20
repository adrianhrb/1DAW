# **************************************************
# IDENTIFICANDO SECUENCIAS CONSECUTIVAS DE UN TAMAÑO
# **************************************************

#[1, 74, 56, 56, 56, 332, 8, 8, 8]


def consecutive_seq(items: list, targe_count: int, counter = 1) -> int | bool:
    if len(items) <= 1:
        return False
    to_analize_item = items[0]
    next_item = items[1]
    if to_analize_item == next_item:
        counter += 1
        if counter == targe_count:
            return to_analize_item
    return consecutive_seq(items[1:], targe_count, counter)

""" 

    fitem = items[0]
    repetitions = 1
    for num in items[1:]:
        if num == fitem:
            repetitions += 1
            if repetitions >= target_count:
                return num
        else:
            fitem = num

    return False
 """