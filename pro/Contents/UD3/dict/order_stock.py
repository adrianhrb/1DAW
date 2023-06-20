# ***********
# ¿HAY STOCK?
# ***********


def run(stock: dict, merch: str, amount: int) -> bool:
    item_stock = stock.get(merch, 0)
    available = item_stock >= amount
    """ if item_stock == None or amount > item_stock:
        available = False """

    return available


if __name__ == "__main__":
    run({"pen": 20, "cup": 11, "keyring": 40}, "cup", 9)
