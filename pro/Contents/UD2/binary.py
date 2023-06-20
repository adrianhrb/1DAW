BIN_N = "100101010001110001110"
result = 0
serial = 1

for digit in BIN_N:
    ndigit = int(digit)
    exponent = len(BIN_N) - serial
    result += ndigit * 2**exponent
    serial += 1

print(result)