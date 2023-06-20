-- Consultas sobre una tabla (0,6 puntos)

-- 1. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
sqlite> SELECT nombre, precio from producto ORDER BY precio asc LIMIT 1;
/* ┌───────────────────────────┬────────┐
│          nombre           │ precio │
├───────────────────────────┼────────┤
│ Impresora HP Deskjet 3720 │ 59.99  │
└───────────────────────────┴────────┘ */

-- 2. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
sqlite> SELECT * FROM producto where precio > 80 and precio < 300;
/* ┌────────┬─────────────────────────────────┬────────┬───────────────────┐
│ codigo │             nombre              │ precio │ codigo_fabricante │
├────────┼─────────────────────────────────┼────────┼───────────────────┤
│ 1      │ Disco duro SATA3 1TB            │ 86.99  │ 5                 │
│ 2      │ Memoria RAM DDR4 8GB            │ 120.0  │ 6                 │
│ 3      │ Disco SSD 1 TB                  │ 150.99 │ 4                 │
│ 4      │ GeForce GTX 1050Ti              │ 185.0  │ 7                 │
│ 6      │ Monitor 24 LED Full HD          │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD          │ 245.99 │ 1                 │
│ 11     │ Impresora HP Laserjet Pro M26nw │ 180.0  │ 3                 │
└────────┴─────────────────────────────────┴────────┴───────────────────┘ */

-- 3. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
sqlite> SELECT nombre from fabricante where nombre REGEXP "^....$";
/* ┌────────┐
│ nombre │
├────────┤
│ Asus   │
└────────┘ */

-- 4. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
sqlite> SELECT nombre from producto where nombre REGEXP "Portátil";
/* ┌─────────────────────┐
│       nombre        │
├─────────────────────┤
│ Portátil Yoga 520   │
│ Portátil Ideapd 320 │
└─────────────────────┘ */

-- 5. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
sqlite> SELECT nombre from producto where nombre REGEXP "Monitor" and precio < 215;
/* ┌────────────────────────┐
│         nombre         │
├────────────────────────┤
│ Monitor 24 LED Full HD │
└────────────────────────┘ */

-- 6. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
sqlite> SELECT nombre, precio from producto where precio >= 180 ORDER by precio DESC, nombre asc;
/* ┌─────────────────────────────────┬────────┐
│             nombre              │ precio │
├─────────────────────────────────┼────────┤
│ GeForce GTX 1080 Xtreme         │ 755.0  │
│ Portátil Yoga 520               │ 559.0  │
│ Portátil Ideapd 320             │ 444.0  │
│ Monitor 27 LED Full HD          │ 245.99 │
│ Monitor 24 LED Full HD          │ 202.0  │
│ GeForce GTX 1050Ti              │ 185.0  │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │
└─────────────────────────────────┴────────┘ */



-- Consultas multitabla (INNER 0,7 puntos) Obligatorio aprobar

-- 7. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
sqlite> SELECT p.nombre,p.precio,f.nombre from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo ORDER BY p.precio desc LIMIT 1;
/* ┌─────────────────────────┬────────┬─────────┐
│         nombre          │ precio │ nombre  │
├─────────────────────────┼────────┼─────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial │
└─────────────────────────┴────────┴─────────┘ */

-- 8. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
sqlite> SELECT p.* from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo where p.precio > 200;
/* ┌────────┬─────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre          │ precio │ codigo_fabricante │
├────────┼─────────────────────────┼────────┼───────────────────┤
│ 5      │ GeForce GTX 1080 Xtreme │ 755.0  │ 6                 │
│ 6      │ Monitor 24 LED Full HD  │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD  │ 245.99 │ 1                 │
│ 8      │ Portátil Yoga 520       │ 559.0  │ 2                 │
│ 9      │ Portátil Ideapd 320     │ 444.0  │ 2                 │
└────────┴─────────────────────────┴────────┴───────────────────┘ */

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
sqlite> SELECT p.* from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre="Asus" or f.nombre="Hewlwtt-Packardy Seagate";
/* ┌────────┬────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre         │ precio │ codigo_fabricante │
├────────┼────────────────────────┼────────┼───────────────────┤
│ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
└────────┴────────────────────────┴────────┴───────────────────┘ */

-- 10. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
sqlite> SELECT p.* from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre in ("Asus", "Hewlett-Packardy Seagate");
/* ┌────────┬────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre         │ precio │ codigo_fabricante │
├────────┼────────────────────────┼────────┼───────────────────┤
│ 6      │ Monitor 24 LED Full HD │ 202.0  │ 1                 │
│ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
└────────┴────────────────────────┴────────┴───────────────────┘ */

-- 11. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
sqlite> SELECT p.nombre, p.precio from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre REGEXP "e$";
/* ┌──────────────────────┬────────┐
│        nombre        │ precio │
├──────────────────────┼────────┤
│ Disco duro SATA3 1TB │ 86.99  │
│ GeForce GTX 1050Ti   │ 185.0  │
└──────────────────────┴────────┘ */

-- 12. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
sqlite> SELECT p.nombre, p.precio from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre REGEXP "w";
/* ┌─────────────────────────────────┬────────┐
│             nombre              │ precio │
├─────────────────────────────────┼────────┤
│ Impresora HP Deskjet 3720       │ 59.99  │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │
└─────────────────────────────────┴────────┘ */

-- 13. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
sqlite> SELECT p.nombre, p.precio, f.nombre from producto as p INNER JOIN fabricante as f on p.codigo_fabricante=f.codigo where p.precio > 180 ORDER BY p.precio desc, p.nombre asc;
/* ┌─────────────────────────┬────────┬──────────┐
│         nombre          │ precio │  nombre  │
├─────────────────────────┼────────┼──────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial  │
│ Portátil Yoga 520       │ 559.0  │ Lenovo   │
│ Portátil Ideapd 320     │ 444.0  │ Lenovo   │
│ Monitor 27 LED Full HD  │ 245.99 │ Asus     │
│ Monitor 24 LED Full HD  │ 202.0  │ Asus     │
│ GeForce GTX 1050Ti      │ 185.0  │ Gigabyte │
└─────────────────────────┴────────┴──────────┘ */

-- 14. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
sqlite> SELECT f.* from fabricante as f JOIN producto as p on p.codigo_fabricante=f.codigo;
/* ┌────────┬─────────────────┐
│ codigo │     nombre      │
├────────┼─────────────────┤
│ 5      │ Seagate         │
│ 6      │ Crucial         │
│ 4      │ Samsung         │
│ 7      │ Gigabyte        │
│ 6      │ Crucial         │
│ 1      │ Asus            │
│ 1      │ Asus            │
│ 2      │ Lenovo          │
│ 2      │ Lenovo          │
│ 3      │ Hewlett-Packard │
│ 3      │ Hewlett-Packard │
└────────┴─────────────────┘ */



-- Consultas multitabla (LEFT/RIGHT JOIN 0,2) Obligatorio aprobar

-- 15. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
sqlite> SELECT f.*, p.nombre, p.precio from fabricante as f LEFT JOIN producto as p on p.codigo_fabricante=f.codigo;
/* ┌────────┬─────────────────┬─────────────────────────────────┬────────┐
│ codigo │     nombre      │             nombre              │ precio │
├────────┼─────────────────┼─────────────────────────────────┼────────┤
│ 1      │ Asus            │ Monitor 24 LED Full HD          │ 202.0  │
│ 1      │ Asus            │ Monitor 27 LED Full HD          │ 245.99 │
│ 2      │ Lenovo          │ Portátil Ideapd 320             │ 444.0  │
│ 2      │ Lenovo          │ Portátil Yoga 520               │ 559.0  │
│ 3      │ Hewlett-Packard │ Impresora HP Deskjet 3720       │ 59.99  │
│ 3      │ Hewlett-Packard │ Impresora HP Laserjet Pro M26nw │ 180.0  │
│ 4      │ Samsung         │ Disco SSD 1 TB                  │ 150.99 │
│ 5      │ Seagate         │ Disco duro SATA3 1TB            │ 86.99  │
│ 6      │ Crucial         │ GeForce GTX 1080 Xtreme         │ 755.0  │
│ 6      │ Crucial         │ Memoria RAM DDR4 8GB            │ 120.0  │
│ 7      │ Gigabyte        │ GeForce GTX 1050Ti              │ 185.0  │
│ 8      │ Huawei          │                                 │        │
│ 9      │ Xiaomi          │                                 │        │
└────────┴─────────────────┴─────────────────────────────────┴────────┘ */

-- 16. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
sqlite> SELECT f.* from fabricante as f LEFT JOIN producto as p on p.codigo_fabricante=f.codigo where p.codigo_fabricante is null;
/* ┌────────┬────────┐
│ codigo │ nombre │
├────────┼────────┤
│ 8      │ Huawei │
│ 9      │ Xiaomi │
└────────┴────────┘ */

--  Consultas resumen (0,6)

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
sqlite> SELECT f.nombre, max(p.precio), min(p.precio), avg(p.precio) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo GROUP BY f.codigo;
/* ┌─────────────────┬───────────────┬───────────────┬───────────────┐
│     nombre      │ max(p.precio) │ min(p.precio) │ avg(p.precio) │
├─────────────────┼───────────────┼───────────────┼───────────────┤
│ Asus            │ 245.99        │ 202.0         │ 223.995       │
│ Lenovo          │ 559.0         │ 444.0         │ 501.5         │
│ Hewlett-Packard │ 180.0         │ 59.99         │ 119.995       │
│ Samsung         │ 150.99        │ 150.99        │ 150.99        │
│ Seagate         │ 86.99         │ 86.99         │ 86.99         │
│ Crucial         │ 755.0         │ 120.0         │ 437.5         │
│ Gigabyte        │ 185.0         │ 185.0         │ 185.0         │
└─────────────────┴───────────────┴───────────────┴───────────────┘ */

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.


-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
sqlite> SELECT f.nombre, max(p.precio), min(p.precio), avg(p.precio), count(*) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo GROUP BY f.codigo HAVING avg(p.precio) > 200;
/* ┌─────────┬───────────────┬───────────────┬───────────────┬──────────┐
│ nombre  │ max(p.precio) │ min(p.precio) │ avg(p.precio) │ count(*) │
├─────────┼───────────────┼───────────────┼───────────────┼──────────┤
│ Asus    │ 245.99        │ 202.0         │ 223.995       │ 2        │
│ Lenovo  │ 559.0         │ 444.0         │ 501.5         │ 2        │
│ Crucial │ 755.0         │ 120.0         │ 437.5         │ 2        │
└─────────┴───────────────┴───────────────┴───────────────┴──────────┘ */
-- 20. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
sqlite> SELECT max(p.precio), min(p.precio), avg(p.precio), count(*) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo GROUP BY f.codigo HAVING avg(p.precio) > 200;
/* ┌───────────────┬───────────────┬───────────────┬──────────┐
│ max(p.precio) │ min(p.precio) │ avg(p.precio) │ count(*) │
├───────────────┼───────────────┼───────────────┼──────────┤
│ 245.99        │ 202.0         │ 223.995       │ 2        │
│ 559.0         │ 444.0         │ 501.5         │ 2        │
│ 755.0         │ 120.0         │ 437.5         │ 2        │
└───────────────┴───────────────┴───────────────┴──────────┘ */

-- 21. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
sqlite> SELECT f.nombre, sum(p.precio) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo GROUP BY f.codigo HAVING sum(p.precio) > 1000;
/* ┌────────┬───────────────┐
│ nombre │ sum(p.precio) │
├────────┼───────────────┤
│ Lenovo │ 1003.0        │
└────────┴───────────────┘ */

-- 22. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
sqlite> SELECT p.nombre, p.precio, f.nombre from producto as p JOIN fabricante as f on f.codigo=p.codigo_fabricante ORDER BY f.nombre asc;
/* ┌─────────────────────────────────┬────────┬─────────────────┐
│             nombre              │ precio │     nombre      │
├─────────────────────────────────┼────────┼─────────────────┤
│ Monitor 24 LED Full HD          │ 202.0  │ Asus            │
│ Monitor 27 LED Full HD          │ 245.99 │ Asus            │
│ Memoria RAM DDR4 8GB            │ 120.0  │ Crucial         │
│ GeForce GTX 1080 Xtreme         │ 755.0  │ Crucial         │
│ GeForce GTX 1050Ti              │ 185.0  │ Gigabyte        │
│ Impresora HP Deskjet 3720       │ 59.99  │ Hewlett-Packard │
│ Impresora HP Laserjet Pro M26nw │ 180.0  │ Hewlett-Packard │
│ Portátil Yoga 520               │ 559.0  │ Lenovo          │
│ Portátil Ideapd 320             │ 444.0  │ Lenovo          │
│ Disco SSD 1 TB                  │ 150.99 │ Samsung         │
│ Disco duro SATA3 1TB            │ 86.99  │ Seagate         │
└─────────────────────────────────┴────────┴─────────────────┘ */



--  Subconsultas (En la cláusula WHERE 0,9 obligatorio aprobar)

-- 23. Con operadores básicos de comparación
-- 24. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
sqlite> SELECT p.nombre, p.precio from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre="Lenovo";
/* ┌─────────────────────┬────────┐
│       nombre        │ precio │
├─────────────────────┼────────┤
│ Portátil Yoga 520   │ 559.0  │
│ Portátil Ideapd 320 │ 444.0  │
└─────────────────────┴────────┘ */

-- 25. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
sqlite> SELECT p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio = (SELECT max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Lenovo");
/* ┌────────┬───────────────────┬────────┬───────────────────┐
│ codigo │      nombre       │ precio │ codigo_fabricante │
├────────┼───────────────────┼────────┼───────────────────┤
│ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
└────────┴───────────────────┴────────┴───────────────────┘ */

-- 26. Lista el nombre del producto más caro del fabricante Lenovo.
sqlite> SELECT p.nombre, max(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre="Lenovo";
/* ┌───────────────────┬───────────────┐
│      nombre       │ max(p.precio) │
├───────────────────┼───────────────┤
│ Portátil Yoga 520 │ 559.0         │
└───────────────────┴───────────────┘ */

-- 27. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
sqlite> SELECT nombre, min(precio) from producto where codigo_fabricante = (SELECT codigo from fabricante where nombre="Hewlett-Packard");
/* ┌───────────────────────────┬─────────────┐
│          nombre           │ min(precio) │
├───────────────────────────┼─────────────┤
│ Impresora HP Deskjet 3720 │ 59.99       │
└───────────────────────────┴─────────────┘ */

-- 28. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
sqlite> SELECT p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio >= (SELECT max(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre="Lenovo");
/* ┌─────────────────────────┬────────┐
│         nombre          │ precio │
├─────────────────────────┼────────┤
│ GeForce GTX 1080 Xtreme │ 755.0  │
│ Portátil Yoga 520       │ 559.0  │
└─────────────────────────┴────────┘ */

-- 29. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
sqlite> SELECT p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Asus" and p.precio > (SELECT avg(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Asus");
/* ┌────────┬────────────────────────┬────────┬───────────────────┐
│ codigo │         nombre         │ precio │ codigo_fabricante │
├────────┼────────────────────────┼────────┼───────────────────┤
│ 7      │ Monitor 27 LED Full HD │ 245.99 │ 1                 │
└────────┴────────────────────────┴────────┴───────────────────┘ */

-- 30. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
sqlite> SELECT nombre, precio from producto where precio >= ALL (SELECT precio from producto);
/* Error: in prepare, near "ALL": syntax error (1) */

-- 31.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
sqlite> SELECT nombre, precio from producto where precio <= ALL (SELECT precio from producto);
/* Error: in prepare, near "=": syntax error (1) */



-- Subconsultas con IN y NOT IN (0,2 obligatorio aprobar)

-- 32. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
sqlite> SELECT nombre from fabricante where codigo in (SELECT codigo_fabricante from producto);
/* ┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Asus            │
│ Lenovo          │
│ Hewlett-Packard │
│ Samsung         │
│ Seagate         │
│ Crucial         │
│ Gigabyte        │
└─────────────────┘ */

-- 33. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
sqlite> SELECT nombre from fabricante where codigo not in (SELECT codigo_fabricante from producto);
/* ┌────────┐
│ nombre │
├────────┤
│ Huawei │
│ Xiaomi │
└────────┘ */



-- Subconsultas con EXISTS y NOT EXISTS (0,2 obligatorio aprobar)

-- 34. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT nombre from fabricante as f where EXISTS (SELECT codigo_fabricante from producto as p where f.codigo=p.codigo_fabricante);
/* ┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Asus            │
│ Lenovo          │
│ Hewlett-Packard │
│ Samsung         │
│ Seagate         │
│ Crucial         │
│ Gigabyte        │
└─────────────────┘ */

-- 35. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT nombre from fabricante as f where NOT EXISTS (SELECT codigo_fabricante from producto as p where f.codigo=p.codigo_fabricante);
/* ┌────────┐
│ nombre │
├────────┤
│ Huawei │
│ Xiaomi │
└────────┘ */



--  Subconsultas correlacionadas (0,5 obligatorio aprobar)

-- 36. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
sqlite> SELECT nombre from fabricante where codigo=(SELECT codigo_fabricante FROM producto where precio=(SELECT max(precio) from producto));
/* ┌─────────┐
│ nombre  │
├─────────┤
│ Crucial │
└─────────┘ */

-- 37. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
sqlite> SELECT p.nombre from fabricante as f, producto as p where f.codigo=p.codigo_fabricante and f.nombre="Lenovo" and p.precio=(SELECT max(precio) from producto where f.codigo=p.codigo_fabricante)

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
sqlite> SELECT nombre from producto where precio =(SELECT max(precio) from producto where codigo_fabricante = (SELECT codigo from fabricante where nombre="Lenovo"));
/* ┌───────────────────┐
│      nombre       │
├───────────────────┤
│ Portátil Yoga 520 │
└───────────────────┘ */



--  39. Subconsultas (En la cláusula HAVING)
-- 40 .Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
sqlite> SELECT f.nombre, count(p.nombre) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo GROUP BY f.nombre having count(p.nombre) = (SELECT count(p.nombre) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo where f.nombre="Lenovo");
/* ┌─────────────────┬─────────────────┐
│     nombre      │ count(p.nombre) │
├─────────────────┼─────────────────┤
│ Asus            │ 2               │
│ Crucial         │ 2               │
│ Hewlett-Packard │ 2               │
│ Lenovo          │ 2               │
└─────────────────┴─────────────────┘ */
