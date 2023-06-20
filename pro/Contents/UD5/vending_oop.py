# Suponemos que la maquina se construye llamando a la clase con el formato ['F19 4 10']
# representando producto, precio y stock.
E1 = "PRODUCT NOT FOUND"
E2 = "UNAVAILABLE STOCK"
E3 = "NOT ENOUGH USER MONEY"
E4 = "OPERATION NOT SUPPORTED"


class VendingMachine:
    def __init__(self, products: list, money: int):
        self.machine_info = VendingMachine.to_build_machine(products)
        self.money = money

    @staticmethod
    def to_build_machine(products: list) -> dict:
        machine_info = {}
        for product_info in products:
            product, product_amount, product_price = product_info.split()
            machine_info[product] = {
                "stock": int(product_amount),
                "price": int(product_price),
            }
        return machine_info

    def check_order(self, product: str, amount: int, user_money: int) -> bool | tuple:
        money_to_pay = self.machine_info[product]["price"] * amount
        if product in self.machine_info:
            if amount <= self.machine_info[product]["stock"]:
                if user_money >= money_to_pay:
                    return True
                return (False, E3)
            return (False, E2)
        return (False, E1)

    def to_manage_order(
        self, product: str, requested_amount: int, introduced_money: int
    ):
        check_order_correct = self.check_order(
            product, int(requested_amount), int(introduced_money)
        )
        if isinstance(check_order_correct, tuple):
            return check_order_correct[1]
        self.machine_info[product]["stock"] -= int(requested_amount)
        self.money += self.machine_info[product]["price"] * requested_amount
        return "Order finished"

    def to_manage_restock(self, product: str, amount: int) -> str:
        if product in self.machine_info:
            self.machine_info[product]["stock"] += amount
            return "Restock hecho con éxito"
        self.machine_info[product] = {"stock": amount, "price": 0}
        return "Se ha añadido el producto con precio 0"

    def to_manage_price_update(self, product: str, new_price: int) -> str:
        if product not in self.machine_info:
            return E1
        self.machine_info[product]["price"] = new_price
        return "Precio cambiado con éxito"

    def to_restock_money(self, money_to_add: int) -> str:
        self.money += money_to_add
        return "Dinero añadido"

    def to_manage_all_operations(self, operations: list):
        for operation in operations:
            order_type = operation.split()[0].upper()
            match order_type:
                case "O":
                    product, requested_amount, introduced_money = operation.split()[1:]
                    self.to_manage_order(
                        product, int(requested_amount), int(introduced_money)
                    )
                case "R":
                    product, amount = operation.split()[1:]
                    self.to_manage_restock(product, amount)
                case "P":
                    product, new_price = operation.split()[1:]
                    self.to_manage_price_update(product, int(new_price))
                case "M":
                    money_to_add = operation.split()[1]
                    self.to_restock_money(int(money_to_add))
                case _:
                    operations.remove(operation)

    def __str__(self):
        return f"La máquina tiene {self.money} monedas y sus productos son {self.machine_info}"


machine1 = VendingMachine(["D19 47 1", "D31 16 5", "F10 24 2", "F19 29 3"], 99)
operations = ["O D19 10 10", "R D50 5", "P D31 30", "M 1000"]
machine1.to_manage_all_operations(operations)
print(machine1)
