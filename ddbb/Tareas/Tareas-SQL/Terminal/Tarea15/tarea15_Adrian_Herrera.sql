--- Realizamos la creacion de las tablas
sqlite> create table cliente(
   ...> id integer PRIMARY KEY AUTOINCREMENT,
   ...> nombre text,
   ...> apellido1 text,
   ...> apellido2 text,
   ...> ciudad text,
   ...> categoria integer
   ...> );

sqlite> create table comercial(
   ...> id integer PRIMARY KEY AUTOINCREMENT,
   ...> nombre text,
   ...> apellido1 text,
   ...> apellido2 text,
   ...> categoria real
   ...> );

sqlite> create table pedido(
   ...> id integer PRIMARY KEY AUTOINCREMENT,
   ...> total real,
   ...> fecha text,
   ...> id_cliente integer REFERENCES cliente(id),
   ...> id_comercial integer REFERENCES comercial(id)
   ...> );



--- Realizamos los insert
INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);



---Realizamos las consultas


---Consultas sobre una sola tabla

---Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
sqlite> SELECT * from pedido ORDER BY fecha DESC;
/* ┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘ */

---Devuelve todos los datos de los dos pedidos de mayor valor.
sqlite> SELECT * FROM pedido ORDER by total desc LIMIT 2;
/* ┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘ */

---Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
sqlite> SELECT DISTINCT id_cliente from pedido;
/* ┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘ */

---Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
sqlite> SELECT * from pedido where fecha regexp "^2017" and total > 500;
/* ┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘ */

---Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
sqlite> SELECT nombre, apellido1, apellido2 from comercial where categoria BETWEEN 0.05 and 0.11;
/* ┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Diego   │ Flores    │ Salas     │
│ Antonio │ Vega      │ Hernández │
│ Alfredo │ Ruiz      │ Flores    │
└─────────┴───────────┴───────────┘ */

---Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
sqlite> SELECT max(categoria) from comercial;
/* ┌────────────────┐┌────────────────────────────────┬─────────────────┐
│         nombre_cliente         │     nombre      │
├────────────────────────────────┼─────────────────┤
│ GoldFish Garden                │ Walter Santiago │
│ GoldFish Garden                │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Tendo Garden                   │ Lorena          │
│ Beragua                        │ Emmanuel        │
│ Naturagua                      │ Emmanuel        │
│ Camunas Jardines S.L.          │ Mariano         │
│ Dardena S.A.                   │ Mariano         │
│ Jardin de Flores               │ Julian          │
│ Jardin de Flores               │ Julian          │
│ Flores Marivi                  │ Felipe          │
│ Golf S.A.                      │ José Manuel     │
│ Sotogrande                     │ José Manuel     │
│ Jardines y Mansiones Cactus SL │ Lucio           │
│ Jardinerías Matías SL          │ Lucio           │
│ Agrojardin                     │ Julian          │
│ Jardineria Sara                │ Felipe          │
│ Tutifruti S.A                  │ Mariko          │
│ El Jardin Viviente S.L         │ Mariko          │
└────────────────────────────────┴─────────────────┘
│ max(categoria) │
├────────────────┤
│ 0.15           │
└────────────────┘ */

---Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
sqlite> SELECT id, nombre, apellido1 from cliente where apellido2 is not null ORDER BY nombre;
/* ┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │
│ 2  │ Adela     │ Salas     │
│ 3  │ Adolfo    │ Rubio     │
│ 10 │ Daniel    │ Santana   │
│ 9  │ Guillermo │ López     │
│ 5  │ Marcos    │ Loyola    │
│ 6  │ María     │ Santana   │
│ 8  │ Pepe      │ Ruiz      │
└────┴───────────┴───────────┘ */

sqlite> SELECT id, nombre, apellido1 from cliente where apellido2 is not null ORDER BY apellido1;
/* ┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 6  │ María     │ Santana   │
│ 10 │ Daniel    │ Santana   │
└────┴───────────┴───────────┘ */

---Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
sqlite> SELECT nombre from cliente where nombre LIKE "A%n" or nombre REGEXP "^P" ORDER by nombre;
/* ┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘ */

---Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
sqlite> SELECT nombre from cliente where nombre not like "A%" ORDER BY nombre;
/* ┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘ */

---Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
sqlite> SELECT DISTINCT nombre from comercial where nombre REGEXP "o$";
/* ┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘ */



---Consultas multitabla con JOIN

---Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
sqlite> SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 from cliente as c JOIN pedido as p on p.id_cliente=c.id ORDER by c.nombre;
/* ┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘ */

---Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
sqlite> SELECT c.*, p.id, p.total, p.fecha, p.id_comercial from cliente as c JOIN pedido as p on p.id_cliente=c.id ORDER by c.nombre;
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼──────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 5            │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 5            │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 5            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 1            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 1            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 1            │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 7            │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 6            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 2            │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 2            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 1            │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 1            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 3            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 3            │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 2            │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴──────────────┘ */

---Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
sqlite> SELECT co.*, p.id, p.fecha, p.total, p.id_cliente from comercial as co JOIN pedido as p on co.id=p.id_comercial ORDER BY co.nombre;
/* ┌────┬─────────┬───────────┬───────────┬───────────┬────┬────────────┬─────────┬────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │   fecha    │  total  │ id_cliente │
├────┼─────────┼───────────┼───────────┼───────────┼────┼────────────┼─────────┼────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 2016-09-10 │ 270.65  │ 1          │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 2016-08-17 │ 75.29   │ 3          │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 2019-03-11 │ 370.85  │ 1          │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2019-03-11 │ 2389.23 │ 1          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 2017-10-05 │ 65.26   │ 2          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2016-07-27 │ 2400.6  │ 7          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 2015-09-10 │ 5760.0  │ 2          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 2017-04-25 │ 3045.6  │ 2          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 2019-01-25 │ 545.75  │ 6          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 2017-02-02 │ 145.82  │ 6          │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 2016-08-17 │ 110.5   │ 8          │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2016-10-10 │ 2480.4  │ 8          │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 2017-10-05 │ 150.5   │ 5          │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 2017-09-10 │ 948.5   │ 5          │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 2015-06-27 │ 250.45  │ 8          │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 2017-10-10 │ 1983.43 │ 4          │
└────┴─────────┴───────────┴───────────┴───────────┴────┴────────────┴─────────┴────────────┘ */

---Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
sqlite> SELECT c.*, co.*, p.id, p.fecha, p.total from cliente as c JOIN pedido as p JOIN comercial as co on p.id_cliente=c.id and p.id_comercial=co.id;
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬───────────┬───────────┬───────────┬────┬────────────┬─────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │   fecha    │  total  │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼───────────┼───────────┼───────────┼────┼────────────┼─────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 2017-10-05 │ 150.5   │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 2016-09-10 │ 270.65  │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 2017-10-05 │ 65.26   │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 2016-08-17 │ 110.5   │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 2017-09-10 │ 948.5   │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2016-07-27 │ 2400.6  │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 2015-09-10 │ 5760.0  │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 2017-10-10 │ 1983.43 │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2016-10-10 │ 2480.4  │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 2015-06-27 │ 250.45  │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 2016-08-17 │ 75.29   │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 2017-04-25 │ 3045.6  │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 2019-01-25 │ 545.75  │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 2017-02-02 │ 145.82  │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 2019-03-11 │ 370.85  │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2019-03-11 │ 2389.23 │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴───────────┴───────────┴───────────┴────┴────────────┴─────────┘ */

---Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
sqlite> SELECT c.* from cliente as c JOIN pedido as p on p.id_cliente=c.id where p.total BETWEEN 300 and 1000;
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘ */

---Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
sqlite> SELECT co.nombre, co.apellido1, co.apellido2 from comercial as co JOIN pedido as p JOIN cliente as c on p.id_cliente=c.id and co.id=p.id_comercial where c.nombre="María";
/* ┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘ */

---Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
sqlite> SELECT c.nombre from cliente as c JOIN pedido as p JOIN comercial as co on co.id=p.id_comercial and c.id=p.id_cliente WHERE co.nombre="Daniel" and co.apellido1="Sáez" and co.apellido2="Vega";
/* ┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ Adela  │
│ Adela  │
│ María  │
│ María  │
└────────┘ */



---Consultas con LEFT y RIGHT join.

---Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
sqlite> SELECT c.*, p.id, p.total, p.fecha, p.id_comercial from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id ORDER by c.apellido1, c.apellido2, c.nombre;
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬──────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_comercial │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼──────────────┤
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 2            │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 2            │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │    │         │            │              │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 5            │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 5            │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 5            │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 7            │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 1            │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 3            │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 2            │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 3            │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 1            │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 1            │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 1            │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │    │         │            │              │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 1            │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 1            │
│ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 6            │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴──────────────┘ */

---Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
sqlite> SELECT co.*, p.id, p.total, p.fecha, p.id_cliente from comercial as co LEFT JOIN pedido as p on co.id=p.id_comercial ORDER BY co.apellido1, co.apellido2, co.nombre;
/* ┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │    │         │            │            │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │    │         │            │            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┘ */

---Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
sqlite> SELECT c.* from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id where p.id is null;
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘ */

---Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
sqlite> SELECT co.* from comercial as co LEFT JOIN pedido as p on p.id_comercial=co.id where p.id is null;
/* ┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘ */

---Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
sqlite> SELECT c.* from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id where p.id is null union SELECT co.* from comercial as co LEFT JOIN pedido as p on p.id_comercial=co.id where p.id is null;
/* ┌───────────┬───────────┬─────────┐
│  nombre   │ apellido1 │ apellido2 │
├───────────┼───────────┼─────────┤
│ Alfredo   │ Ruiz      │ Flores  │
│ Daniel    │ Santana   │ Loyola  │
│ Guillermo │ López     │ Gómez   │
│ Marta     │ Herrera   │ Gil     │
└───────────┴───────────┴─────────┘
 */
--- Consultas resumen

---Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
sqlite> SELECT sum(total) from pedido;
/* ┌────────────┐
│ sum(total) │
├────────────┤
│ 20992.83   │
└────────────┘ */

---Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
sqlite> SELECT avg(total) from pedido;
/* ┌─────────────┐
│ avg(total)  │
├─────────────┤
│ 1312.051875 │
└─────────────┘ */

---Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
sqlite> SELECT count(*) from (SELECT DISTINCT id_comercial from pedido);
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 6        │
└──────────┘ */

---Calcula el número total de clientes que aparecen en la tabla cliente.
sqlite> SELECT count(id) FROM cliente;
/* ┌───────────┐
│ count(id) │
├───────────┤
│ 10        │
└───────────┘ */

---Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
sqlite> SELECT max(total) from pedido;
/* ┌────────────┐
│ max(total) │
├────────────┤
│ 5760.0     │
└────────────┘ */

---Calcula cuál es la menor cantidad que aparece en la tabla pedido.
sqlite> SELECT min(total) from pedido;
/* ┌────────────┐
│ min(total) │
├────────────┤
│ 65.26      │
└────────────┘ */

---Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
sqlite> SELECT max(categoria), ciudad from cliente GROUP BY ciudad;
/* ┌────────────────┬─────────┐
│ max(categoria) │ ciudad  │
├────────────────┼─────────┤
│ 200            │ Almería │
│ 100            │ Cádiz   │
│ 225            │ Granada │
│ 200            │ Huelva  │
│ 300            │ Jaén    │
│ 300            │ Sevilla │
└────────────────┴─────────┘ */

---Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
sqlite> SELECT c.nombre, c.apellido1, c.apellido2, p.fecha, max(p.total) FROM cliente as c JOIN pedido as p on p.id_cliente=c.id GROUP BY p.fecha;
/* ┌────────┬───────────┬───────────┬────────────┬──────────────┐
│ nombre │ apellido1 │ apellido2 │   fecha    │ max(p.total) │
├────────┼───────────┼───────────┼────────────┼──────────────┤
│ Pepe   │ Ruiz      │ Santana   │ 2015-06-27 │ 250.45       │
│ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0       │
│ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6       │
│ Pepe   │ Ruiz      │ Santana   │ 2016-08-17 │ 110.5        │
│ Aarón  │ Rivero    │ Gómez     │ 2016-09-10 │ 270.65       │
│ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4       │
│ María  │ Santana   │ Moreno    │ 2017-02-02 │ 145.82       │
│ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6       │
│ Marcos │ Loyola    │ Méndez    │ 2017-09-10 │ 948.5        │
│ Marcos │ Loyola    │ Méndez    │ 2017-10-05 │ 150.5        │
│ Adrián │ Suárez    │           │ 2017-10-10 │ 1983.43      │
│ María  │ Santana   │ Moreno    │ 2019-01-25 │ 545.75       │
│ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23      │
└────────┴───────────┴───────────┴────────────┴──────────────┘ */

---Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
sqlite> SELECT c.nombre, c.apellido1, c.apellido2, p.fecha, max(p.total) FROM cliente as c JOIN pedido as p on p.id_cliente=c.id GROUP BY p.fecha HAVING max(p.total) > 2000;
/* ┌────────┬───────────┬───────────┬────────────┬──────────────┐
│ nombre │ apellido1 │ apellido2 │   fecha    │ max(p.total) │
├────────┼───────────┼───────────┼────────────┼──────────────┤
│ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0       │
│ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6       │
│ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4       │
│ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6       │
│ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23      │
└────────┴───────────┴───────────┴────────────┴──────────────┘ */

---Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
sqlite> SELECT co.id, co.nombre, co.apellido1, co.apellido2, max(p.total) from comercial as co JOIN pedido as p on p.id_comercial=co.id WHERE p.fecha="2016-08-17" GROUP BY co.nombre;
/* ┌────┬─────────┬───────────┬───────────┬──────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ max(p.total) │
├────┼─────────┼───────────┼───────────┼──────────────┤
│ 7  │ Antonio │ Vega      │ Hernández │ 75.29        │
│ 3  │ Diego   │ Flores    │ Salas     │ 110.5        │
└────┴─────────┴───────────┴───────────┴──────────────┘ */

---Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, count(p.id) from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id GROUP BY c.id;
/* ┌────┬───────────┬───────────┬───────────┬─────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ count(p.id) │
├────┼───────────┼───────────┼───────────┼─────────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ 3           │
│ 2  │ Adela     │ Salas     │ Díaz      │ 3           │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ 1           │
│ 4  │ Adrián    │ Suárez    │           │ 1           │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ 2           │
│ 6  │ María     │ Santana   │ Moreno    │ 2           │
│ 7  │ Pilar     │ Ruiz      │           │ 1           │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ 3           │
│ 9  │ Guillermo │ López     │ Gómez     │ 0           │
│ 10 │ Daniel    │ Santana   │ Loyola    │ 0           │
└────┴───────────┴───────────┴───────────┴─────────────┘ */

---Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, count(p.id) from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id where p.fecha regexp "^2017" GROUP BY c.id;
/* ┌────┬────────┬───────────┬───────────┬─────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ count(p.id) │
├────┼────────┼───────────┼───────────┼─────────────┤
│ 2  │ Adela  │ Salas     │ Díaz      │ 2           │
│ 4  │ Adrián │ Suárez    │           │ 1           │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2           │
│ 6  │ María  │ Santana   │ Moreno    │ 1           │
└────┴────────┴───────────┴───────────┴─────────────┘ */

---Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, max(p.total) from cliente as c LEFT JOIN pedido as p on p.id_cliente=c.id GROUP BY c.id;
/* ┌────┬───────────┬───────────┬───────────┬──────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ max(p.total) │
├────┼───────────┼───────────┼───────────┼──────────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ 2389.23      │
│ 2  │ Adela     │ Salas     │ Díaz      │ 5760.0       │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ 75.29        │
│ 4  │ Adrián    │ Suárez    │           │ 1983.43      │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ 948.5        │
│ 6  │ María     │ Santana   │ Moreno    │ 545.75       │
│ 7  │ Pilar     │ Ruiz      │           │ 2400.6       │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ 2480.4       │
│ 9  │ Guillermo │ López     │ Gómez     │              │
│ 10 │ Daniel    │ Santana   │ Loyola    │              │
└────┴───────────┴───────────┴───────────┴──────────────┘ */

---Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
sqlite> SELECT fecha, max(total) from pedido GROUP by substr(fecha,1,4);
/* ┌────────────┬────────────┐
│   fecha    │ max(total) │
├────────────┼────────────┤
│ 2015-09-10 │ 5760.0     │
│ 2016-10-10 │ 2480.4     │
│ 2017-04-25 │ 3045.6     │
│ 2019-03-11 │ 2389.23    │
└────────────┴────────────┘ */

---Devuelve el número total de pedidos que se han realizado cada año.
sqlite> SELECT substr(fecha,1,4), count(*) from pedido GROUP by substr(fecha,1,4);
/* ┌───────────────────┬──────────┐
│ substr(fecha,1,4) │ count(*) │
├───────────────────┼──────────┤
│ 2015              │ 2        │
│ 2016              │ 5        │
│ 2017              │ 6        │
│ 2019              │ 3        │
└───────────────────┴──────────┘ */



---Subconsultas

---Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
sqlite> SELECT * from pedido where id_cliente=(SELECT id from cliente where nombre="Adela" and apellido1="Salas" and apellido2="Díaz");
/* ┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘ */

---Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
sqlite> SELECT count(*) from pedido where id_comercial=(SELECT id from comercial where nombre="Daniel" and apellido1="Sáez" and apellido2="Vega");
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 6        │
└──────────┘ */

---Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
sqlite> SELECT * from cliente where id=(SELECT id_cliente from pedido where total=(SELECT max(total) FROM pedido where fecha regexp "^2019"));
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘ */

---Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
sqlite> SELECT fecha, min(total) from pedido WHERE id_cliente=(SELECT id from cliente where nombre="Pepe" and apellido1="Ruiz" AND apellido2="Santana");
/* ┌────────────┬────────────┐
│   fecha    │ min(total) │
├────────────┼────────────┤
│ 2016-08-17 │ 110.5      │
└────────────┴────────────┘ */

---Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
sqlite> SELECT c.*, p.* from cliente as c JOIN pedido as p on p.id_cliente=c.id where p.total >=(SELECT avg(total) from pedido where fecha regexp "^2017") and p.fecha regexp "^2017";
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘ */



---Subconsultas con IN y NOT IN

---Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
sqlite> SELECT * from cliente where id not in (SELECT id_cliente from pedido);
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘ */

---Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
sqlite> SELECT * from comercial where id not in (SELECT id_comercial from pedido);
/* ┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘ */



---Subconsultas con exist y not exist

---Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT * from cliente where not EXISTS (SELECT id_cliente from pedido where cliente.id=pedido.id_cliente);
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘ */

---Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT * from comercial where not EXISTS (SELECT id_comercial from pedido where comercial.id=pedido.id_comercial);
/* ┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘ */