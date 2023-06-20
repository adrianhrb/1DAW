# Examen XQuery

### 1. Escribe una consulta en XQuery para obtener todos los títulos de las películas en inglés.

```
for $pelicula in /libreria/pelicula
where $pelicula/titulo/@idioma = 'en'
return $pelicula/titulo
```

### 2. Encuentra la cantidad de películas en la categoría "Acción".

```
count(for $pelicula in /libreria/pelicula
where $pelicula/género = 'Acción'
return $pelicula)
```

### 3. Obtén el título y el director de la película más reciente.

```
let $reciente := max(/libreria/pelicula/año)
for $pelicula in /libreria/pelicula
where $pelicula/año = $reciente
return <info>
<titulo>{$pelicula/titulo/text()}</titulo>
<director>{$pelicula/director/text()}</director>
</info>
```

### 4. Encuentra todas las películas que tengan una duración superior a 120 minutos.

```
for $pelicula in /libreria/pelicula
where $pelicula/duración > 120
return $pelicula
```

### 5. Escribe una consulta para calcular el precio promedio de todas las películas.

```
let $avg := avg(/libreria/pelicula/precio)
return $avg
```

### 6. Obtén el título de la película más cara.

```
let $max := max(/libreria/pelicula/precio)
for $pelicula in /libreria/pelicula
where $pelicula/precio = $max
return $pelicula/titulo
```

### 7. Encuentra todas las películas dirigidas por Christopher Nolan.

```
for $pelicula in /libreria/pelicula
where $pelicula/director = 'Christopher Nolan'
return $pelicula
```

### 8. Obtén el título y el año de lanzamiento de las películas que fueron lanzadas después de 2010 y tienen un precio inferior a 15.

```
for $pelicula in /libreria/pelicula
where $pelicula/año > 2010 and $pelicula/precio < 15
return
<info>
<titulo>{$pelicula/titulo/text()}</titulo>
<año>{$pelicula/año/text()}</año>
</info>
```

### 9. Encuentra el director de la película cuyo título es "Avengers: Endgame".

```
for $pelicula in /libreria/pelicula
where $pelicula/titulo = 'Avengers: Endgame'
return $pelicula/director
```

### 10. Escribe una consulta para obtener todas las películas en orden alfabético según su título.

```
for $pelicula in /libreria/pelicula
order by $pelicula/titulo
return $pelicula
```

### 11. Encuentra todas las películas cuyo título comienza con la letra "L".

```
for $pelicula in /libreria/pelicula
where starts-with($pelicula/titulo, 'L')
return $pelicula
```

### 12. Obtén el número total de películas en la librería.

```
count(for $pelicula in /libreria/pelicula
return $pelicula)
```

### 13. Encuentra la película con la duración más larga y muestra su título, duración y año de lanzamiento.

```
let $max := max(/libreria/pelicula/duración)
for $pelicula in /libreria/pelicula
where $pelicula/duración = $max
return
<info>
<titulo>{$pelicula/titulo/text()}</titulo>
<duración>{$pelicula/duración}</duración>
<año>{$pelicula/año}</año>
</info>
```

### 14. Calcula el precio total de todas las películas en la librería y muestra el resultado.

```
sum(for $precio in /libreria/pelicula/precio
return $precio)
```

### 15. Encuentra todos los géneros distintos presentes en la librería y muestra la cantidad de películas para cada género.

```
for $género in /libreria/pelicula/género
return distinct-values($género)
```

```
for $pelicula in /libreria/pelicula
let $genero := count($pelicula/género)
return
<info>
<género>{$pelicula/género}</género>
<peliculas>{$genero}</peliculas>
</info>
```

### 16. Crea una variable que almacene el número total de películas en la librería. Luego, muestra el título y el precio de las películas cuyo precio es mayor que el promedio de todos los precios.

```
let $total := count(/libreria/pelicula)
```

```
let $avg := avg(/libreria/pelicula/precio)
for $pelicula in /libreria/pelicula
where $pelicula/precio > $avg
return
<info>
<titulo>{$pelicula/titulo/text()}</titulo>
<precio>{$pelicula/precio/text()}</precio>
</info>
```

### 17. Escribe una consulta para encontrar el género con la película más corta y muestra el título y la duración de esa película.

```
let $min := min(/libreria/pelicula/duración)
for $pelicula in /libreria/pelicula
where $pelicula/duración = $min
return
<info>
<titulo>{$pelicula/titulo/text()}</titulo>
<dura>{$pelicula/duración/text()}</dura>
</info>
```

### 18. Encuentra todas las películas cuyo título contiene la palabra "der" y muestra el título y el director.

```
for $pelicula in /libreria/pelicula
where contains($pelicula/titulo, 'der')
return
<info>
<titulo>{$pelicula/titulo/text()}</titulo>
<director>{$pelicula/director/text()}</director>
</info>
```

### 19. Escribe una consulta para obtener el título y el director de las tres películas más recientes en orden descendente de año de lanzamiento.

```
let $min := min(/libreria/pelicula/año)
for $pelicula in /libreria/pelicula
order by $pelicula/año descending
return
<info>
<dir>{$pelicula/director/text()}</dir>
<titulo>{$pelicula/titulo/text()}</titulo>
</info>
```

### 20. Encuentra todos los directores que han dirigido películas en más de un género y muestra el nombre de cada director junto con los géneros en los que ha trabajado.
