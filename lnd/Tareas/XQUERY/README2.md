# Ejercicio 2 [XML](ejemplo3.xml):

1. Mostrar los títulos de los libros con la etiqueta "titulo":

```
for $book in /bookstore/book/title
return $book/text()
```

2. Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath:

```
for $book in /bookstore/book
where $book/price <= 30
return $book
```

```
for $book in /bookstore/book[price<=30]
return $book
```

3. Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30:

```
for $book in /bookstore/book
where $book/price <= 30
return $book/title
```

4. Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30:

```
for $book in /bookstore/book
where $book/price <= 30
return $book/title/text()
```

5. Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005":

```
for $book in /bookstore/book
where $book/year = 2005
return
<lib2005>
  <titulo>{$book/title/text()}</titulo>
  <autor>{$book/author/text()}</autor>
</lib2005>
```

6. Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion":

```
for $book in /bookstore/book/year/text()
return <publicacion>{$book}</publicacion>
```

```
let $año := /bookstore/book/year/text()
return <publicacion>{$año}</publicacion>
```

7. Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.

```
for $book in /bookstore/book
order by $book/@category and $book/title
return $book
```

8. Mostrar cuántos libros hay, y etiquetarlo con "total".

```
<total>{count (for $book in /bookstore/book/title
return $book)}</total>
```

9. Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.

```
let $total := count (/bookstore/book/title)
let $titles := (/bookstore/book/title/text())
return
<info>
  <titulo>{$titles}</titulo>
  <total>{$total}</total>
</info>
```

10. Mostrar el precio mínimo y máximo de los libros.

```
let $preciomin := min(/bookstore/book/price)
let $preciomax := max(/bookstore/book/price)
return <libro>
<min>{$preciomin}</min>
<max>{$preciomax}</max>
</libro>
```

11. Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.

```

```

12. Mostrar la suma total de los precios de los libros con la etiqueta "total".

```
<total>{sum(/bookstore/book/price)}</total>
```

13. Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.

```
<info>
  <libros>{bookstore/book/price}</libros>
  <total>{sum(bookstore/book/price)}</total>
</info>
```

14. Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.

```
for $book in /bookstore/book
return
<libro>
  <titulo>{$book/title/text()}</titulo>
  <autores>{count($book/author)}</autores>
</libro>
```

15. Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.

```
for $book in /bookstore/book
return <titulo>{$book/title/text()}({count($book/author)})</titulo>
```

16. Mostrar los libros escritos en años que terminen en "3".

```
for $book in /bookstore/book
where ends-with($book/year, '3')
return $book
```

17. Mostrar los libros cuya categoría empiece por "C".

```
for $book in /bookstore/book
where starts-with($book/@category, 'C')
return $book
```

18. Mostrar los libros que tengan una "X" mayúscula o minúscula en el título.

```
for $book in /bookstore/book/title
where contains($book, 'X') or  contains($book, 'x')
return $book/text()
```

19. Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.

```
for $book in /bookstore/book/title/text()
return
<info>
  <title>{$book}</title>
  <length>{string-length($book)}</length>
<info>
```

20. Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".

```

```

21. Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.

```
for $book in /bookstore/book/author
order by string-length($book)
return distinct-values($book)
```

22. Mostrar los títulos en una tabla de HTML.

```

```
