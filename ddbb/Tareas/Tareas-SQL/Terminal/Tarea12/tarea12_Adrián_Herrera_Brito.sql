--- Realizamos la creación de las tablas
sqlite> create table producto(
   ...> codigo INT PRIMARY KEY,
   ...> nombre text,
   ...> precio real,
   ...> codigo_fabricante INT REFERENCES fabricante(id)
   ...> );


sqlite> create table fabricante(
   ...> codigo INT PRIMARY KEY,
   ...> nombre text
   ...> );



---Realizamos los insert
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



---Pasamos a hacer las consultas

--- 1. Lista el nombre de todos los productos que hay en la tabla producto.
sqlite> SELECT nombre FROM producto;
/*Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Disco SSD 1 TB
GeForce GTX 1050Ti
GeForce GTX 1080 Xtreme
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Portátil Yoga 520
Portátil Ideapd 320
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw*/

---2. Lista los nombres y los precios de todos los productos de la tabla producto.
sqlite> SELECT nombre, precio FROM producto;
/* Disco duro SATA3 1TB|86.99
Memoria RAM DDR4 8GB|120.0
Disco SSD 1 TB|150.99
GeForce GTX 1050Ti|185.0
GeForce GTX 1080 Xtreme|755.0
Monitor 24 LED Full HD|202.0
Monitor 27 LED Full HD|245.99
Portátil Yoga 520|559.0
Portátil Ideapd 320|444.0
Impresora HP Deskjet 3720|59.99
Impresora HP Laserjet Pro M26nw|180.0 */

---3. Lista todas las columnas de la tabla producto.
sqlite> SELECT * FROM producto;
/* 1|Disco duro SATA3 1TB|86.99|5
2|Memoria RAM DDR4 8GB|120.0|6
3|Disco SSD 1 TB|150.99|4
4|GeForce GTX 1050Ti|185.0|7
5|GeForce GTX 1080 Xtreme|755.0|6
6|Monitor 24 LED Full HD|202.0|1
7|Monitor 27 LED Full HD|245.99|1
8|Portátil Yoga 520|559.0|2
9|Portátil Ideapd 320|444.0|2
10|Impresora HP Deskjet 3720|59.99|3
11|Impresora HP Laserjet Pro M26nw|180.0|3 */

--- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
sqlite> SELECT precio as peuro, precio*1.07 as pdolar FROM producto;
/*86.99|93.0793
120.0|128.4
150.99|161.5593
185.0|197.95
755.0|807.85
202.0|216.14
245.99|263.2093
559.0|598.13
444.0|475.08
59.99|64.1893
180.0|192.6*/

--- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
sqlite> SELECT nombre, precio as euros, precio * 1.07 as dolares FROM producto;
/* Disco duro SATA3 1TB|86.99|93.0793
Memoria RAM DDR4 8GB|120.0|128.4
Disco SSD 1 TB|150.99|161.5593
GeForce GTX 1050Ti|185.0|197.95
GeForce GTX 1080 Xtreme|755.0|807.85
Monitor 24 LED Full HD|202.0|216.14
Monitor 27 LED Full HD|245.99|263.2093
Portátil Yoga 520|559.0|598.13
Portátil Ideapd 320|444.0|475.08
Impresora HP Deskjet 3720|59.99|64.1893
Impresora HP Laserjet Pro M26nw|180.0|192.6 */

--- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
sqlite> SELECT upper(nombre), precio from producto;
/* DISCO DURO SATA3 1TB|86.99
MEMORIA RAM DDR4 8GB|120.0
DISCO SSD 1 TB|150.99
GEFORCE GTX 1050TI|185.0
GEFORCE GTX 1080 XTREME|755.0
MONITOR 24 LED FULL HD|202.0
MONITOR 27 LED FULL HD|245.99
PORTáTIL YOGA 520|559.0
PORTáTIL IDEAPD 320|444.0
IMPRESORA HP DESKJET 3720|59.99
IMPRESORA HP LASERJET PRO M26NW|180.0 */

--- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
sqlite> SELECT lower(nombre), precio from producto;
/* disco duro sata3 1tb|86.99
memoria ram ddr4 8gb|120.0
disco ssd 1 tb|150.99
geforce gtx 1050ti|185.0
geforce gtx 1080 xtreme|755.0
monitor 24 led full hd|202.0
monitor 27 led full hd|245.99
portátil yoga 520|559.0
portátil ideapd 320|444.0
impresora hp deskjet 3720|59.99
impresora hp laserjet pro m26nw|180.0 */

--- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
sqlite> SELECT nombre, upper(substring(nombre,0,3)) FROM fabricante;
/* Asus|AS
Lenovo|LE
Hewlett-Packard|HE
Samsung|SA
Seagate|SE
Crucial|CR
Gigabyte|GI
Huawei|HU
Xiaomi|XI */

--- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
sqlite> SELECT nombre, round(precio,2) FROM producto;
/* Disco duro SATA3 1TB|86.99
Memoria RAM DDR4 8GB|120.0
Disco SSD 1 TB|150.99
GeForce GTX 1050Ti|185.0
GeForce GTX 1080 Xtreme|755.0
Monitor 24 LED Full HD|202.0
Monitor 27 LED Full HD|245.99
Portátil Yoga 520|559.0
Portátil Ideapd 320|444.0
Impresora HP Deskjet 3720|59.99
Impresora HP Laserjet Pro M26nw|180.0 */

--- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
sqlite> SELECT nombre, cast(precio as integer) FROM producto;
/* Disco duro SATA3 1TB|86
Memoria RAM DDR4 8GB|120
Disco SSD 1 TB|150
GeForce GTX 1050Ti|185
GeForce GTX 1080 Xtreme|755
Monitor 24 LED Full HD|202
Monitor 27 LED Full HD|245
Portátil Yoga 520|559
Portátil Ideapd 320|444
Impresora HP Deskjet 3720|59
Impresora HP Laserjet Pro M26nw|180 */

--- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
sqlite> SELECT f.codigo FROM fabricante as f JOIN producto as p where f.codigo=p.codigo_fabricante;
/* 5
6
4
7
6
1
1
2
2
3
3 */

--- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
sqlite> SELECT DISTINCT f.codigo FROM fabricante as f JOIN producto as p where f.codigo=p.codigo_fabricante;
/* 5
6
4
7
1
2
3 */

--- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
sqlite> SELECT nombre from fabricante ORDER BY nombre asc;
/* Asus
Crucial
Gigabyte
Hewlett-Packard
Huawei
Lenovo
Samsung
Seagate
Xiaomi */

--- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
sqlite> SELECT nombre from fabricante ORDER BY nombre desc;
/* Xiaomi
Seagate
Samsung
Lenovo
Huawei
Hewlett-Packard
Gigabyte
Crucial
Asus */

--- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
sqlite> SELECT nombre, precio from producto ORDER BY nombre ASC, precio DESC;
/* Disco SSD 1 TB|150.99
Disco duro SATA3 1TB|86.99
GeForce GTX 1050Ti|185.0
GeForce GTX 1080 Xtreme|755.0
Impresora HP Deskjet 3720|59.99
Impresora HP Laserjet Pro M26nw|180.0
Memoria RAM DDR4 8GB|120.0
Monitor 24 LED Full HD|202.0
Monitor 27 LED Full HD|245.99
Portátil Ideapd 320|444.0
Portátil Yoga 520|559.0 */

--- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
sqlite> SELECT * FROM fabricante LIMIT 5;
/* 1|Asus
2|Lenovo
3|Hewlett-Packard
4|Samsung
5|Seagate */

--- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
sqlite> SELECT * from fabricante LIMIT 2 OFFSET 3;
/* 4|Samsung
5|Seagate */

--- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
sqlite> SELECT nombre, precio from producto order by precio asc LIMIT 1;
/* Impresora HP Deskjet 3720|59.99 */

--- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
sqlite> SELECT nombre, precio from producto order by precio desc LIMIT 1;
/* GeForce GTX 1080 Xtreme|755.0 */

--- 20. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
sqlite> SELECT p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.codigo=2;
/* Portátil Yoga 520
Portátil Ideapd 320 */

--- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
sqlite> SELECT nombre from producto where precio <= 120;
/* Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Impresora HP Deskjet 3720 */

--- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
sqlite> SELECT nombre from producto WHERE precio >=400;
/* GeForce GTX 1080 Xtreme
Portátil Yoga 520
Portátil Ideapd 320 */

--- 23. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
sqlite> SELECT nombre from producto where precio >= 80 and precio <=300;
/* Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Disco SSD 1 TB
GeForce GTX 1050Ti
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Impresora HP Laserjet Pro M26nw
 */

--- 24. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
sqlite> SELECT nombre from producto where precio BETWEEN 60 and 200;
/* Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Disco SSD 1 TB
GeForce GTX 1050Ti
Impresora HP Laserjet Pro M26nw
 */

--- 25. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
sqlite> SELECT p.nombre FROM producto as p JOIN fabricante as f on f.codigo=p.codigo_fabricante and precio > 200 and f.codigo=6;
/* GeForce GTX 1080 Xtreme */

--- 26. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
sqlite> SELECT p.nombre from producto as p JOIN fabricante as f where p.codigo_fabricante=f.codigo and (f.codigo=1 or f.codigo=3 or f.codigo=5);
/* Monitor 24 LED Full HD
Monitor 27 LED Full HD
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw
Disco duro SATA3 1TB
 */

--- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
sqlite> SELECT p.nombre from producto as p JOIN fabricante as f on p.codigo_fabricante=f.codigo and f.codigo IN (1,3,5);
/* Monitor 24 LED Full HD
Monitor 27 LED Full HD
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw
Disco duro SATA3 1TB */

--- 28. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
   ---Opcion con decimales
sqlite> SELECT nombre, precio*100 as centimos from producto;
/* Disco duro SATA3 1TB|8699.0
Memoria RAM DDR4 8GB|12000.0
Disco SSD 1 TB|15099.0
GeForce GTX 1050Ti|18500.0
GeForce GTX 1080 Xtreme|75500.0
Monitor 24 LED Full HD|20200.0
Monitor 27 LED Full HD|24599.0
Portátil Yoga 520|55900.0
Portátil Ideapd 320|44400.0
Impresora HP Deskjet 3720|5999.0
Impresora HP Laserjet Pro M26nw|18000.0 */

   ---Opcion sin decimales
sqlite> SELECT nombre, cast(precio*100 as integer) as centimos from producto;
/* Disco duro SATA3 1TB|8699
Memoria RAM DDR4 8GB|12000
Disco SSD 1 TB|15099
GeForce GTX 1050Ti|18500
GeForce GTX 1080 Xtreme|75500
Monitor 24 LED Full HD|20200
Monitor 27 LED Full HD|24599
Portátil Yoga 520|55900
Portátil Ideapd 320|44400
Impresora HP Deskjet 3720|5999
Impresora HP Laserjet Pro M26nw|18000 */

--- 29. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
sqlite> SELECT nombre from fabricante WHERE nombre like 'S%';
/* Samsung
Seagate */

--- 30. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
sqlite> SELECT nombre from fabricante WHERE nombre like '%e';
/* Seagate
Gigabyte */

--- 31. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.]
sqlite> SELECT nombre from fabricante where nombre like '%w%';
/* Hewlett-Packard
Huawei */
--- 32. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
sqlite> SELECT nombre from fabricante WHERE nombre like '____';
/* Asus */

--- 33. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
sqlite> SELECT nombre from producto where nombre like 'Portátil%';
/* Portátil Yoga 520
Portátil Ideapd 320 */

--- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
sqlite> SELECT nombre from producto where nombre like 'Monitor%' and precio < 215;
/* Monitor 24 LED Full HD */

--- 35. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
   ---Primer lugar
sqlite> SELECT nombre, precio from producto where precio >= 180 ORDER by precio desc;
/* GeForce GTX 1080 Xtreme|755.0
Portátil Yoga 520|559.0
Portátil Ideapd 320|444.0
Monitor 27 LED Full HD|245.99
Monitor 24 LED Full HD|202.0
GeForce GTX 1050Ti|185.0
Impresora HP Laserjet Pro M26nw|180.0 */  

   ---Segundo lugar
sqlite> SELECT nombre, precio from producto where precio >= 180 ORDER by nombre asc;
/* GeForce GTX 1050Ti|185.0
GeForce GTX 1080 Xtreme|755.0
Impresora HP Laserjet Pro M26nw|180.0
Monitor 24 LED Full HD|202.0
Monitor 27 LED Full HD|245.99
Portátil Ideapd 320|444.0
Portátil Yoga 520|559.0 */

