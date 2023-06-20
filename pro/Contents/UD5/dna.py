from __future__ import annotations


class DNA:
    ADENINE = "A"
    THYMINE = "T"
    CYTOSINE = "C"
    GUANINE = "G"

    @classmethod
    def build_from_file(cls, Path: str):
        with open(Path, "r") as f:
            sequence = f.readline()
        return cls(sequence)

    def __init__(self, dna_sequence: str):
        self.sequence = dna_sequence.upper()
        self.adenines = self.adenine_calculator
        self.thymines = self.thymine_calculator
        self.cytosines = self.cytosine_calculator
        self.guanines = self.guanine_calculator

    def __str__(self):
        return f"{self.sequence}"

    @property
    def adenine_calculator(self):
        return self.sequence.count(DNA.ADENINE)

    @property
    def thymine_calculator(self):
        return self.sequence.count(DNA.THYMINE)

    @property
    def cytosine_calculator(self):
        return self.sequence.count(DNA.CYTOSINE)

    @property
    def guanine_calculator(self):
        return self.sequence.count(DNA.GUANINE)

    def __add__(self, other: DNA):
        resultant_sequence = ""
        for self_value, other_value in zip(self.sequence, other.sequence):
            resultant_sequence += max(self_value, other_value)
        if len(self.sequence) != len(other.sequence):
            longer_sequence = max(self.sequence, other.sequence)
            lenght_differente = abs(len(other.sequence) - len(self.sequence))
            resultant_sequence += longer_sequence[lenght_differente:]
        return DNA(resultant_sequence)

    def __mul__(self, other: DNA):
        resultant_sequence = ""
        for self_value, other_value in zip(self.sequence, other.sequence):
            resultant_sequence += self_value if self_value == other_value else ""
        return DNA(resultant_sequence)

    def stats(self):
        sequence_lenght = len(self.sequence)
        a_percentaje = (self.adenine_calculator / sequence_lenght) * 100
        g_percentaje = (self.guanine_calculator / sequence_lenght) * 100
        c_percentaje = (self.cytosine_calculator / sequence_lenght) * 100
        t_percentaje = (self.thymine_calculator / sequence_lenght) * 100
        stats_info = {
            DNA.ADENINE: a_percentaje,
            DNA.GUANINE: g_percentaje,
            DNA.CYTOSINE: c_percentaje,
            DNA.THYMINE: t_percentaje,
        }
        return stats_info

    def __len__(self):
        return len(self.sequence)

    def dump_to_file(self, Path: str):
        with open(Path, "w") as f:
            f.write(self.sequence)

    def __getitem__(self, index: int):
        return self.sequence[index]

    def __setitem__(self, index: int, new_base: str):
        accepted_bases = [DNA.ADENINE, DNA.GUANINE, DNA.CYTOSINE, DNA.THYMINE]
        if new_base not in accepted_bases:
            matraca = list(self.sequence)
            matraca[index] = DNA.ADENINE
            self.sequence = "".join(matraca)
        else:
            matraca = list(self.sequence)
            matraca[index] = new_base
            self.sequence = "".join(matraca)
