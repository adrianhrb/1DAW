from __future__ import annotations


def load_card_glyphs(path: str = "cards.dat") -> dict[str, str]:
    """Retorna un diccionario donde las claves serán los palos
    y los valores serán cadenas de texto con los glifos de las
    cartas sin ningún separador"""
    cards_info = {}
    with open(path, "r") as f:
        for line in f:
            suit, cards = line.strip().split(":")
            cards_info[suit] = "".join(cards.split(","))
    return cards_info


class Card:
    CLUBS = "♣"
    DIAMONDS = "◆"
    HEARTS = "❤"
    SPADES = "♠"
    #           1,   2,   3,   4,   5,   6,   7,   8,   9,   10,  11,  12,  13
    SYMBOLS = ("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")
    A_VALUE = 1
    K_VALUE = 13
    GLYPHS = load_card_glyphs()
    FIGURES_VALUE_TO_COMPARE = {"A": 14, "J": 11, "Q": 12, "K": 13}

    def __init__(self, value: int | str, suit: str):
        """Notas:
        - Si el suit(palo) no es válido hay que elevar una excepción de tipo
        InvalidCardError() con el mensaje: 🃏 Invalid card: {repr(suit)} is not a supported suit
        - Si el value(como entero) no es válido (es menor que 1 o mayor que 13) hay que
        elevar una excepción de tipo InvalidCardError() con el mensaje:
        🃏 Invalid card: {repr(value)} is not a supported value
        - Si el value(como string) no es válido hay que elevar una excepción de tipo
        🃏 Invalid card: {repr(value)} is not a supported symbol

        - self.suit deberá almacenar el palo de la carta '♣◆❤♠'.
        - self.value deberá almacenar el valor de la carta (1-13)"""
        self.value = Card.to_check_value(value)
        self.suit = Card.to_check_suit(suit)

    @staticmethod
    def to_check_value(value: int | str):
        if isinstance(value, int):
            if value not in range(Card.A_VALUE, Card.K_VALUE + 1):
                raise InvalidCardError(f"{repr(value)} is not a supported value")
            else:
                return value
        else:
            if value not in Card.SYMBOLS:
                raise InvalidCardError(f"{repr(value)} is not a supported symbol")
            else:
                return value

    @staticmethod
    def to_check_suit(suit: str):
        if suit not in (Card.CLUBS, Card.DIAMONDS, Card.HEARTS, Card.SPADES):
            raise InvalidCardError(f"{repr(suit)} is not a supported suit")
        return suit

    @property
    def cmp_value(self) -> int:
        """Devuelve el valor (numérico) de la carta para comparar con otras.
        Tener en cuenta el AS."""
        if isinstance(self.value, str):
            try:
                card_value = int(self.value)
            except ValueError:
                card_value = Card.FIGURES_VALUE_TO_COMPARE[self.value]
        else:
            card_value = (
                self.value
                if self.value != Card.A_VALUE
                else Card.FIGURES_VALUE_TO_COMPARE["A"]
            )
        return card_value

    def __repr__(self):
        """Devuelve el glifo de la carta"""
        card_position = self.cmp_value if self.cmp_value < 14 else Card.A_VALUE
        return Card.GLYPHS[self.suit][card_position - 1]

    def __eq__(self, other: Card | object):
        """Indica si dos cartas son iguales"""
        if isinstance(other, Card):
            if repr(self) == repr(other):
                return True
            return False
        return False

    def __lt__(self, other: Card):
        """Indica si una carta vale menos que otra"""
        if self.cmp_value < other.cmp_value:
            return True
        return False

    def __gt__(self, other: Card):
        """Indica si una carta vale más que otra"""
        if self.cmp_value > other.cmp_value:
            return True
        return False

    def __add__(self, other: Card) -> Card:
        """Suma de dos cartas:
        1. El nuevo palo será el de la carta más alta.
        2. El nuevo valor será la suma de los valores de las cartas. Si valor pasa
        de 13 se convertirá en un AS."""
        if self > other:
            new_suit = self.suit
        else:
            new_suit = other.suit
        new_value = (
            self.cmp_value + other.cmp_value
            if self.cmp_value + other.cmp_value <= Card.K_VALUE
            else Card.A_VALUE
        )
        return Card(new_value, new_suit)

    def is_ace(self) -> bool:
        """Indica si una carta es un AS"""
        return self.cmp_value == 14

    @classmethod
    def get_available_suits(cls) -> str:
        """Devuelve todos los palos como una cadena de texto"""
        suit_list = list(load_card_glyphs().keys())
        return "".join(suit_list)

    @classmethod
    def get_cards_by_suit(cls, suit: str):
        """Función generadora que devuelve los glifos de las cartas por su palo"""
        for card in Card.GLYPHS[suit]:
            yield card


class InvalidCardError(Exception):
    """Clase que representa un error de carta inválida.
    - El mensaje por defecto de esta excepción debe ser: 🃏 Invalid card
    - Si se añaden otros mensajes aparecerán como: 🃏 Invalid card: El mensaje que sea"""

    def __init__(self, message: str = ""):
        self.message = (
            "🃏 Invalid card" if message == "" else f"🃏 Invalid card: {message}"
        )
        super().__init__(self.message)

    def __str__(self) -> str:
        return self.message
