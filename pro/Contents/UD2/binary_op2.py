BIN_N = "1100"
length = len(BIN_N)
result = 0
for i in range(length):
    digit = int(BIN_N[i])
    exponent = length - i - 1
    partial_result = digit * 2**exponent
    result += partial_result
    print(f"{digit} * 2^{exponent} = {partial_result}")

print(f"Final result = {result}")