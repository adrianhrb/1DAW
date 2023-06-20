class Fraction:
    def __init__(self, num: int, den: int) -> None:
        self.numerator = num
        self.denominator = den

    @staticmethod
    def gcd(a: int, b: int) -> int:
        """Algoritmo de Euclides para el cálculo del Máximo Común Divisor."""
        while b > 0:
            a, b = b, a % b
        return a

    def __add__(self, other_fraction):
        new_numerator = (self.numerator * other_fraction.denominator) + (
            self.denominator * other_fraction.numerator
        )
        new_denominator = self.denominator * other_fraction.denominator

        greatest_common_divisor = self.gcd(new_numerator, new_denominator)

        simplified_numerator = new_numerator // greatest_common_divisor
        simplified_denominator = new_denominator // greatest_common_divisor

        return Fraction(simplified_numerator, simplified_denominator)

    def __sub__(self, other_fraction):
        new_numerator = (self.numerator * other_fraction.denominator) - (
            self.denominator * other_fraction.numerator
        )
        new_denominator = self.denominator * other_fraction.denominator

        greatest_common_divisor = self.gcd(new_numerator, new_denominator)

        simplified_numerator = new_numerator // greatest_common_divisor
        simplified_denominator = new_denominator // greatest_common_divisor

        return Fraction(simplified_numerator, simplified_denominator)

    def __mul__(self, other_fraction):
        new_numerator = self.numerator * other_fraction.numerator
        new_denominator = self.denominator * other_fraction.denominator

        greatest_common_divisor = self.gcd(new_numerator, new_denominator)

        simplified_numerator = new_numerator // greatest_common_divisor
        simplified_denominator = new_denominator // greatest_common_divisor

        return Fraction(simplified_numerator, simplified_denominator)

    def __truediv__(self, other_fraction):
        new_numerator = self.numerator * other_fraction.denominator
        new_denominator = self.denominator * other_fraction.numerator

        greatest_common_divisor = self.gcd(new_numerator, new_denominator)

        simplified_numerator = new_numerator // greatest_common_divisor
        simplified_denominator = new_denominator // greatest_common_divisor

        return Fraction(simplified_numerator, simplified_denominator)

    def __str__(self):
        return f"{self.numerator}\n——\n{self.denominator}"


f1 = Fraction(25, 30)
f2 = Fraction(40, 45)
f3 = f1 + f2
f4 = f1 - f2
f5 = f1 * f2
f6 = f1 / f2

print(f6)
