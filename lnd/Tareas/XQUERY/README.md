# CONSULTAS XQUERY

- Ejercicio 1: [XML](ejemplo2.xml):

  1.  Muestra todos los bailes:

  ```
  for $baile in /bailes/baile
  return $baile/nombre/text()
  ```

  ```
  for $baile in /bailes/baile/nombre/text()
  return $baile
  ```

  2.  Muestra el nombre y precio de todos los bailes:

  ```
  for $baile in /bailes/baile
  return <baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
  </baile>
  ```

  3.  Muestra el nombre y precio de todos los bailes donde su precio es mayor que 40:

  ```
  for $baile in /bailes/baile
  where $baile/precio > 40
  return <bailes>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
  </bailes>
  ```

  4.  Mostrar los bailes ordenados por nombre:

  ```
  for $baile in /bailes/baile/nombre/text()
  order by $baile
  return $baile
  ```

  5.  Mostrar los nombres de los bailes que contienen una a:

  ```
  for $baile in /bailes/baile/nombre/text()
  where contains($baile, "a")
  return $baile
  ```

  6.  Mostrar el nombre de los bailes donde el apellido del profesor sea Lozano.

  ```
  for $baile in /bailes/baile
  where ends-with($baile/profesor, "Lozano")
  return $baile/nombre/text()
  ```

  7. Mostrar todos los bailes, excepto el 3 y 5:

  ```
  for $baile in /bailes/baile
  return <libro>{$baile/nombre/text() except $baile[@id = 3]/nombre/text() except $baile[@id = 5]/nombre/text()}</libro>
  ```

  8. Mostrar profesores que den clases de bailes por una cuota mensual:

  ```
  for $baile in /bailes/baile
  where $baile/precio/@cuota="mensual"
  return $baile/profesor
  ```

  9. Mostrar el nombre de los bailes de la sala 1, que se pague con euros y el precio sea menor a 35:

  ```
  for $baile in /bailes/baile
  where $baile/sala = 1 and $baile/precio < 35 and $baile/precio/@moneda = "euro"
  return $baile/nombre
  ```

  10. Obtener el precio del baile más caro:

  ```
  let $baile := /bailes/baile
  return <precio>{max($baile/precio)}</precio>
  ```

  11. Obtener el precio y el nombre del baile con el precio más caro.

  ```
  let $precio := max(/bailes/baile/precio)
  for $baile in /bailes/baile
  where $baile/precio = $precio
  return <baile>
  <nombre>{$baile/nombre}</nombre>
  <precio>{$precio}</precio>
  </baile>
  ```

  12. Obtener el precio del baile con el precio más barato.

  ```
  let $baile := /bailes/baile
  return <precio>{min($baile/precio)}</precio>
  ```

  13. Obtener el precio y el nombre del baile con el precio más barato.

  ```
  let $precio := min(/bailes/baile/precio)
  for $baile in /bailes/baile
  where $baile/precio = $precio
  return <baile>
  <nombre>{$baile/nombre}</nombre>
  <precio>{$precio}</precio>
  </baile>
  ```

  14. Obtener la suma del precio por el número de plazas de todas las clases. Resultado: 29250.

  ```
  sum (for $baile in /bailes/baile
  return $baile/precio * $baile/plazas)
  ```

  15. Obtener el dia, mes y año de los bailes mensuales, tanto del comienzo como del final.

  ```
  for $baile in /bailes/bailebaile
  where $baile/precio/@cuota = "mensual"
  return
  <baile>
    <comienzo>
      <anyo>{year-from-date($baile/comienzo)}</anyo>
      <mes>{month-from-date($baile/comienzo)}</mes>
      <dia>{day-from-date($baile/comienzo)}</dia>
    </comienzo>
    <finalizacion>
      <anyo>{year-from-date($baile/fin)}</anyo>
      <mes>{month-from-date($baile/fin)}</mes>
      <dia>{day-from-date($baile/fin)}</dia>
    </finalizacion>
  </baile>
  ```

  16. Obtener los bailes que tengan mas de 100 dias de diferencia.

  ```
  for $baile in /bailes/baile
  where days-from-duration(xs:date($baile/fin)-xs:date($baile/comienzo)) > 100
  return $baile
  ```

  17. Obtener la diferencia de dias del comienzo del baile con la fecha actual.

  ```
  for $baile in /bailes/baile
  return days-from-duration(current-date()-xs:date($baile/comienzo))
  ```
