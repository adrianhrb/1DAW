from __future__ import annotations


class IntegerStack:
    """
    Pila de enteros:
    ╔═════╗
    ║ TOP ║
    ╠═════╣
    ║   4 ║
    ║   3 ║
    ║   5 ║
    ║   7 ║
    ╚═════╝
    """

    def __init__(self, *, max_size: int = 10):
        """Utilizar atributo items para guardar los elementos"""
        self.items = []
        self.max_size = max_size

    def push(self, item: int) -> bool:
        """Si la pila está llena retornar False, en otro caso retornar True"""
        if len(self.items) == self.max_size:
            return False
        self.items.insert(0, item)
        return True

    def pop(self) -> int:
        """Extraer el elemento que está en el TOP de la pila"""
        return self.items.pop(0)

    def top(self) -> int:
        """Devolver el elemento que está en el TOP de la pila (sin extracción)"""
        return self.items[0]

    def is_empty(self) -> bool:
        """Indica si la pila está vacía"""
        return len(self.items) == 0

    def is_full(self) -> bool:
        """Indica si la pila está llena -> max_size"""
        return len(self.items) == self.max_size

    def expand(self, factor: int = 2) -> None:
        """Expande el tamaño máximo de la pila en el factor indicado"""
        self.max_size *= factor

    def dump_to_file(self, path: str) -> None:
        """Vuelca la pila a un fichero.
        - Cada item en una línea.
        - El primer elemento del fichero corresponde con el TOP de la pila."""
        to_write = [str(num) for num in self.items]
        with open(path, "w") as f:
            f.write("\n".join(to_write))

    @classmethod
    def load_from_file(cls, path: str) -> IntegerStack:
        """Crea una pila desde un fichero.
        - Un item por línea.
        - El primer elemento del fichero corresponde con el TOP de la pila.
        - Si la pila se llena al ir añadiendo elementos habrá que expandir con los valores
        por defecto"""
        new_stack = IntegerStack()
        with open(path, "r") as f:
            for num in f:
                num = num.strip()
                if len(new_stack.items) >= new_stack.max_size:
                    new_stack.expand()
                new_stack.items.insert(0, int(num))
            new_stack.items = list(reversed(new_stack.items))
        return new_stack

    def __getitem__(self, index: int) -> int:
        """Devuelve el elemento de la pila en el índice indicado"""
        return self.items[index]

    def __setitem__(self, index: int, item: int) -> None:
        """Establece el valor de un elemento de la pila mediante el índice indicado"""
        self.items[index] = item

    def __len__(self):
        """Número de elementos que contiene la pila"""
        return len(self.items)

    def __str__(self):
        """Cada elemento en una línea distinta empezando por el TOP de la pila"""
        to_show = [str(num) for num in self.items]
        return "\n".join(to_show)

    def __add__(self, other: IntegerStack) -> IntegerStack:
        """Sumar dos pilas.
        - La segunda pila va "encima" de la primera
        - El tamaño máximo de la pila resultante es la suma de los tamaños
        máximos de cada pila."""
        added_stack = IntegerStack(max_size=self.max_size + other.max_size)
        down_stack = self.items
        upper_stack = other.items
        added_stack.items = upper_stack
        added_stack.items.extend(down_stack)
        return added_stack

    def __iter__(self) -> IntegerStackIterator:
        return IntegerStackIterator(self)


class IntegerStackIterator:
    def __init__(self, stack: IntegerStack):
        self.stack = stack
        self.pointer = 0

    def __next__(self) -> int:
        if self.pointer >= len(self.stack.items):
            raise StopIteration
        number = self.stack.items[self.pointer]
        self.pointer += 1
        return number


