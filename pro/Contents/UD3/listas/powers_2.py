exponent_number = 5
exponent_results_list = []
base = 2

"""for num in range(exponent_number + 1):
    result = base**num
    exponent_results_list.append(result)

print(exponent_results_list)"""

exponent_results_list = [base**num for num in range(exponent_number + 1)]
print(exponent_results_list)