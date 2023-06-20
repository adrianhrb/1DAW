-- ----------------------------------------
-- Consultas sobre una tabla (0,5 punto)
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.
sqlite> SELECT * from compra ORDER by fecha desc;
/* ┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘ */

-- 2. Devuelve todos los datos de los dos compras de mayor valor.
sqlite> SELECT * from compra ORDER BY total desc LIMIT 2;
/* ┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘ */

-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos
sqlite> SELECT DISTINCT id_consumidor from compra;
/* ┌───────────────┐
│ id_consumidor │
├───────────────┤
│ 5             │
│ 1             │
│ 2             │
│ 8             │
│ 7             │
│ 4             │
│ 3             │
│ 6             │
└───────────────┘. */
-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.
sqlite> SELECT * from compra where fecha REGEXP "^2020" and total > 500;
/* ┌────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
└────┴─────────┴────────────┴───────────────┴──────────────────┘ */

-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.
sqlite> SELECT nombre, apellido1, apellido2 from suministrador where categoria BETWEEN 0.11 and 0.15;
/* ┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Daniel  │ Sáez      │ Vega      │
│ Juan    │ Gómez     │ López     │
│ Diego   │ Flores    │ Salas     │
│ Marta   │ Herrera   │ Gil       │
│ Antonio │ Carretero │ Ortega    │
│ Manuel  │ Domínguez │ Hernández │
│ Antonio │ Vega      │ Hernández │
└─────────┴───────────┴───────────┘ */

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.
sqlite> SELECT max(categoria) from suministrador;
/* ┌────────────────┐
│ max(categoria) │
├────────────────┤
│ 0.15           │
└────────────────┘ */

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
sqlite> SELECT id, nombre, apellido1 from consumidor where apellido2 is not null ORDER by apellido1, nombre;
/* ┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 10 │ Daniel    │ Santana   │
│ 6  │ María     │ Santana   │
└────┴───────────┴───────────┘ */

-- 8. Devuelve un listado de los nombres de los consumidores que empiezan por A o P. (Con expresioón regular)
-- El listado deberá estar ordenado alfabéticamente.
sqlite> SELECT nombre from consumidor where nombre REGEXP "^A" or nombre REGEXP "^P" ORDER by nombre;
/* ┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adela  │
│ Adolfo │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘ */

-- 9. Devuelve un listado de los nombres de los consumidores que no empiezan por M.
-- El listado deberá estar ordenado alfabéticamente.
sqlite> SELECT nombre from consumidor where nombre not like "M%" ORDER by nombre;
/* ┌───────────┐
│  nombre   │
├───────────┤
│ Aarón     │
│ Adela     │
│ Adolfo    │
│ Adrián    │
│ Daniel    │
│ Guillermo │
│ Pepe      │
│ Pilar     │
└───────────┘ */

-- 10. Devuelve un listado con los nombres de los suministradores que terminan en o.
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.
sqlite> SELECT DISTINCT nombre FROM suministrador where nombre REGEXP "o$";
/* ┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘ */

-- OBLIGATORIO APROBAR ESTA PARTE (INNER´S)

-- -----------------------------------------------
-- Consultas multitabla (INNER JOIN) (0,7 puntos)
-- -----------------------------------------------

-- 11. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
sqlite> SELECT DISTINCT con.id, con.nombre, con.apellido1, con.apellido2 from consumidor as con INNER JOIN compra as c on c.id_consumidor=con.id ORDER by con.nombre;
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

-- 12. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
sqlite> SELECT con.nombre,con.apellido1, con.apellido2, con.ciudad, con.categoria, c.* from consumidor as con INNER JOIN compra as c on c.id_consumidor=con.id ORDER by con.nombre;
/* ┌────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
│ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
└────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘ */

-- 13. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
sqlite> SELECT s.*, c.id, c.total, c.fecha,c.id_consumidor from suministrador as s INNER JOIN compra as c on c.id_suministrador=s.id ORDER by s.nombre;
/* ┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬───────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_consumidor │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼───────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2019-09-10 │ 1             │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2019-08-17 │ 3             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2022-03-11 │ 1             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2022-03-11 │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2020-10-05 │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2019-07-27 │ 7             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2018-09-10 │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2020-04-25 │ 2             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2022-01-25 │ 6             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2020-02-02 │ 6             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2019-08-17 │ 8             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2019-10-10 │ 8             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2020-10-05 │ 5             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2020-09-10 │ 5             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2018-06-27 │ 8             │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2020-10-10 │ 4             │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴───────────────┘ */

-- 14. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
sqlite> SELECT con.*, c.id, c.total, c.fecha, s.* from suministrador as s INNER JOIN compra as c on c.id_suministrador=s.id JOIN consumidor as con on con.id=c.id_consumidor;
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2019-09-10 │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2020-10-05 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2019-08-17 │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2019-07-27 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2018-09-10 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2019-10-10 │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2018-06-27 │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2019-08-17 │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2022-01-25 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2022-03-11 │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2022-03-11 │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────┴─────────┴───────────┴───────────┴───────────┘ */

-- 15. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
sqlite> SELECT con.* from consumidor as con INNER JOIN compra as c on c.id_consumidor=con.id where c.fecha REGEXP "^2020" and c.total BETWEEN 300 and 1000;
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘ */
-- 16. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
sqlite> SELECT DISTINCT s.nombre, s.apellido1, s.apellido2 from suministrador as s INNER JOIN compra as c on c.id_suministrador=s.id JOIN consumidor as con on con.id=c.id_consumidor where con.nombre="María" and con.apellido1="Santana" and con.apellido2="Moreno";
/* ┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘ */

-- 17. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
sqlite> SELECT DISTINCT con.nombre, con.apellido1, con.apellido2 from consumidor as con INNER JOIN compra as c on c.id_consumidor=con.id JOIN suministrador as s on s.id=c.id_suministrador where s.nombre="Daniel" and s.apellido1="Sáez" and s.apellido2="Vega";
/* ┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Adela  │ Salas     │ Díaz      │
│ Pilar  │ Ruiz      │           │
│ María  │ Santana   │ Moreno    │
└────────┴───────────┴───────────┘ */

-- ----------------------------------------------------------
-- Consultas multitabla (LEFT JOIN y RIGHT JOIN) (0,3 puntos)
-- ----------------------------------------------------------

-- 18. Devuelve un listado con todos los consumidores junto con los datos de las compras que han realizado.
-- Este listado también debe incluir los consumidores que no han realizado ningún compra.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los consumidores.
sqlite> SELECT con.*, c.* from consumidor as con LEFT JOIN compra as c on c.id_consumidor=con.id ORDER BY con.apellido1, con.apellido2, con.nombre;
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │    │         │            │               │                  │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
│ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │    │         │            │               │                  │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘ */

-- 19. Devuelve un listado con todos los suministradores junto con los datos de las compras que han realizado.
-- Este listado también debe incluir los suministradores que no han realizado ningún compra.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los suministradores.
sqlite> SELECT s.*, c.* from suministrador as s LEFT JOIN compra as c on c.id_suministrador=s.id ORDER by s.apellido1, s.apellido2, s.nombre;
/* ┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2019-09-10 │ 1             │ 5                │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2022-03-11 │ 1             │ 5                │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2022-03-11 │ 1             │ 5                │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2019-08-17 │ 8             │ 3                │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2019-10-10 │ 8             │ 3                │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2020-10-05 │ 5             │ 2                │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2018-06-27 │ 8             │ 2                │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2020-09-10 │ 5             │ 2                │
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │    │         │            │               │                  │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │    │         │            │               │                  │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2020-10-05 │ 2             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2020-02-02 │ 6             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2022-01-25 │ 6             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2019-07-27 │ 7             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2018-09-10 │ 2             │ 1                │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2019-08-17 │ 3             │ 7                │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘ */

-- 20. Devuelve un listado que solamente muestre los consumidores que no han realizado ningún compra.
sqlite> SELECT con.* from consumidor as con LEFT JOIN compra as c on c.id_consumidor=con.id where c.id_consumidor is null;
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘ */

-- ---------------------------
-- Consultas resumen (1 punto)
-- ---------------------------

-- 21. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
sqlite> SELECT avg(total) from compra;
/* ┌─────────────┐
│ avg(total)  │
├─────────────┤
│ 1312.051875 │
└─────────────┘ */

-- 22. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
sqlite> SELECT count(DISTINCT id_suministrador) from compra;
/* ┌──────────────────────────────────┐
│ count(DISTINCT id_suministrador) │
├──────────────────────────────────┤
│ 6                                │
└──────────────────────────────────┘ */


-- 23. Calcula el número total de consumidores que aparecen en la tabla consumidor.
sqlite> SELECT count(*) from consumidor;
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 10       │
└──────────┘
 */
-- 24. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
sqlite> SELECT max(total) from compra;
/* ┌────────────┐
│ max(total) │
├────────────┤
│ 5760.0     │
└────────────┘ */

-- 25. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.
sqlite> SELECT ciudad, max(categoria) from consumidor GROUP by ciudad;
/* ┌─────────┬────────────────┐
│ ciudad  │ max(categoria) │
├─────────┼────────────────┤
│ Almería │ 200            │
│ Cádiz   │ 100            │
│ Granada │ 225            │
│ Huelva  │ 200            │
│ Jaén    │ 300            │
│ Sevilla │ 300            │
└─────────┴────────────────┘ */

-- 26. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.
sqlite> SELECT con.nombre,con.apellido1, con.apellido2, c.fecha, max(c.total) from consumidor as con JOIN compra as c on c.id_consumidor=con.id GROUP by c.fecha;
/* ┌────────┬───────────┬───────────┬────────────┬──────────────┐
│ nombre │ apellido1 │ apellido2 │   fecha    │ max(c.total) │
├────────┼───────────┼───────────┼────────────┼──────────────┤
│ Pepe   │ Ruiz      │ Santana   │ 2018-06-27 │ 250.45       │
│ Adela  │ Salas     │ Díaz      │ 2018-09-10 │ 5760.0       │
│ Pilar  │ Ruiz      │           │ 2019-07-27 │ 2400.6       │
│ Pepe   │ Ruiz      │ Santana   │ 2019-08-17 │ 110.5        │
│ Aarón  │ Rivero    │ Gómez     │ 2019-09-10 │ 270.65       │
│ Pepe   │ Ruiz      │ Santana   │ 2019-10-10 │ 2480.4       │
│ María  │ Santana   │ Moreno    │ 2020-02-02 │ 145.82       │
│ Adela  │ Salas     │ Díaz      │ 2020-04-25 │ 3045.6       │
│ Marcos │ Loyola    │ Méndez    │ 2020-09-10 │ 948.5        │
│ Marcos │ Loyola    │ Méndez    │ 2020-10-05 │ 150.5        │
│ Adrián │ Suárez    │           │ 2020-10-10 │ 1983.43      │
│ María  │ Santana   │ Moreno    │ 2022-01-25 │ 545.75       │
│ Aarón  │ Rivero    │ Gómez     │ 2022-03-11 │ 2389.23      │
└────────┴───────────┴───────────┴────────────┴──────────────┘
 */
-- 27. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.
sqlite> SELECT con.nombre,con.apellido1, con.apellido2, c.fecha, max(c.total) from consumidor as con JOIN compra as c on c.id_consumidor=con.id GROUP by c.fecha HAVING max(c.total) > 2000;
/* ┌────────┬───────────┬───────────┬────────────┬──────────────┐
│ nombre │ apellido1 │ apellido2 │   fecha    │ max(c.total) │
├────────┼───────────┼───────────┼────────────┼──────────────┤
│ Adela  │ Salas     │ Díaz      │ 2018-09-10 │ 5760.0       │
│ Pilar  │ Ruiz      │           │ 2019-07-27 │ 2400.6       │
│ Pepe   │ Ruiz      │ Santana   │ 2019-10-10 │ 2480.4       │
│ Adela  │ Salas     │ Díaz      │ 2020-04-25 │ 3045.6       │
│ Aarón  │ Rivero    │ Gómez     │ 2022-03-11 │ 2389.23      │
└────────┴───────────┴───────────┴────────────┴──────────────┘ */

-- 28. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.
sqlite> SELECT s.id, s.nombre, s.apellido1, s.apellido2, max(c.total), c.fecha from suministrador as s JOIN compra as c on c.id_suministrador=s.id where c.fecha="2020-08-17" GROUP by s.nombre;

-- 29. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
sqlite> SELECT con.id, con.nombre, con.apellido1, con.apellido2, count(c.id) from consumidor as con LEFT JOIN compra as c on c.id_consumidor = con.id GROUP by con.id;
/* ┌────┬───────────┬───────────┬───────────┬─────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ count(c.id) │
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
-- 30. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.
sqlite> SELECT con.id, con.nombre, con.apellido1, con.apellido2, count(c.id) from consumidor as con LEFT JOIN compra as c on c.id_consumidor = con.id where c.fecha like "2020%" GROUP by con.id;
/* ┌────┬────────┬───────────┬───────────┬─────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ count(c.id) │
├────┼────────┼───────────┼───────────┼─────────────┤
│ 2  │ Adela  │ Salas     │ Díaz      │ 2           │
│ 4  │ Adrián │ Suárez    │           │ 1           │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2           │
│ 6  │ María  │ Santana   │ Moreno    │ 1           │
└────┴────────┴───────────┴───────────┴─────────────┘ */

-- 31. Devuelve cuál ha sido el compra de máximo valor que se ha realizado cada año.
sqlite> SELECT substr(fecha, 1, 4), max(total) from compra GROUP by substr(fecha, 1, 4);
/* ┌─────────────────────┬────────────┐
│ substr(fecha, 1, 4) │ max(total) │
├─────────────────────┼────────────┤
│ 2018                │ 5760.0     │
│ 2019                │ 2480.4     │
│ 2020                │ 3045.6     │
│ 2022                │ 2389.23    │
└─────────────────────┴────────────┘ */

-- OBLIGATORIO APROBAR ESTA PARTE (SUBCONSULTAS)

-- ---------------------
-- Subconsultas(1 punto)
-- ---------------------

--- Con operadores básicos de comparación

-- 32. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
sqlite> SELECT * from compra where id_consumidor = (SELECT id from consumidor where nombre="Adela" and apellido1="Salas" and apellido2="Díaz");
/* ┌────┬────────┬────────────┬───────────────┬──────────────────┐
│ id │ total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼────────────┼───────────────┼──────────────────┤
│ 3  │ 65.26  │ 2020-10-05 │ 2             │ 1                │
│ 7  │ 5760.0 │ 2018-09-10 │ 2             │ 1                │
│ 12 │ 3045.6 │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴────────────┴───────────────┴──────────────────┘ */

-- 33. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.ç
sqlite> SELECT fecha, min(total) FROM compra where id_consumidor = (SELECT id from consumidor where nombre="Pepe" and apellido1="Ruiz" and apellido2="Santana");
/* ┌────────────┬────────────┐
│   fecha    │ min(total) │
├────────────┼────────────┤
│ 2019-08-17 │ 110.5      │
└────────────┴────────────┘ */

-- 34. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
sqlite> SELECT count(*) from (SELECT* from compra where id_suministrador = (SELECT id from suministrador where nombre="Daniel" and apellido1="Sáez" and apellido2="Vega"));
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 6        │
└──────────┘ */
-- 35. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
sqlite> SELECT * from consumidor where id=(SELECT id_consumidor from compra where total=(SELECT max(total) from compra where fecha REGEXP "^2021"));

-- 36. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.
sqlite> SELECT con.*, c.* from consumidor as con JOIN compra as c on c.id_consumidor=con.id where c.fecha REGEXP "^2020" and c.total >= (SELECT avg(total) from compra where fecha REGEXP "^2020");
/* ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬───────────────┬──────────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_consumidor │ id_suministrador │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼───────────────┼──────────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2020-10-10 │ 4             │ 6                │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2020-04-25 │ 2             │ 1                │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴───────────────┴──────────────────┘ */

-- 37. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
sqlite> SELECT * from consumidor where id not in (SELECT id_consumidor from compra);
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘ */

-- 38. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
sqlite> SELECT * from suministrador where id not in (SELECT id_suministrador from compra);
/* ┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘ */

-- 39. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT * from consumidor where not EXISTS (SELECT id_consumidor from compra where consumidor.id=compra.id_consumidor);
/* ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘ */

-- 40. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT * from suministrador where not EXISTS (SELECT id_suministrador from compra where suministrador.id=compra.id_suministrador);
/* ┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘ */