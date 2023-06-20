--- Partiendo de la base de la tarea 12 que ya hemos 
---realizado vamos a lanzar nuevas consultas

--- Consultas multitablas con where:
-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
sqlite> SELECT p.nombre, p.precio, f.nombre FROM fabricante as f, producto as p where p.codigo_fabricante=f.codigo;
/* Disco duro SATA3 1TB|86.99|Seagate
Memoria RAM DDR4 8GB|120.0|Crucial
Disco SSD 1 TB|150.99|Samsung
GeForce GTX 1050Ti|185.0|Gigabyte
GeForce GTX 1080 Xtreme|755.0|Crucial
Monitor 24 LED Full HD|202.0|Asus
Monitor 27 LED Full HD|245.99|Asus
Portátil Yoga 520|559.0|Lenovo
Portátil Ideapd 320|444.0|Lenovo
Impresora HP Deskjet 3720|59.99|Hewlett-Packard
Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard */

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
sqlite> SELECT p.nombre, p.precio, f.nombre FROM fabricante as f, producto as p where p.codigo_fabricante=f.codigo
   ...> ORDER BY f.nombre;
/* Monitor 24 LED Full HD|202.0|Asus
Monitor 27 LED Full HD|245.99|Asus
Memoria RAM DDR4 8GB|120.0|Crucial
GeForce GTX 1080 Xtreme|755.0|Crucial
GeForce GTX 1050Ti|185.0|Gigabyte
Impresora HP Deskjet 3720|59.99|Hewlett-Packard
Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard
Portátil Yoga 520|559.0|Lenovo
Portátil Ideapd 320|444.0|Lenovo
Disco SSD 1 TB|150.99|Samsung
Disco duro SATA3 1TB|86.99|Seagate */

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
sqlite> SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM fabricante as f, producto as p where p.codigo_fabricante=f.codigo;
/* 1|Disco duro SATA3 1TB|5|Seagate
2|Memoria RAM DDR4 8GB|6|Crucial
3|Disco SSD 1 TB|4|Samsung
4|GeForce GTX 1050Ti|7|Gigabyte
5|GeForce GTX 1080 Xtreme|6|Crucial
6|Monitor 24 LED Full HD|1|Asus
7|Monitor 27 LED Full HD|1|Asus
8|Portátil Yoga 520|2|Lenovo
9|Portátil Ideapd 320|2|Lenovo
10|Impresora HP Deskjet 3720|3|Hewlett-Packard
11|Impresora HP Laserjet Pro M26nw|3|Hewlett-Packard */

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
sqlite> SELECT p.nombre, p.precio, f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo 
   ...> ORDER BY p.precio asc LIMIT 1;
/* Impresora HP Deskjet 3720|59.99|Hewlett-Packard */

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
sqlite> SELECT p.nombre, p.precio, f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo 
   ...> ORDER BY p.precio desc LIMIT 1;
/* GeForce GTX 1080 Xtreme|755.0|Crucial */

-- Devuelve una lista de todos los productos del fabricante Lenovo.
sqlite> SELECT p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Lenovo";
/* Portátil Yoga 520
Portátil Ideapd 320 */

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
sqlite> SELECT p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo
   ...> and f.nombre="Crucial" and p.precio > 200;
/* GeForce GTX 1080 Xtreme */

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
sqlite> SELECT p.nombre from producto as p, fabricante as f WHERE p.codigo_fabricante=f.codigo and
   ...> (f.nombre="Asus" or f.nombre="Hewlett-Packardy Seagate");
/* Monitor 24 LED Full HD
Monitor 27 LED Full HD
 */
 
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
sqlite> SELECT p.nombre from producto as p, fabricante as f WHERE p.codigo_fabricante=f.codigo and
   ...> f.nombre in ("Asus", "Hewlett-Packardy Seagate");
/* Monitor 24 LED Full HD
Monitor 27 LED Full HD
 */

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
sqlite> SELECT p.nombre, p.precio FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo 
   ...> and f.nombre like "%e";
/* Disco duro SATA3 1TB|86.99
GeForce GTX 1050Ti|185.0 */

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
sqlite> SELECT p.nombre, p.precio FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo 
   ...> and f.nombre like "%k%";
/* Impresora HP Deskjet 3720|59.99
Impresora HP Laserjet Pro M26nw|180.0 */

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
sqlite> SELECT p.nombre, p.precio, f.nombre FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo
   ...> and p.precio >= 180 ORDER by p.precio DESC;
/* GeForce GTX 1080 Xtreme|755.0|Crucial
Portátil Yoga 520|559.0|Lenovo
Portátil Ideapd 320|444.0|Lenovo
Monitor 27 LED Full HD|245.99|Asus
Monitor 24 LED Full HD|202.0|Asus
GeForce GTX 1050Ti|185.0|Gigabyte */

sqlite> SELECT p.nombre, p.precio, f.nombre FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo
   ...> and p.precio >= 180 ORDER by p.nombre ASC;
/* GeForce GTX 1050Ti|185.0|Gigabyte
GeForce GTX 1080 Xtreme|755.0|Crucial
Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard
Monitor 24 LED Full HD|202.0|Asus
Monitor 27 LED Full HD|245.99|Asus
Portátil Ideapd 320|444.0|Lenovo
Portátil Yoga 520|559.0|Lenovo */

-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.



--- Consultas multitablas con left y right join:
---Devuelve un listado de todos lo*/
sqlite> SELECT f.nombre, p.nombre from fabricante as f LEFT JOIN producto as p on f.codigo=p.codigo_fabricante;
/* Asus|Monitor 24 LED Full HD
Asus|Monitor 27 LED Full HD
Lenovo|Portátil Ideapd 320
Lenovo|Portátil Yoga 520
Hewlett-Packard|Impresora HP Deskjet 3720
Hewlett-Packard|Impresora HP Laserjet Pro M26nw
Samsung|Disco SSD 1 TB
Seagate|Disco duro SATA3 1TB
Crucial|GeForce GTX 1080 Xtreme
Crucial|Memoria RAM DDR4 8GB
Gigabyte|GeForce GTX 1050Ti
Huawei|
Xiaomi| */

---Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
sqlite> SELECT f.nombre, p.nombre from fabricante as f LEFT JOIN producto as p on p.codigo_fabricante=f.codigo where p.nombre is null;
/* Huawei|
Xiaomi| */



---Consultas haciendo calculos:

---Calcula el número total de productos que hay en la tabla productos.
sqlite> SELECT count(*) FROM producto;
/* 11 */

---Calcula el número total de fabricantes que hay en la tabla fabricante.
sqlite> SELECT count(*) FROM fabricante;
/* 9 */

---Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
sqlite> SELECT count(DISTINCT codigo_fabricante) FROM producto;
/* 7 */

---Calcula la media del precio de todos los productos.
sqlite> SELECT avg(precio) from producto;
/* 271.723636363636 */

---Calcula el precio más barato de todos los productos.
sqlite> SELECT min(precio) from producto;
/* 59.99 */

---Calcula el precio más caro de todos los productos.
sqlite> SELECT max(precio) from producto;
/* 755.0 */

---Lista el nombre y el precio del producto más barato.
sqlite> SELECT nombre, min(precio) FROM producto;
/* Impresora HP Deskjet 3720|59.99 */

---Lista el nombre y el precio del producto más caro.
sqlite> SELECT nombre, max(precio) from producto;
/* GeForce GTX 1080 Xtreme|755.0 */

---Calcula la suma de los precios de todos los productos.
sqlite> SELECT sum(precio) from producto;
/* 2988.96 */

---Calcula el número de productos que tiene el fabricante Asus.
sqlite> SELECT count(*) FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre="Asus";
/* 2 */

---Calcula la media del precio de todos los productos del fabricante Asus.
sqlite> SELECT avg(precio) FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre="Asus";
/* 223.995 */

---Calcula el precio más barato de todos los productos del fabricante Asus.
sqlite> SELECT min(precio) FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre="Asus";
/* 202.0 */

---Calcula el precio más caro de todos los productos del fabricante Asus.
sqlite> SELECT max(precio) FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre="Asus";
/* 245.99 */

---Calcula la suma de todos los productos del fabricante Asus.
sqlite> SELECT sum(precio) FROM producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.nombre="Asus";
/* 447.99 */

---Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
sqlite> SELECT max(precio), min(precio), avg(precio), count(*) FROM producto as p JOIN fabricante as f on
   ...> p.codigo_fabricante = f.codigo and f.nombre="Crucial";
/* 755.0|120.0|437.5|2 */

---Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
sqlite> SELECT f.nombre, count(p.nombre) as prod FROM fabricante as f LEFT JOIN producto as p on p.codigo_fabricante=f.codigo GROUP by f.codigo ORDER BY prod DESC;
/* Asus|2
Lenovo|2
Hewlett-Packard|2
Crucial|2
Samsung|1
Seagate|1
Gigabyte|1
Huawei|0
Xiaomi|0 */

---Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
sqlite> SELECT f.nombre, max(precio), min(precio), avg(precio) FROM fabricante as f JOIN producto as p on
   ...> p.codigo_fabricante=f.codigo GROUP by f.codigo;
/* Asus|245.99|202.0|223.995
Lenovo|559.0|444.0|501.5
Hewlett-Packard|180.0|59.99|119.995
Samsung|150.99|150.99|150.99
Seagate|86.99|86.99|86.99
Crucial|755.0|120.0|437.5
Gigabyte|185.0|185.0|185.0 */

---Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
sqlite> SELECT f.codigo, max(precio), min(precio), avg(precio) as media ,count(p.nombre) FROM fabricante as f JOIN producto as p on p.codigo_fabricante=f.codigo GROUP by f.codigo having avg(precio) > 200;
/* 1|245.99|202.0|223.995|2
2|559.0|444.0|501.5|2
6|755.0|120.0|437.5|2 */

---Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
sqlite> SELECT f.nombre, max(precio), min(precio), avg(precio) as media ,count(p.nombre) FROM fabricante as f JOIN producto as p on p.codigo_fabricante=f.codigo GROUP by f.codigo having avg(precio) > 200;
/* Asus|245.99|202.0|223.995|2
Lenovo|559.0|444.0|501.5|2
Crucial|755.0|120.0|437.5|2 */

---Calcula el número de productos que tienen un precio mayor o igual a 180€.
sqlite> SELECT count(*) from producto where precio >= 180;
/* 7 */

---Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
sqlite> SELECT f.nombre, count(p.nombre) from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo
   ...> and p.precio >= 180 GROUP by f.nombre;
/* Asus|2
Crucial|1
Gigabyte|1
Hewlett-Packard|1
Lenovo|2 */

---Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
sqlite> SELECT f.codigo, avg(p.precio) FROM producto as p, fabricante as f where p.codigo_fabricante=f.codigo
   ...> GROUP by f.codigo;
/* 1|223.995
2|501.5
3|119.995
4|150.99
5|86.99
6|437.5
7|185.0 */

---Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
sqlite> SELECT f.nombre, avg(p.precio) FROM producto as p, fabricante as f where p.codigo_fabricante=f.codigo
   ...> GROUP by f.codigo;
/* Asus|223.995
Lenovo|501.5
Hewlett-Packard|119.995
Samsung|150.99
Seagate|86.99
Crucial|437.5
Gigabyte|185.0 */

---Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
sqlite> SELECT f.nombre, avg(precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo
   ...> GROUP BY f.nombre having avg(precio) >= 150;
/* Asus|223.995
Crucial|437.5
Gigabyte|185.0
Lenovo|501.5
Samsung|150.99 */

---Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
sqlite> SELECT f.nombre, count(p.nombre) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo
   ...> GROUP by f.nombre HAVING count(p.nombre) >= 2;
/* Asus|2
Crucial|2
Hewlett-Packard|2
Lenovo|2 */

---Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
sqlite> SELECT f.nombre, count(p.codigo) as total from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio >= 220 GROUP by f.nombre;
/* Asus|1
Crucial|1
Lenovo|2 */

---Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no
---tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.


---Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
sqlite> SELECT f.nombre, sum(precio) from fabricante as f, producto as p where p.codigo_fabricante=f.codigo 
   ...> GROUP by f.nombre HAVING sum(precio) > 1000;
/* Lenovo|1003.0 */

---Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
sqlite> SELECT p.nombre,max(p.precio), f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo GROUP by f.nombre ORDER by f.nombre asc;
/* Monitor 27 LED Full HD|245.99|Asus
GeForce GTX 1080 Xtreme|755.0|Crucial
GeForce GTX 1050Ti|185.0|Gigabyte
Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard
Portátil Yoga 520|559.0|Lenovo
Disco SSD 1 TB|150.99|Samsung
Disco duro SATA3 1TB|86.99|Seagate */



---Subconsultas (con cláusula WHERE)

---Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
sqlite> SELECT p.nombre from producto as p where p.codigo_fabricante==(SELECT f.codigo from fabricante as f where f.nombre = "Lenovo");
/* Portátil Yoga 520
Portátil Ideapd 320 */

---Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
sqlite> SELECT * from producto where precio = (SELECT max(precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo);
/* 5|GeForce GTX 1080 Xtreme|755.0|6 */

---Lista el nombre del producto más caro del fabricante Lenovo.
sqlite> SELECT nombre from producto where precio = (SELECT max(precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Lenovo");
/* Portátil Yoga 520 */

---Lista el nombre del producto más barato del fabricante Hewlett-Packard.
sqlite> SELECT nombre from producto where precio = (SELECT min(precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Hewlett-Packard");
/* Impresora HP Deskjet 3720 */

---Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
sqlite> SELECT * from producto where precio >= (SELECT max(precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Lenovo");
/* 5|GeForce GTX 1080 Xtreme|755.0|6
8|Portátil Yoga 520|559.0|2 */

---Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
sqlite> SELECT * from producto where precio > (SELECT avg(precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre="Asus");
/* 5|GeForce GTX 1080 Xtreme|755.0|6
7|Monitor 27 LED Full HD|245.99|1
8|Portátil Yoga 520|559.0|2
9|Portátil Ideapd 320|444.0|2 */


---Consultas con ANY y ALL
---Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

---Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
---Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
---Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).



---Consultas con IN y NOT IN 
---Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
sqlite> SELECT f.nombre from fabricante as f where f.codigo in (SELECT codigo_fabricante from producto);
/* Asus
Lenovo
Hewlett-Packard
Samsung
Seagate
Crucial
Gigabyte */

---Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
sqlite> SELECT f.nombre from fabricante as f where f.codigo not in (SELECT codigo_fabricante from producto);
/* Huawei
Xiaomi */



---Consultas con exist o not exist
---Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT f.nombre from fabricante as f where EXISTS (SELECT * from producto as p where p.codigo_fabricante = f.codigo);
/* Asus
Lenovo
Hewlett-Packard
Samsung
Seagate
Crucial
Gigabyte */

---Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT f.nombre from fabricante as f where NOT EXISTS (SELECT * from producto as p where p.codigo_fabricante = f.codigo);
/* Huawei
Xiaomi */



---Subconsultas correlacionadas
---Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
sqlite> SELECT f.nombre, p.nombre, p.precio FROM producto as p, fabricante as f where p.codigo_fabricante=f.codigo GROUP BY f.nombre;
/* Asus|Monitor 24 LED Full HD|202.0
Crucial|Memoria RAM DDR4 8GB|120.0
Gigabyte|GeForce GTX 1050Ti|185.0
Hewlett-Packard|Impresora HP Deskjet 3720|59.99
Lenovo|Portátil Yoga 520|559.0
Samsung|Disco SSD 1 TB|150.99
Seagate|Disco duro SATA3 1TB|86.99 */

---Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
---Lista el nombre del producto más caro del fabricante Lenovo.
sqlite> SELECT f.nombre, p.nombre, max(p.precio) from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and f.nombre=(SELECT nombre from fabricante where nombre="Lenovo");
/* Lenovo|Portátil Yoga 520|559.0 */



---Consultas con HAVING
---Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
sqlite> SELECT f.nombre, count(p.nombre) from fabricante as f, producto as p where p.codigo_fabricante=f.codigo GROUP by f.nombre having count(p.nombre) = (SELECT count(p.nombre) from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and f.nombre = "Lenovo");
/* Asus|2               
Crucial|2               
Hewlett-Packard|2               
Lenovo|2 */       







