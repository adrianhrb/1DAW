# ***********************
# REEMPLAZO DE CARACTERES
# ***********************
import filecmp
from pathlib import Path


def run(input_path: Path, replacements: str) -> bool:
    replaced_text = ""
    r = replacements.split("|")
    with open(input_path, "r") as text:
        for line in text:
            new_text = line.replace(r[0][0], r[0][1]).replace(r[1][0], r[1][1]).replace(r[2][0], r[2][1]).replace(r[3][0], r[3][1]).replace(r[4][0], r[4][1])
            replaced_text += new_text

    
    output_path = 'data/replace_chars/r_noticia.txt'
    with open (output_path, "w") as result:
        result.write(replaced_text)
    

    return filecmp.cmp(output_path, 'data/replace_chars/.expected', shallow=False)


if __name__ == '__main__':
    run('data/replace_chars/noticia.txt', 'áa|ée|íi|óo|úu')