from __future__ import annotations

MONTHS_NAMES = {
    1: "ENERO",
    2: "FEBRERO",
    3: "MARZO",
    4: "ABRIL",
    5: "MAYO",
    6: "JUNIO",
    7: "JULIO",
    8: "AGOSTO",
    9: "SEPTIEMBRE",
    10: "OCTUBRE",
    11: "NOVIEMBRE",
    12: "DICIEMBRE",
}
DAYS_IN_WEEK = {
    1: "LUNES",
    2: "MARTES",
    3: "MIÉRCOLES",
    4: "JUEVES",
    5: "VIERNES",
    6: "SÁBADO",
    0: "DOMINGO",
}
MONTH_DAYS = {
    1: 31,
    2: {"leap": 29, "normal": 28},
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
}
MONTHS_WITH_31_DAYS = [1, 3, 5, 7, 8, 10, 12]
MONTHS_WITH_30_DAYS = [4, 6, 9, 11]


class Date:
    def __init__(self, day: int, month: int, year: int):
        """Validar día, mes y año. Se comprobará si la fecha es correcta
        (entre el 1-1-1900 y el 31-12-2050); si el día no es correcto, lo pondrá a 1;
        si el mes no es correcto, lo pondrá a 1; y si el año no es correcto, lo pondrá a 1900.
        Ojo con los años bisiestos."""
        if 1900 <= year <= 2050:
            self.year = year
        else:
            self.year = 1900
        if 0 < month <= 12:
            self.month = month
        else:
            self.month = 1
        self.day = Date.check_day_parameter(day, month, year)

    @staticmethod
    def check_day_parameter(day: int, month: int, year: int) -> int:
        match month:
            case 2:
                if Date.is_leap_year(year):
                    if 0 < day <= 29:
                        day = day
                    else:
                        day = 1
                else:
                    if 0 < day <= 28:
                        day = day
                    else:
                        day = 1
            case _:
                if month in MONTHS_WITH_30_DAYS:
                    if 0 < day <= 30:
                        day = day
                    else:
                        day = 1
                else:
                    if 0 < day <= 31:
                        day = day
                    else:
                        day = 1
        return day

    @staticmethod
    def is_leap_year(year: int) -> bool:
        condition1 = year % 4 == 0 and year % 100 != 0
        condition2 = year % 400 == 0
        if condition1 or condition2:
            return True
        return False

    def get_delta_days(self) -> int:
        """Número de días transcurridos desde el 1-1-1900 hasta la fecha"""
        days_counter = 0
        for year in range(1900, self.year):
            if Date.is_leap_year(year):
                days_counter += 366
            else:
                days_counter += 365
        for month in range(1, self.month):
            if month == 2:
                if Date.is_leap_year(self.year):
                    days_counter += 29
                else:
                    days_counter += 28
            else:
                if month in MONTHS_WITH_30_DAYS:
                    days_counter += 30
                else:
                    days_counter += 31
        days_counter += self.day

        return days_counter - 1

    @property
    def days_in_month(self) -> int:
        if Date.is_leap_year(self.year):
            if self.month == 2:
                return MONTH_DAYS[self.month]["leap"]
        if self.month == 2:
            return MONTH_DAYS[self.month]["normal"]
        return MONTH_DAYS[self.month]

    @property
    def weekday(self) -> int:
        day_of_week = self.get_delta_days()
        return (day_of_week + 1) % 7

    @property
    def is_weekend(self) -> bool:
        day_of_week = self.weekday
        if day_of_week == 6 or day_of_week == 0:
            return True
        return False

    @property
    def short_date(self) -> str:
        """02/09/2003"""
        return f"{self.day:02d}/{self.month:02d}/{self.year}"

    def __str__(self):
        """MARTES 2 DE SEPTIEMBRE DE 2003"""
        day_of_week = DAYS_IN_WEEK[self.weekday]
        month = MONTHS_NAMES[self.month]
        return f"{day_of_week} {self.day} DE {month} DE {self.year}"

    def __add__(self, days: int) -> Date:
        """Sumar un número de días a la fecha"""
        day = self.day
        month = self.month
        year = self.year
        for i in range(1, days + 1):
            day_check = (day + 1) % (self.days_in_month + 1)
            day = day_check
            if day_check == 0:
                day = 1
                self.month = self.month + 1
                month += 1
                if month > 12:
                    year += 1
                    self.year += 1
                    month = 1
                    self.month = 1
                    day = 1
        self.day = day
        self.month = month
        self.year = year
        return Date(day, month, year)

    def __sub__(self, other: Date | int) -> int | Date:
        """Dos opciones:
        1) Restar una fecha a otra fecha -> Número de días
        2) Restar un número de días la fecha -> Nueva fecha"""
        if isinstance(other, int):
            day = self.day
            month = self.month
            year = self.year
            for i in range(1, other + 1):
                day_check = (day - 1) % (self.days_in_month + 1)
                day = day_check
                if day_check == 0:
                    self.month = self.month - 1
                    month -= 1
                    if month < 1:
                        year -= 1
                        self.year -= 1
                        month = 12
                        self.month = 12
                        day = 31
                    day = self.days_in_month
            self.day = day
            self.month = month
            self.year = year
            return Date(day, month, year)
        elif isinstance(other, Date):
            return self.get_delta_days() - other.get_delta_days()

    def __eq__(self, other: Date) -> bool:
        if (
            self.day == other.day
            and self.month == other.month
            and self.year == other.year
        ):
            return True
        return False

    def __gt__(self, other: Date) -> bool:
        if self.year > other.year:
            return True
        if self.month > other.month:
            return True
        if self.day > other.day:
            return True
        return False

    def __lt__(self, other: Date) -> bool:
        if self.year < other.year:
            return True
        if self.month < other.month:
            return True
        if self.day < other.day:
            return True
        return False
