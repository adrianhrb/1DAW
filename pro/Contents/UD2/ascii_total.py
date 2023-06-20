entry = input("Dime algo: ")
num_chars = 0

for char in range(len(entry) + 1):
    num_chars += char
    
ascii_number = chr(num_chars)
print(f'La suma de los caracteres de "{entry}" es igual a {num_chars}, y el caracter ASCII que le corresponde es: {num_chars:03}: {ascii_number}')

