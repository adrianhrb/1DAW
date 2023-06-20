# De forma ordenada en la lista tal que: consumo por operación, consumo por apagar y consumo por encender
battery_mobiles_info = {
    "Samsung": [1, 2, 5],
    "Iphone": [2, 3, 6],
    "Huawei": [1, 1, 2],
    "Alcatel": [1, 1, 1],
}


class MobilePhone:
    def __init__(
        self,
        manufacturer: str,
        screen_size: float,
        num_cores: int,
        apps: list = ["Galería", "Notas", "Reloj"],
        status: bool = False,
        battery: int = 100,
    ):
        self.manufacturer = manufacturer
        self.screen_size = screen_size
        self.num_cores = num_cores
        self.apps = apps
        self.status = status
        self.battery = battery

    def switch_power(self):
        self.battery = not self.battery
        if self.status:
            self.battery -= battery_mobiles_info[self.manufacturer][2]
        else:
            self.battery -= battery_mobiles_info[self.manufacturer][1]

    def install_app(self, *apps: tuple[str]):
        if not self.status:
            return False
        if self.battery <= 0:
            return False
        for app in apps:
            if app not in self.apps:
                self.apps.append(app)
                self.battery -= battery_mobiles_info[self.manufacturer][0]

    def uninstall_app(self, *apps: tuple[str]):
        if not self.status:
            return False
        if self.battery <= 0:
            return False
        for app in apps:
            if app in self.apps:
                self.apps.remove(app)
                self.battery -= battery_mobiles_info[self.manufacturer][0]

    def recharge_battery(self, charge: int):
        new_charge = max(100, self.battery + charge)
        self.battery = new_charge
