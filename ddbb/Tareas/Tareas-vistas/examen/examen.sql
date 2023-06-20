--- Creación de vistas

---1. Vista para ver a qué hora ficharon los profesores con tipo de horario 2
CREATE VIEW ficha_horario2 AS
SELECT p.id, f.hora, rp.tipohora from fichar as f join profesor as p
join repartohorarioprofesor as rp on f.id_profe = p.id
and p.id = rp.profe where rp.tipohora = 2;

/* +--------+----------+----------+
| id     | hora     | tipohora |
+--------+----------+----------+
| Profe1 | 08:32:50 |        2 |
| Profe1 | 11:34:40 |        2 |
+--------+----------+----------+ */
/* 2 rows in set (0,01 sec) */

--- 2. Vista para obtener el curso de los profesores con horario tipo 4
CREATE VIEW curso_horario4 AS
SELECT cu.id as curso_id, cu.curso, p.nombre, rp.tipohora from 
repartohorarioprofesor as rp join profesor as p
join profecurso as cu ON cu.profe = p.id and
p.id = rp.profe where rp.tipohora = 4;

--- 3. Vista para ver el nombre del departamento de los profesores
CREATE VIEW profe_nombre_departamento AS
SELECT p.id, d.nombre from profesor as p join profedepartamento as pf
join departamento as d on p.id = pf.profe and pf.departamento = d.id;

/* +--------+-----------------------------------+
| id     | nombre                            |
+--------+-----------------------------------+
| Profe1 | Formación y Orientación Laboral   |
| Profe3 | Filosofía                         |
| Profe2 | Geografía e Historia              |
+--------+-----------------------------------+
3 rows in set (0,01 sec) */


--- Creación de índices en las tablas:
CREATE FULLTEXT INDEX idx_nombreasignatura ON asignatura(nombre);
show index from asignatura;
/* +------------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| asignatura |          0 | PRIMARY              |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| asignatura |          0 | nombre               |            1 | nombre      | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| asignatura |          1 | id_dpto              |            1 | id_dpto     | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| asignatura |          1 | idx_nombreasignatura |            1 | nombre      | NULL      |           4 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
+------------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+ */


CREATE UNIQUE INDEX idx_email on profesor(email);
show index from profesor;
show index from profesor;
/* +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name     | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| profesor |          0 | PRIMARY      |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          0 | idx_email    |            1 | email        | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | id_sustituto |            1 | id_sustituto | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| profesor |          1 | username     |            1 | username     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+ */

CREATE INDEX idx_tiposhora on tipohora(id, tipo, codigo, nombre);
show index from tipohora;
/* +----------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name      | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| tipohora |          0 | PRIMARY       |            1 | id          | A         |          81 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| tipohora |          1 | idx_tiposhora |            1 | id          | A         |          81 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| tipohora |          1 | idx_tiposhora |            2 | tipo        | A         |          81 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| tipohora |          1 | idx_tiposhora |            3 | codigo      | A         |          81 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| tipohora |          1 | idx_tiposhora |            4 | nombre      | A         |          81 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+ */

CREATE FULLTEXT INDEX idx_contraseña on users(password);
show index from users;
/* +-------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| users |          0 | PRIMARY         |            1 | username    | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| users |          1 | idx_contraseña  |            1 | password    | NULL      |           4 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
+-------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+ */




---Creación de triggers
create table historial_profesor(
    id VARCHAR(55) PRIMARY KEY,
    nombre VARCHAR(55),
    apellido VARCHAR(55),
    email VARCHAR(55),
    fecha_contrato DATE
);

DELIMITER $$
CREATE TRIGGER hisotico_profesor
AFTER INSERT ON profesor
FOR EACH ROW
BEGIN
    INSERT INTO historial_profesor 
    values(NEW.id, NEW.nombre, NEW.apellido, NEW.apellido, now());
END;
$$

CALL inserta_profesor(5); PROBAMOS EL TRIGGER CON EL PROCEDIMIENTO DE ABAJO
select * from historial_profesor;

/* Query OK, 1 row affected (0,04 sec)
+---------+----------------+------------------+------------------+----------------+
| id      | nombre         | apellido         | email            | fecha_contrato |
+---------+----------------+------------------+------------------+----------------+
| Profe15 | NombrePrueba15 | ApellidoPrueba15 | ApellidoPrueba15 | 2023-05-29     |
| Profe16 | NombrePrueba16 | ApellidoPrueba16 | ApellidoPrueba16 | 2023-05-29     |
| Profe17 | NombrePrueba17 | ApellidoPrueba17 | ApellidoPrueba17 | 2023-05-29     |
| Profe18 | NombrePrueba18 | ApellidoPrueba18 | ApellidoPrueba18 | 2023-05-29     |
| Profe19 | NombrePrueba19 | ApellidoPrueba19 | ApellidoPrueba19 | 2023-05-29     |
+---------+----------------+------------------+------------------+----------------+  */


create table asignaturas_eliminadas(
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(55),
    fecha_eliminacion DATE
);

DELIMITER $$
CREATE TRIGGER asignaturas_borradas
AFTER DELETE ON asignatura
FOR EACH ROW
BEGIN
    INSERT INTO asignaturas_eliminadas
    values (OLD.id, OLD.nombre, now());
END;
$$

DELETE FROM asignatura where id = 'ALE';
select * from asignaturas_eliminadas;
/* +-----+---------+-------------------+
| id  | nombre  | fecha_eliminacion |
+-----+---------+-------------------+
| ALE | Alemán  | 2023-05-29        |
+-----+---------+-------------------+
1 row in set (0,00 sec) */




---Creación de los procedimientos para las tablas con índice

DELIMITER //
create procedure inserta_profesor (IN inserts int)
BEGIN
    DECLARE ultimo_profe int;
    DECLARE identificador VARCHAR(30);
    DECLARE contador int;
    DECLARE _nombre VARCHAR(55);
    DECLARE _apellido VARCHAR(55);
    DECLARE _telefono VARCHAR(55);
    DECLARE _email varchar(20);
    DECLARE _username VARCHAR(55);
    set ultimo_profe = (select count(*) from profesor);
    set contador = 0;
    while contador < inserts do
        set ultimo_profe = ultimo_profe + 1;
        set identificador = CONCAT('Profe', ultimo_profe);
        set _nombre = CONCAT('NombrePrueba', ultimo_profe);
        set _apellido = CONCAT('ApellidoPrueba', ultimo_profe);
        set _email = CONCAT(identificador, '@gmail.com');
        set _telefono = RPAD(CONCAT(6, ultimo_profe),9,0);
        set _username = (Select username from users order by rand() LIMIT 1);
        INSERT INTO profesor(id, nombre, apellido, email, telefono, username, foto) values(identificador, _nombre, _apellido, _email, _telefono, _username, "no");
        set contador = contador + 1;
    end while;
END
//

/* call inserta_profesor(5);
Query OK, 1 row affected (0,03 sec)

call inserta_profesor(5);
Query OK, 1 row affected (0,04 sec)

select * from profesor;
+---------+----------------+------------------+-------------------------------------+-----------+--------+--------+-----------+--------------+-----------+------+
| id      | nombre         | apellido         | email                               | telefono  | h_perm | h_lect | sustituto | id_sustituto | username  | foto |
+---------+----------------+------------------+-------------------------------------+-----------+--------+--------+-----------+--------------+-----------+------+
| Profe1  | Guillermo      | Sicilia          | siciliahernandezguillermo@gmail.com | NULL      |     24 |     18 |         0 | NULL         | admin     |      |
| Profe10 | NombrePrueba10 | ApellidoPrueba10 | Profe10@gmail.com                   | 610000000 |     24 |     18 |         0 | NULL         | marcab    | no   |
| Profe11 | NombrePrueba11 | ApellidoPrueba11 | Profe11@gmail.com                   | 611000000 |     24 |     18 |         0 | NULL         | admin     | no   |
| Profe12 | NombrePrueba12 | ApellidoPrueba12 | Profe12@gmail.com                   | 612000000 |     24 |     18 |         0 | NULL         | admin     | no   |
| Profe13 | NombrePrueba13 | ApellidoPrueba13 | Profe13@gmail.com                   | 613000000 |     24 |     18 |         0 | NULL         | marcab    | no   |
| Profe14 | NombrePrueba14 | ApellidoPrueba14 | Profe14@gmail.com                   | 614000000 |     24 |     18 |         0 | NULL         | marcab    | no   |
| Profe2  | Pedro          | Martinez         | pema@gmail.com                      | 234567890 |     24 |     18 |         0 | NULL         | pedmar    |      |
| Profe3  | Maria          | Cabrera          | maca@gmail.com                      | 345678901 |     24 |     18 |         0 | NULL         | marcab    |      |
| Profe4  | Grace          | Caraballo        | gracecp@gmail.com                   | 123124123 |     24 |     18 |         0 | NULL         | gracar123 |      |
| Profe5  | NombrePrueba5  | ApellidoPrueba5  | Profe5@gmail.com                    | 650000000 |     24 |     18 |         0 | NULL         | pedmar    | no   |
| Profe6  | NombrePrueba6  | ApellidoPrueba6  | Profe6@gmail.com                    | 660000000 |     24 |     18 |         0 | NULL         | admin     | no   |
| Profe7  | NombrePrueba7  | ApellidoPrueba7  | Profe7@gmail.com                    | 670000000 |     24 |     18 |         0 | NULL         | admin     | no   |
| Profe8  | NombrePrueba8  | ApellidoPrueba8  | Profe8@gmail.com                    | 680000000 |     24 |     18 |         0 | NULL         | admin     | no   |
| Profe9  | NombrePrueba9  | ApellidoPrueba9  | Profe9@gmail.com                    | 690000000 |     24 |     18 |         0 | NULL         | pedmar    | no   |
+---------+----------------+------------------+-------------------------------------+-----------+--------+--------+-----------+--------------+-----------+------+
14 rows in set (0,00 sec) */




DELIMITER //
create procedure insertar_usuarios(IN inserts int)
BEGIN
    DECLARE ultimo_user int;
    DECLARE contador int;
    DECLARE user_name VARCHAR(20);
    DECLARE passwordpt1 VARCHAR(255);
    DECLARE passwordpt2 VARCHAR(55);
    DECLARE _email VARCHAR(100);
    DECLARE _rol VARCHAR(255);
    set ultimo_user = (select count(*) from users);
    set contador = 0;
    while contador < inserts do
        set ultimo_user = ultimo_user + 1;
        set user_name = CONCAT('USER', ultimo_user);
        set passwordpt1 = (select password from users order by RAND() LIMIT 1);
        set passwordpt2 = CONCAT(passwordpt1, user_name);
        set email = CONCAT(user_name, '@gmail.com');
        set _rol = (Select roles from users order by RAND() LIMIT 1);
        INSERT INTO USERS(username, password, email, roles) values(user_name, passwordpt2, email, _rol);
        set contador = contador + 1;
    end while;
END
//