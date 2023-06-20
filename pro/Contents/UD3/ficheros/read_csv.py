# ********************
# LEYENDO FICHEROS CSV
# ********************
from pathlib import Path


def run(datafile: Path) -> list:
    data = []
    
    with open(datafile, "r") as d:
        keys = d.readline().strip().split(",")
        for line in d:
            elements = line.strip().split(",")
            pokemon = {}
            for key, element in zip(keys, elements):
                if element.isdigit():
                    element = int(element)
                elif element == "True":
                    element = True
                elif element == "False":
                    element = False
                pokemon[key] = element
            data.append(pokemon)
    return data


if __name__ == '__main__':
    run('data/read_csv/pokemon.csv')
