# Definimos el valor de la función
quad = 1
lin = 6
ind = 3

# Rango de búsqueda
dist = 9

# La función en x = 0 vale "ind"
min_fun = ind

# Cálculo

for x in range(-dist, dist + 1):
    fun = quad * x**2 + lin * x + ind
    if fun < min_fun: #Ordenamos que si el resultado es menor que min_fun, defina las variables. De esta forma, va a probar resultados hasta alcanzar el mínimo, ya que a partir de este empezará a dar resultados mayores
        min_fun = fun
        min_x = x

print(f"El mínimo se consigue con x = {min_x} y su resultado es f = {min_fun}")
