# ******************
# POBLACIÓN PROMEDIO
# ******************


def run(pdata: dict) -> dict:
    total_population = sum(pdata.values())
    avg_data = {}
    for city, population in pdata.items():
        avg_population = population * 100 / total_population
        rounded_population = round(avg_population, 3)
        avg_data[city] = rounded_population
    return avg_data


if __name__ == "__main__":
    run(
        {"Tokyo": 38140000, "Delhi": 26454000, "Shanghai": 24484000, "Mumbai": 21357000}
    )
