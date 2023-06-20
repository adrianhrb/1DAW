LINE_SIZE = 5
INITIAL_CODE = 33
FINAL_CODE = 127
lines = ""
num_char = 0
for code in range(INITIAL_CODE, FINAL_CODE + 1):
    ascii_num = chr(code)
    num_char += 1
    lines += f"{code:03}:{ascii_num} "
    # Desplazamiento modular
    if num_char % LINE_SIZE == 0:
        lines += "\n"

print(lines)
