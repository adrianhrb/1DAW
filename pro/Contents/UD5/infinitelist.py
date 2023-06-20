class InfiniteList:
    def __init__(self, *args, fil_value=None):
        self.items = []
        for item in args:
            self.items.append(item)
        self.fil_value = fil_value

    def __getitem__(self, index_num: int):
        if index_num < len(self):
            return self.items[index_num]
        return f"La lista no tiene tantos elementos"

    def __len__(self):
        return len(self.items)

    def __setitem__(self, index: int, item):
        if index >= len(self):
            for _ in range(len(self), index + 1):
                self.items.append(self.fil_value)
        self.items[index] = item

    def __str__(self):
        return f"{self.items} con valor de relleno '{self.fil_value}'"


lista1 = InfiniteList(1, 2, fil_value="~~")
lista1[4] = 9
print(lista1)
print(len(lista1))
print(lista1[10])
