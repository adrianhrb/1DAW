# ******************************
# VALORES IGUALES EN DICCIONARIO
# ******************************


def run(items: dict) -> bool:
    for value in items.values():
        current_value = value
        break

    all_same = True
    for value in items.values():
        if value != current_value:
            all_same = False

    return all_same


if __name__ == "__main__":
    run({"a": 1, "b": 1, "c": 1, "d": 1})
