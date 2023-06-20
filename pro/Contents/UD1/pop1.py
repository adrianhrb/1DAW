# ut1-pop1-ej1
a = 5
b = 7
# No tocar nada de aquí hacia arriba ↑
# ********************************************************

# ========================================================
# @@ Escribe tu código debajo de esta línea ↓
addition = a ** 2 + b ** 2
multip = a * b
r_quo = multip ** (1/2)
F = addition - r_quo
# $$ Escribe tu código encima de esta línea ↑
# ========================================================

# ********************************************************
# No tocar nada de aquí hacia abajo ↓
assert F == 68.08392021690038




# ut1-pop1-ej5
text = 'El Sistema Operativo que funcionará Libre y Gratuito'
# No tocar nada de aquí hacia arriba ↑
# ********************************************************

# ========================================================
# @@ Escribe tu código debajo de esta línea ↓
low_text = text.lower()
nospaces_text = low_text.replace(" ", "-")
normal_vowels = nospaces_text.replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u")

slug = normal_vowels

# $$ Escribe tu código encima de esta línea ↑
# ========================================================

# ********************************************************
# No tocar nada de aquí hacia abajo ↓
assert slug == 'el-sistema-operativo-que-funcionara-libre-y-gratuito' 






# ut1-pop1-ej2
number = 99
# No tocar nada de aquí hacia arriba ↑
# ********************************************************

# ========================================================
# @@ Escribe tu código debajo de esta línea ↓
binary_number = bin(number)
count_ones = binary_number.count("1")

# $$ Escribe tu código encima de esta línea ↑
# ========================================================

# ********************************************************
# No tocar nada de aquí hacia abajo ↓
assert count_ones == 4