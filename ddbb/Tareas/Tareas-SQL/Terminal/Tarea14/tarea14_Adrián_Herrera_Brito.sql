--- Realizamos la creación de la base de datos
sqlite> create TABLE departamento(
   ...> codigo INT PRIMARY KEY,
   ...> nombre text,
   ...> presupuesto real,
   ...> gastos real
   ...> );
sqlite> CREATE TABLE empleado(
   ...> codigo INT PRIMARY KEY,
   ...> nif int,
   ...> nombre text,
   ...> apellido1 text,
   ...> apellido2 text,
   ...> codigo_departamento INT REFERENCES departamento(codigo)
   ...> );


---Realizamos los insert
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);


--- Pasamos a las consultas:

/* CONSULTAS SOBRE UNA TABLA */

---Lista el primer apellido de todos los empleados.
sqlite> SELECT apellido1 from empleado;
/* ┌───────────┐
│ apellido1 │
├───────────┤
│ Rivero    │
│ Salas     │
│ Rubio     │
│ Suárez    │
│ Loyola    │
│ Santana   │
│ Ruiz      │
│ Ruiz      │
│ Gómez     │
│ Flores    │
│ Herrera   │
│ Salas     │
│ Sáez      │
└───────────┘ */

---Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
sqlite> SELECT DISTINCT apellido1 from empleado;
/* ┌───────────┐
│ apellido1 │
├───────────┤
│ Rivero    │
│ Salas     │
│ Rubio     │
│ Suárez    │
│ Loyola    │
│ Santana   │
│ Ruiz      │
│ Gómez     │
│ Flores    │
│ Herrera   │
│ Sáez      │
└───────────┘ */

---Lista todas las columnas de la tabla empleado.
sqlite> SELECT * from empleado;
/* ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┤
│ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1                   │
│ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2                   │
│ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3                   │
│ 4      │ 77705545E │ Adrián       │ Suárez    │           │ 4                   │
│ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5                   │
│ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1                   │
│ 7      │ 80576669X │ Pilar        │ Ruiz      │           │ 2                   │
│ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3                   │
│ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2                   │
│ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5                   │
│ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1                   │
│ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │
│ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │
└────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┘ */

---Lista el nombre y los apellidos de todos los empleados.
sqlite> SELECT nombre, apellido1, apellido2 from empleado;
/* ┌──────────────┬───────────┬───────────┐
│    nombre    │ apellido1 │ apellido2 │
├──────────────┼───────────┼───────────┤
│ Aarón        │ Rivero    │ Gómez     │
│ Adela        │ Salas     │ Díaz      │
│ Adolfo       │ Rubio     │ Flores    │
│ Adrián       │ Suárez    │           │
│ Marcos       │ Loyola    │ Méndez    │
│ María        │ Santana   │ Moreno    │
│ Pilar        │ Ruiz      │           │
│ Pepe         │ Ruiz      │ Santana   │
│ Juan         │ Gómez     │ López     │
│ Diego        │ Flores    │ Salas     │
│ Marta        │ Herrera   │ Gil       │
│ Irene        │ Salas     │ Flores    │
│ Juan Antonio │ Sáez      │ Guerrero  │
└──────────────┴───────────┴───────────┘ */

---Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
sqlite> SELECT codigo_departamento from empleado;
/* ┌─────────────────────┐
│ codigo_departamento │
├─────────────────────┤
│ 1                   │
│ 2                   │
│ 3                   │
│ 4                   │
│ 5                   │
│ 1                   │
│ 2                   │
│ 3                   │
│ 2                   │
│ 5                   │
│ 1                   │
│                     │
│                     │
└─────────────────────┘ */

---Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
sqlite> SELECT DISTINCT codigo_departamento from empleado;
/* ┌─────────────────────┐
│ codigo_departamento │
├─────────────────────┤
│ 1                   │
│ 2                   │
│ 3                   │
│ 4                   │
│ 5                   │
│                     │
└─────────────────────┘ */

---Lista el nombre y apellidos de los empleados en una única columna.
sqlite> SELECT (nombre ||" "||apellido1||" "||apellido2) as nombre_completo FROM empleado;
/* ┌────────────────────────────┐
│      nombre_completo       │
├────────────────────────────┤
│ Aarón Rivero Gómez         │
│ Adela Salas Díaz           │
│ Adolfo Rubio Flores        │
│                            │
│ Marcos Loyola Méndez       │
│ María Santana Moreno       │
│                            │
│ Pepe Ruiz Santana          │
│ Juan Gómez López           │
│ Diego Flores Salas         │
│ Marta Herrera Gil          │
│ Irene Salas Flores         │
│ Juan Antonio Sáez Guerrero │
└────────────────────────────┘ */
---Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
sqlite> SELECT upper(nombre ||" "||apellido1||" "||apellido2) as nombre_completo FROM empleado;
/* ┌────────────────────────────┐
│      nombre_completo       │
├────────────────────────────┤
│ AARóN RIVERO GóMEZ         │
│ ADELA SALAS DíAZ           │
│ ADOLFO RUBIO FLORES        │
│                            │
│ MARCOS LOYOLA MéNDEZ       │
│ MARíA SANTANA MORENO       │
│                            │
│ PEPE RUIZ SANTANA          │
│ JUAN GóMEZ LóPEZ           │
│ DIEGO FLORES SALAS         │
│ MARTA HERRERA GIL          │
│ IRENE SALAS FLORES         │
│ JUAN ANTONIO SáEZ GUERRERO │
└────────────────────────────┘ */

---Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
sqlite> SELECT lower(nombre ||" "||apellido1||" "||apellido2) as nombre_completo FROM empleado;
/* ┌────────────────────────────┐
│      nombre_completo       │
├────────────────────────────┤
│ aarón rivero gómez         │
│ adela salas díaz           │
│ adolfo rubio flores        │
│                            │
│ marcos loyola méndez       │
│ maría santana moreno       │
│                            │
│ pepe ruiz santana          │
│ juan gómez lópez           │
│ diego flores salas         │
│ marta herrera gil          │
│ irene salas flores         │
│ juan antonio sáez guerrero │
└────────────────────────────┘ */
---Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
sqlite> SELECT substring(nif, 1, 8), substring(nif,9,1)  from empleado;
/* ┌──────────────────────┬────────────────────┐
│ substring(nif, 1, 8) │ substring(nif,9,1) │
├──────────────────────┼────────────────────┤
│ 32481596             │ F                  │
│ Y5575632             │ D                  │
│ R6970642             │ B                  │
│ 77705545             │ E                  │
│ 17087203             │ C                  │
│ 38382980             │ M                  │
│ 80576669             │ X                  │
│ 71651431             │ Z                  │
│ 56399183             │ D                  │
│ 46384486             │ H                  │
│ 67389283             │ A                  │
│ 41234836             │ R                  │
│ 82635162             │ B                  │
└──────────────────────┴────────────────────┘ */

---Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
sqlite> SELECT nombre, presupuesto-gastos as balance from departamento;
/* ┌──────────────────┬──────────┐
│      nombre      │ balance  │
├──────────────────┼──────────┤
│ Desarrollo       │ 114000.0 │
│ Sistemas         │ 129000.0 │
│ Recursos Humanos │ 255000.0 │
│ Contabilidad     │ 107000.0 │
│ I+D              │ -5000.0  │
│ Proyectos        │ 0.0      │
│ Publicidad       │ -1000.0  │
└──────────────────┴──────────┘ */

---Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
sqlite> SELECT nombre, presupuesto from departamento ORDER by presupuesto ASC;
/* ┌──────────────────┬─────────────┐
│      nombre      │ presupuesto │
├──────────────────┼─────────────┤
│ Proyectos        │ 0.0         │
│ Publicidad       │ 0.0         │
│ Contabilidad     │ 110000.0    │
│ Desarrollo       │ 120000.0    │
│ Sistemas         │ 150000.0    │
│ Recursos Humanos │ 280000.0    │
│ I+D              │ 375000.0    │
└──────────────────┴─────────────┘ */

---Lista el nombre de todos los departamentos ordenados de forma ascendente.
sqlite> SELECT nombre from departamento ORDER by nombre ASC;
/* ┌──────────────────┐
│      nombre      │
├──────────────────┤
│ Contabilidad     │
│ Desarrollo       │
│ I+D              │
│ Proyectos        │
│ Publicidad       │
│ Recursos Humanos │
│ Sistemas         │
└──────────────────┘ */

---Lista el nombre de todos los departamentos ordenados de forma desscendente.
sqlite> SELECT nombre from departamento ORDER by nombre DESC;
/* ┌──────────────────┐
│      nombre      │
├──────────────────┤
│ Sistemas         │
│ Recursos Humanos │
│ Publicidad       │
│ Proyectos        │
│ I+D              │
│ Desarrollo       │
│ Contabilidad     │
└──────────────────┘ */

---Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
sqlite> SELECT apellido1, apellido2, nombre from empleado order by apellido1;
/* ┌───────────┬───────────┬──────────────┐
│ apellido1 │ apellido2 │    nombre    │
├───────────┼───────────┼──────────────┤
│ Flores    │ Salas     │ Diego        │
│ Gómez     │ López     │ Juan         │
│ Herrera   │ Gil       │ Marta        │
│ Loyola    │ Méndez    │ Marcos       │
│ Rivero    │ Gómez     │ Aarón        │
│ Rubio     │ Flores    │ Adolfo       │
│ Ruiz      │ Santana   │ Pepe         │
│ Ruiz      │           │ Pilar        │
│ Salas     │ Díaz      │ Adela        │
│ Salas     │ Flores    │ Irene        │
│ Santana   │ Moreno    │ María        │
│ Suárez    │           │ Adrián       │
│ Sáez      │ Guerrero  │ Juan Antonio │
└───────────┴───────────┴──────────────┘ */

sqlite> SELECT apellido1, apellido2, nombre from empleado order by nombre;
/* ┌───────────┬───────────┬──────────────┐
│ apellido1 │ apellido2 │    nombre    │
├───────────┼───────────┼──────────────┤
│ Rivero    │ Gómez     │ Aarón        │
│ Salas     │ Díaz      │ Adela        │
│ Rubio     │ Flores    │ Adolfo       │
│ Suárez    │           │ Adrián       │
│ Flores    │ Salas     │ Diego        │
│ Salas     │ Flores    │ Irene        │
│ Gómez     │ López     │ Juan         │
│ Sáez      │ Guerrero  │ Juan Antonio │
│ Loyola    │ Méndez    │ Marcos       │
│ Herrera   │ Gil       │ Marta        │
│ Santana   │ Moreno    │ María        │
│ Ruiz      │ Santana   │ Pepe         │
│ Ruiz      │           │ Pilar        │
└───────────┴───────────┴──────────────┘ */

---Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
sqlite> SELECT nombre, presupuesto from departamento ORDER by presupuesto DESC LIMIT 3;
/* ┌──────────────────┬─────────────┐
│      nombre      │ presupuesto │
├──────────────────┼─────────────┤
│ I+D              │ 375000.0    │
│ Recursos Humanos │ 280000.0    │
│ Sistemas         │ 150000.0    │
└──────────────────┴─────────────┘ */

---Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
sqlite> SELECT nombre, presupuesto from departamento ORDER by presupuesto ASC LIMIT 3;
/* ┌──────────────┬─────────────┐
│    nombre    │ presupuesto │
├──────────────┼─────────────┤
│ Proyectos    │ 0.0         │
│ Publicidad   │ 0.0         │
│ Contabilidad │ 110000.0    │
└──────────────┴─────────────┘ */

---Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
sqlite> SELECT nombre, gastos from departamento ORDER BY gastos DESC LIMIT 2;
/* ┌──────────────────┬──────────┐
│      nombre      │  gastos  │
├──────────────────┼──────────┤
│ I+D              │ 380000.0 │
│ Recursos Humanos │ 25000.0  │
└──────────────────┴──────────┘ */

---Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
sqlite> SELECT nombre, gastos from departamento ORDER BY gastos ASC LIMIT 2;
/* ┌────────────┬────────┐
│   nombre   │ gastos │
├────────────┼────────┤
│ Proyectos  │ 0.0    │
│ Publicidad │ 1000.0 │
└────────────┴────────┘ */

---Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
sqlite> SELECT * from empleado LIMIT 2, 5;
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
│ 3      │ R6970642B │ Adolfo │ Rubio     │ Flores    │ 3                   │
│ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
│ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │ 5                   │
│ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
│ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘ */

---Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
sqlite> SELECT nombre, presupuesto from departamento WHERE presupuesto >=150000;
/* ┌──────────────────┬─────────────┐
│      nombre      │ presupuesto │
├──────────────────┼─────────────┤
│ Sistemas         │ 150000.0    │
│ Recursos Humanos │ 280000.0    │
│ I+D              │ 375000.0    │
└──────────────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
sqlite> SELECT nombre, gastos from departamento WHERE gastos < 5000;
/* ┌──────────────┬────────┐
│    nombre    │ gastos │
├──────────────┼────────┤
│ Contabilidad │ 3000.0 │
│ Proyectos    │ 0.0    │
│ Publicidad   │ 1000.0 │
└──────────────┴────────┘ */

---Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
sqlite> SELECT nombre, presupuesto from departamento where presupuesto>100000 and presupuesto<200000;
/* ┌──────────────┬─────────────┐
│    nombre    │ presupuesto │
├──────────────┼─────────────┤
│ Desarrollo   │ 120000.0    │
│ Sistemas     │ 150000.0    │
│ Contabilidad │ 110000.0    │
└──────────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
sqlite> SELECT nombre, presupuesto from departamento where presupuesto not in (SELECT presupuesto from departamento where presupuesto >= 100000 and presupuesto < 200000);
/* ┌──────────────────┬─────────────┐
│      nombre      │ presupuesto │
├──────────────────┼─────────────┤
│ Recursos Humanos │ 280000.0    │
│ I+D              │ 375000.0    │
│ Proyectos        │ 0.0         │
│ Publicidad       │ 0.0         │
└──────────────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
sqlite> SELECT nombre, presupuesto from departamento where presupuesto BETWEEN 100000 and 200000;
/* ┌──────────────┬─────────────┐
│    nombre    │ presupuesto │
├──────────────┼─────────────┤
│ Desarrollo   │ 120000.0    │
│ Sistemas     │ 150000.0    │
│ Contabilidad │ 110000.0    │
└──────────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
sqlite> SELECT nombre, presupuesto from departamento where presupuesto not BETWEEN 100000 and 200000;
/* ┌──────────────────┬─────────────┐
│      nombre      │ presupuesto │
├──────────────────┼─────────────┤
│ Recursos Humanos │ 280000.0    │
│ I+D              │ 375000.0    │
│ Proyectos        │ 0.0         │
│ Publicidad       │ 0.0         │
└──────────────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
sqlite> SELECT nombre, gastos, presupuesto  from departamento where gastos > presupuesto;
/* ┌────────────┬──────────┬─────────────┐
│   nombre   │  gastos  │ presupuesto │
├────────────┼──────────┼─────────────┤
│ I+D        │ 380000.0 │ 375000.0    │
│ Publicidad │ 1000.0   │ 0.0         │
└────────────┴──────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
sqlite> SELECT nombre, gastos, presupuesto  from departamento where gastos < presupuesto;
/* ┌──────────────────┬─────────┬─────────────┐
│      nombre      │ gastos  │ presupuesto │
├──────────────────┼─────────┼─────────────┤
│ Desarrollo       │ 6000.0  │ 120000.0    │
│ Sistemas         │ 21000.0 │ 150000.0    │
│ Recursos Humanos │ 25000.0 │ 280000.0    │
│ Contabilidad     │ 3000.0  │ 110000.0    │
└──────────────────┴─────────┴─────────────┘ */

---Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
sqlite> SELECT nombre, gastos, presupuesto  from departamento where gastos = presupuesto;
/* ┌───────────┬────────┬─────────────┐
│  nombre   │ gastos │ presupuesto │
├───────────┼────────┼─────────────┤
│ Proyectos │ 0.0    │ 0.0         │
└───────────┴────────┴─────────────┘ */

---Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
sqlite> SELECT * from empleado where apellido2 is NULL;
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
│ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
│ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘ */

---Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
sqlite> SELECT * from empleado where apellido2 is not NULL;
/* ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┤
│ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1                   │
│ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2                   │
│ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3                   │
│ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5                   │
│ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1                   │
│ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3                   │
│ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2                   │
│ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5                   │
│ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1                   │
│ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │
│ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │
└────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┘ */

---Lista todos los datos de los empleados cuyo segundo apellido sea López.
sqlite> SELECT * from empleado where apellido2="López";
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
│ 9      │ 56399183D │ Juan   │ Gómez     │ López     │ 2                   │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘ */

---Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
sqlite> SELECT * from empleado where apellido2="Díaz" or apellido2="Moreno";
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
│ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
│ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘ */

---Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
sqlite> SELECT * from empleado where apellido2 in ("Díaz","Moreno");
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
│ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
│ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘ */

---Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
sqlite> SELECT nombre, apellido1, apellido2, nif from empleado where codigo_departamento=3;
/* ┌────────┬───────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │    nif    │
├────────┼───────────┼───────────┼───────────┤
│ Adolfo │ Rubio     │ Flores    │ R6970642B │
│ Pepe   │ Ruiz      │ Santana   │ 71651431Z │
└────────┴───────────┴───────────┴───────────┘ */

---Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
sqlite> SELECT nombre, apellido1, apellido2, nif from empleado where codigo_departamento in (2,4,5);
/* ┌────────┬───────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │    nif    │
├────────┼───────────┼───────────┼───────────┤
│ Adela  │ Salas     │ Díaz      │ Y5575632D │
│ Adrián │ Suárez    │           │ 77705545E │
│ Marcos │ Loyola    │ Méndez    │ 17087203C │
│ Pilar  │ Ruiz      │           │ 80576669X │
│ Juan   │ Gómez     │ López     │ 56399183D │
│ Diego  │ Flores    │ Salas     │ 46384486H │
└────────┴───────────┴───────────┴───────────┘ */





---CONSULTAS MULTITABLA (COMPOSICIÓN INTERNA)


---Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
sqlite> SELECT * from empleado as e JOIN departamento as d where d.codigo=e.codigo_departamento;
/* 1|32481596F|Aarón|Rivero|Gómez|1|1|Desarrollo|120000.0|6000.0
2|Y5575632D|Adela|Salas|Díaz|2|2|Sistemas|150000.0|21000.0
3|R6970642B|Adolfo|Rubio|Flores|3|3|Recursos Humanos|280000.0|25000.0
4|77705545E|Adrián|Suárez||4|4|Contabilidad|110000.0|3000.0
5|17087203C|Marcos|Loyola|Méndez|5|5|I+D|375000.0|380000.0
6|38382980M|María|Santana|Moreno|1|1|Desarrollo|120000.0|6000.0
7|80576669X|Pilar|Ruiz||2|2|Sistemas|150000.0|21000.0
8|71651431Z|Pepe|Ruiz|Santana|3|3|Recursos Humanos|280000.0|25000.0
9|56399183D|Juan|Gómez|López|2|2|Sistemas|150000.0|21000.0
10|46384486H|Diego|Flores|Salas|5|5|I+D|375000.0|380000.0
11|67389283A|Marta|Herrera|Gil|1|1|Desarrollo|120000.0|6000.0 */

---Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.
sqlite> SELECT * from empleado as e JOIN departamento as d where d.codigo=e.codigo_departamento ORDER by d.nombre;
/* 4|77705545E|Adrián|Suárez||4|4|Contabilidad|110000.0|3000.0
1|32481596F|Aarón|Rivero|Gómez|1|1|Desarrollo|120000.0|6000.0
6|38382980M|María|Santana|Moreno|1|1|Desarrollo|120000.0|6000.0
11|67389283A|Marta|Herrera|Gil|1|1|Desarrollo|120000.0|6000.0
5|17087203C|Marcos|Loyola|Méndez|5|5|I+D|375000.0|380000.0
10|46384486H|Diego|Flores|Salas|5|5|I+D|375000.0|380000.0
3|R6970642B|Adolfo|Rubio|Flores|3|3|Recursos Humanos|280000.0|25000.0
8|71651431Z|Pepe|Ruiz|Santana|3|3|Recursos Humanos|280000.0|25000.0
2|Y5575632D|Adela|Salas|Díaz|2|2|Sistemas|150000.0|21000.0
7|80576669X|Pilar|Ruiz||2|2|Sistemas|150000.0|21000.0
9|56399183D|Juan|Gómez|López|2|2|Sistemas|150000.0|21000.0 */


sqlite> SELECT * from empleado as e JOIN departamento as d where d.codigo=e.codigo_departamento ORDER by e.nombre;
/* 1|32481596F|Aarón|Rivero|Gómez|1|1|Desarrollo|120000.0|6000.0
2|Y5575632D|Adela|Salas|Díaz|2|2|Sistemas|150000.0|21000.0
3|R6970642B|Adolfo|Rubio|Flores|3|3|Recursos Humanos|280000.0|25000.0
4|77705545E|Adrián|Suárez||4|4|Contabilidad|110000.0|3000.0
10|46384486H|Diego|Flores|Salas|5|5|I+D|375000.0|380000.0
9|56399183D|Juan|Gómez|López|2|2|Sistemas|150000.0|21000.0
5|17087203C|Marcos|Loyola|Méndez|5|5|I+D|375000.0|380000.0
11|67389283A|Marta|Herrera|Gil|1|1|Desarrollo|120000.0|6000.0
6|38382980M|María|Santana|Moreno|1|1|Desarrollo|120000.0|6000.0
8|71651431Z|Pepe|Ruiz|Santana|3|3|Recursos Humanos|280000.0|25000.0
7|80576669X|Pilar|Ruiz||2|2|Sistemas|150000.0|21000.0 */

---Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
sqlite> SELECT DISTINCT d.codigo,d.nombre from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento;
/* 1|Desarrollo
2|Sistemas
3|Recursos Humanos
4|Contabilidad
5|I+D */

---Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
sqlite> SELECT DISTINCT d.codigo, d.nombre, d.presupuesto - d.gastos as balance from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento;
/* 1|Desarrollo|114000.0
2|Sistemas|129000.0
3|Recursos Humanos|255000.0
4|Contabilidad|107000.0
5|I+D|-5000.0 */

---Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
sqlite> SELECT d.nombre from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento where e.nif="38382980M";
/* Desarrollo */

---Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
sqlite> SELECT d.nombre from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento where e.nombre="Pepe" and e.apellido1="Ruiz" and e.apellido2="Santana";
/* Recursos Humanos */

---Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
sqlite> SELECT * from empleado as e JOIN departamento as d on d.codigo=e.codigo_departamento where d.nombre="I+D";
/* 5|17087203C|Marcos|Loyola|Méndez|5|5|I+D|375000.0|380000.0
10|46384486H|Diego|Flores|Salas|5|5|I+D|375000.0|380000.0 */

---Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
sqlite> SELECT * from empleado as e JOIN departamento as d on e.codigo_departamento=d.codigo where d.nombre in ("Sistemas", "Contabilidad", "I+D");
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┬────────┬──────────────┬─────────────┬──────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │ codigo │    nombre    │ presupuesto │  gastos  │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┼────────┼──────────────┼─────────────┼──────────┤
│ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │ 2      │ Sistemas     │ 150000.0    │ 21000.0  │
│ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │ 4      │ Contabilidad │ 110000.0    │ 3000.0   │
│ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │ 5                   │ 5      │ I+D          │ 375000.0    │ 380000.0 │
│ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │ 2      │ Sistemas     │ 150000.0    │ 21000.0  │
│ 9      │ 56399183D │ Juan   │ Gómez     │ López     │ 2                   │ 2      │ Sistemas     │ 150000.0    │ 21000.0  │
│ 10     │ 46384486H │ Diego  │ Flores    │ Salas     │ 5                   │ 5      │ I+D          │ 375000.0    │ 380000.0 │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┴────────┴──────────────┴─────────────┴──────────┘ */
---Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
sqlite> SELECT e.nombre from empleado as e JOIN departamento as d on d.codigo=e.codigo_departamento where d.presupuesto BETWEEN 100000 and 200000;
/* ┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adela  │
│ Adrián │
│ María  │
│ Pilar  │
│ Juan   │
│ Marta  │
└────────┘ */

---Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
/* sqlite> SELECT d.nombre from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento where e.apellido2 is null;
┌──────────────┐
│    nombre    │
├──────────────┤
│ Contabilidad │
│ Sistemas     │
└──────────────┘ */





--- CONSULTAS MULTITABLA (COMPOSICIÓN EXTERNA)


---Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
sqlite> SELECT * from empleado as e LEFT JOIN departamento as d on d.codigo=e.codigo_departamento;
/* ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┬────────┬──────────────────┬─────────────┬──────────┐
│ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │ codigo │      nombre      │ presupuesto │  gastos  │
├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┼────────┼──────────────────┼─────────────┼──────────┤
│ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1                   │ 1      │ Desarrollo       │ 120000.0    │ 6000.0   │
│ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2                   │ 2      │ Sistemas         │ 150000.0    │ 21000.0  │
│ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3                   │ 3      │ Recursos Humanos │ 280000.0    │ 25000.0  │
│ 4      │ 77705545E │ Adrián       │ Suárez    │           │ 4                   │ 4      │ Contabilidad     │ 110000.0    │ 3000.0   │
│ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5                   │ 5      │ I+D              │ 375000.0    │ 380000.0 │
│ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1                   │ 1      │ Desarrollo       │ 120000.0    │ 6000.0   │
│ 7      │ 80576669X │ Pilar        │ Ruiz      │           │ 2                   │ 2      │ Sistemas         │ 150000.0    │ 21000.0  │
│ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3                   │ 3      │ Recursos Humanos │ 280000.0    │ 25000.0  │
│ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2                   │ 2      │ Sistemas         │ 150000.0    │ 21000.0  │
│ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5                   │ 5      │ I+D              │ 375000.0    │ 380000.0 │
│ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1                   │ 1      │ Desarrollo       │ 120000.0    │ 6000.0   │
│ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │        │                  │             │          │
│ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │        │                  │             │          │
└────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┴────────┴──────────────────┴─────────────┴──────────┘ */

---Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
sqlite> SELECT * from empleado as e LEFT JOIN departamento as d on d.codigo=e.codigo_departamento where codigo_departamento is null;
/* ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┬────────┬────────┬─────────────┬────────┐
│ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │ codigo │ nombre │ presupuesto │ gastos │
├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┼────────┼────────┼─────────────┼────────┤
│ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │        │        │             │        │
│ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │        │        │             │        │
└────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┴────────┴────────┴─────────────┴────────┘ */

---Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
sqlite> SELECT d.* from departamento as d LEFT JOIN empleado as e on d.codigo=e.codigo_departamento where e.nif is null;
/* ┌────────┬────────────┬─────────────┬────────┐
│ codigo │   nombre   │ presupuesto │ gastos │
├────────┼────────────┼─────────────┼────────┤
│ 6      │ Proyectos  │ 0.0         │ 0.0    │
│ 7      │ Publicidad │ 0.0         │ 1000.0 │
└────────┴────────────┴─────────────┴────────┘ */

---Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

---Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.





---CONSULTAS RESUMEN


---Calcula la suma del presupuesto de todos los departamentos.
sqlite> SELECT sum(presupuesto) from departamento;
/* ┌──────────────────┐
│ sum(presupuesto) │
├──────────────────┤
│ 1035000.0        │
└──────────────────┘ */

---Calcula la media del presupuesto de todos los departamentos.
sqlite> SELECT avg(presupuesto) from departamento;
/* ┌──────────────────┐
│ avg(presupuesto) │
├──────────────────┤
│ 147857.142857143 │
└──────────────────┘ */

---Calcula el valor mínimo del presupuesto de todos los departamentos.
sqlite> SELECT min(presupuesto) from departamento;
/* ┌──────────────────┐
│ min(presupuesto) │
├──────────────────┤
│ 0.0              │
└──────────────────┘ */

---Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
sqlite> SELECT nombre, min(presupuesto) from departamento;
/* ┌───────────┬──────────────────┐
│  nombre   │ min(presupuesto) │
├───────────┼──────────────────┤
│ Proyectos │ 0.0              │
└───────────┴──────────────────┘ */

---Calcula el valor máximo del presupuesto de todos los departamentos.
sqlite> SELECT max(presupuesto) from departamento;
/* ┌──────────────────┐
│ max(presupuesto) │
├──────────────────┤
│ 375000.0         │
└──────────────────┘ */

---Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
sqlite> SELECT nombre, max(presupuesto) from departamento;
/* ┌────────┬──────────────────┐
│ nombre │ max(presupuesto) │
├────────┼──────────────────┤
│ I+D    │ 375000.0         │
└────────┴──────────────────┘ */

---Calcula el número total de empleados que hay en la tabla empleado.
sqlite> SELECT count(*) from empleado;
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 13       │
└──────────┘ */

---Calcula el número de empleados que no tienen NULL en su segundo apellido.
sqlite> SELECT count(*) from empleado where apellido2 is not null;
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 11       │
└──────────┘ */

---Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
sqlite> SELECT count(e.nif),d.nombre from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento GROUP by d.nombre;
/* ┌──────────────┬──────────────────┐
│ count(e.nif) │      nombre      │
├──────────────┼──────────────────┤
│ 1            │ Contabilidad     │
│ 3            │ Desarrollo       │
│ 2            │ I+D              │
│ 2            │ Recursos Humanos │
│ 3            │ Sistemas         │
└──────────────┴──────────────────┘ */

---Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
sqlite> SELECT count(e.nif) as empl,d.nombre from departamento as d JOIN empleado as e on d.codigo=e.codigo_departamento GROUP by d.nombre HAVING empl > 2;
/* ┌──────┬────────────┐
│ empl │   nombre   │
├──────┼────────────┤
│ 3    │ Desarrollo │
│ 3    │ Sistemas   │
└──────┴────────────┘ */

---Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.
sqlite> SELECT count(e.nif),d.nombre from departamento as d LEFT JOIN empleado as e on d.codigo=e.codigo_departamento GROUP by d.nombre;
/* ┌──────────────┬──────────────────┐
│ count(e.nif) │      nombre      │
├──────────────┼──────────────────┤
│ 1            │ Contabilidad     │
│ 3            │ Desarrollo       │
│ 2            │ I+D              │
│ 0            │ Proyectos        │
│ 0            │ Publicidad       │
│ 2            │ Recursos Humanos │
│ 3            │ Sistemas         │
└──────────────┴──────────────────┘ */

---Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
sqlite> SELECT count(e.nif),d.nombre from departamento as d LEFT JOIN empleado as e on d.codigo=e.codigo_departamento where d.presupuesto > 200000 GROUP by d.nombre;
/* ┌──────────────┬──────────────────┐
│ count(e.nif) │      nombre      │
├──────────────┼──────────────────┤
│ 2            │ I+D              │
│ 2            │ Recursos Humanos │
└──────────────┴──────────────────┘ */





---SUBCONSULTAS

---Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
sqlite> SELECT * from empleado where codigo_departamento = (SELECT codigo from departamento where nombre = "Sistemas");
/* ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
│ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
│ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
│ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
│ 9      │ 56399183D │ Juan   │ Gómez     │ López     │ 2                   │
└────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘ */

---Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
sqlite> SELECT nombre, presupuesto from departamento where presupuesto = (SELECT max(presupuesto) from departamento);
/* ┌────────┬─────────────┐
│ nombre │ presupuesto │
├────────┼─────────────┤
│ I+D    │ 375000.0    │
└────────┴─────────────┘ */

---Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
sqlite> SELECT nombre, presupuesto from departamento where presupuesto = (SELECT min(presupuesto) from departamento);
/* ┌────────────┬─────────────┐
│   nombre   │ presupuesto │
├────────────┼─────────────┤
│ Proyectos  │ 0.0         │
│ Publicidad │ 0.0         │
└────────────┴─────────────┘ */





---CONSULTAS CON IN Y NOT IN


---Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
sqlite> SELECT nombre from departamento where codigo in (SELECT codigo_departamento from empleado);
/* ┌──────────────────┐
│      nombre      │
├──────────────────┤
│ Desarrollo       │
│ Sistemas         │
│ Recursos Humanos │
│ Contabilidad     │
│ I+D              │
└──────────────────┘ */

---Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
sqlite> SELECT nombre from departamento where codigo not in (SELECT codigo_departamento from empleado);





---CONSULTAS CON EXIST Y NOT EXIST

---Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT nombre from departamento where EXISTS (SELECT * from empleado where empleado.codigo_departamento=departamento.codigo);
/* ┌──────────────────┐
│      nombre      │
├──────────────────┤
│ Desarrollo       │
│ Sistemas         │
│ Recursos Humanos │
│ Contabilidad     │
│ I+D              │
└──────────────────┘ */

---Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
sqlite> SELECT nombre from departamento where not EXISTS (SELECT * from empleado where empleado.codigo_departamento=departamento.codigo);
/* ┌────────────┐
│   nombre   │
├────────────┤
│ Proyectos  │
│ Publicidad │
└────────────┘ */
