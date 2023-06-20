VERSION_MEMORY_CONSUMPTION = {1.0: 1, 1.5: 2, 2: 0.5}
PROCESS_MEMORY_CONSUMPTION = {
    1.0: {"Xeyes": 0.8, "Cups": 1, "Calculator": 0.5},
    1.5: {"Xeyes": 1, "Cups": 1.5, "Calculator": 0.8},
    2.0: {"Xeyes": 0.3, "Cups": 0.5, "Calculator": 0.2},
}
# Aplicaciones ofrecidas por defecto para instalar
# con la capacidad de almacenamiento que ocupa descargar cada versión
# y cuanto ocuparía actualizarla
APPLICATIONS_OFFERED_TO_INSTALL = {
    "Visual": {"Version": {1.1: 20, 1.5: 17}, "Update": 5},
    "Atom": {"Version": {1.1: 10, 1.5: 15}, "Update": 2},
    "Git": {"Version": {1.1: 5, 1.5: 12}, "Update": 1},
}


class Os:
    def __init__(
        self,
        kernel: str,
        filesystem: list,
        xserver: bool,
        computer_ram: int,
        version: float,
        storage: int,
        processes: list = ["Xeyes", "Cups", "Calculator"],
        booted: bool = False,
    ):
        self.kernel = kernel
        self.filesystem = filesystem
        self.xserver = xserver
        self.available_ram = computer_ram
        self.version = version
        self.available_storage = storage
        self.installed_applications = {}
        self.processes = processes
        self.processes_info = {process: "Stopped" for process in processes}
        self.booted = booted

    @property
    def ip(self) -> str:
        ip_calc = str((len(self.filesystem) + len(self.processes)) * 53.765)
        final_ip = ""
        for i in range(0, len(ip_calc), 3):
            final_ip += f"{ip_calc[i - 3 : i]}."
        return final_ip

    def restore_os(self):
        self.available_ram = 0
        for process in self.processes_info:
            self.processes_info[process] = "Stoped"

    def switch_state(self):
        self.booted = not self.booted
        if self.booted:
            self.available_ram -= VERSION_MEMORY_CONSUMPTION[self.version]
        else:
            self.restore_os()

    def check_status(self, process_name: str):
        return self.processes_info["process_name"]

    def run_process(self, process_name: str):
        if self.processes_info["process"] == "Stoped":
            process_consumption = PROCESS_MEMORY_CONSUMPTION[self.version][process_name]
            after_running_available_ram = self.available_ram - process_consumption
            if after_running_available_ram >= 0:
                self.processes_info["process"] = "Running"
                self.available_ram -= process_consumption
            else:
                return f"No se puede lanzar el proceso, sobrecargaría la RAM del equipo"
        else:
            return f"Process was already running"

    def kill_process(self, process_name: str):
        if self.processes_info["process"] == "Running":
            self.processes_info["process"] = "Stoped"
            self.available_ram += PROCESS_MEMORY_CONSUMPTION[self.version][process_name]
        else:
            return f"Process was already stoped"

    def update_version(self):
        match self.version:
            case 1.0:
                self.version = 1.5
                self.restore_os()
            case 1.5:
                self.version = 2.0
                self.restore_os()
            case _:
                return f"Tiene la versión más reciente"

    def install_app(self, app_name, version):
        if app_name not in self.installed_applications:
            if app_name in APPLICATIONS_OFFERED_TO_INSTALL:
                required_space = APPLICATIONS_OFFERED_TO_INSTALL[app_name]["Version"][
                    version
                ]
                if required_space <= self.available_storage:
                    self.installed_applications[app_name] = version
                    self.available_storage -= required_space
                else:
                    return f"No hay suficiente espacio en el equipo"
            else:
                self.installed_applications[app_name] = 1.0
                self.available_storage -= 20
        else:
            return f"La aplicación ya está en el equipo"

    def uninstall_app(self, app_name, version, keep_configuration=False):
        if app_name in self.installed_applications:
            if not keep_configuration:
                self.available_storage += APPLICATIONS_OFFERED_TO_INSTALL[app_name][
                    "Version"
                ][self.installed_applications[app_name]]
            else:
                self.available_storage += (
                    APPLICATIONS_OFFERED_TO_INSTALL[app_name]["Version"][
                        self.installed_applications[app_name]
                    ]
                    * 0.75
                )
        del self.installed_applications[app_name]

    def update_app(self, app_name):
        if app_name in self.installed_applications:
            if self.installed_applications[app_name] == 1.1:
                required_space = APPLICATIONS_OFFERED_TO_INSTALL[app_name]["Update"]
                if required_space <= self.available_storage:
                    self.available_storage -= required_space
                    self.installed_applications[app_name] = 1.5
            else:
                return f"Ya tienes la versión más reciente de esa aplicación"
        else:
            return "La aplicación no está instalada"
