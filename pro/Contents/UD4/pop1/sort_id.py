# **********************************
# ORDENANDO IDS EN UNA BASE DE DATOS
# **********************************


def sort_id(db: list) -> list:
    sorted_db = db.copy()
    id = 0
    for info in sorted_db:
        id += 1
        info["id"] = id
    return sorted_db

