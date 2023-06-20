VERSION_MEMORY_CONSUMPTION = {1.0: 1, 1.5: 2, 2: 0.5}
DEFAULT_PROCESS_MEMORY_CONSUMPTION = {
    1.0: {"Xeyes": 0.8, "Cups": 1, "Calculator": 0.5},
    1.5: {"Xeyes": 1, "Cups": 1.5, "Calculator": 0.8},
    2.0: {"Xeyes": 0.3, "Cups": 0.5, "Calculator": 0.2},
}
OTHER_PROCESS_DEFAULT_CONSUPTION = 1


class Os:
    def __init__(
        self,
        kernel_name: str,
        filesystem: list,
        xserver: bool,
        computer_ram: int,
        version: float,
        processes: list,
        booted: bool = False,
    ):
        self.kernel_name = kernel_name
        self.filesystem = filesystem
        self.xserver = xserver
        self.available_ram = computer_ram
        self.version = version
        self.processes = processes
        self.processes_info = {process: "Stopped" for process in self.processes}
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

    def check_status(self, process_name):
        return self.processes_info[process_name]

    def run_process(self, process_name):
        if self.processes_info["process"] == "Stoped":
            if process_name in DEFAULT_PROCESS_MEMORY_CONSUMPTION[self.version]:
                process_consumption = DEFAULT_PROCESS_MEMORY_CONSUMPTION[self.version][
                    process_name
                ]
            else:
                process_consumption = OTHER_PROCESS_DEFAULT_CONSUPTION

            after_running_available_ram = self.available_ram - process_consumption
            if after_running_available_ram > 0:
                self.processes_info[process_name] = "Running"
                self.available_ram -= process_consumption
            else:
                return f"Si inicias dicho proceso la RAM se vería sobrecargada"

        else:
            return f"Process was already running"

    def kill_process(self, process_name: str):
        if self.processes_info["process"] == "Running":
            self.processes_info["process"] = "Stoped"
            self.available_ram += DEFAULT_PROCESS_MEMORY_CONSUMPTION[self.version][
                process_name
            ]
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
