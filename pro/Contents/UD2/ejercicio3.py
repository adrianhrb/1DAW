import sys

import pycheck

CHECK_CASES = [
    [["AGTCCCAGGT"], "AGUCCCAGGU"],
    [["GCGCACTCTTCTTTGCTCTT"], "GCGCACUCUUCUUUGCUCUU"],
    [["CCGGAGATTGGCTACTGAAGATCCA"], "CCGGAGAUUGGCUACUGAAGAUCCA"],
]


def run(adn: str) -> str:
    timina = "T"
    uracilo = "U"
    arn = ""
    for char in adn:
        if char in timina:
            arn += uracilo
        else:
            arn += char
    return arn


if __name__ == "__main__":
    pycheck.check(run, CHECK_CASES, sys.argv)