# ********************
# DESCIFRANDO CIUDADES
# ********************


def run(cinfo: str) -> dict:
    """separated_cities = cinfo.split(";")
    string_separated_cities = ":".join(separated_cities)
    elements = string_separated_cities.split(":")
    cities_list = []
    poblation_list = []
    cities = {}

    for item in range(len(elements)):
        if item % 2 != 0:
            poblation_list.append(elements[item])
        else:
            cities_list.append(elements[item])

    for citie, pob in zip(cities_list, poblation_list):
        cities[citie] = int(pob)""" ""

    separated_cities = cinfo.split(";")
    cities = {}
    for item in separated_cities:
        city, population = item.split(":")
        cities[city] = int(population)
    return cities


if __name__ == "__main__":
    run("Tokyo:38_140_000;Delhi:26_454_000;Shanghai:24_484_000;Mumbai:21_357_000")
