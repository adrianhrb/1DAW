# ********************
# LA CLAVE ES LA CLAVE
# ********************


def run(items: dict) -> dict:
    fitems = {}
    for id, subjects in items.items():
        fix_id = id.replace(" ", "")
        fitems[fix_id] = subjects
    return fitems


if __name__ == "__main__":
    run({"S  001": ["Math", "Science"], "S    002": ["Math", "English"]})
