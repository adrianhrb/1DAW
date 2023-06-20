# Tarea de trabajo con Índices

- Elimine la tabla "alumno" si existe:
```sql
drop table if exists alumno;
Query OK, 0 rows affected, 1 warning (0,01 sec)
```

- Cree la tabla una clave primaria compuesta (año de inscripción y número de inscripción):
```sql
create table alumno(
    num_inscripcion integer,
    año_inscripcion integer,
    nombre varchar(55),
    documento varchar(55),
    domicilio varchar(55),
    ciudad varchar(55),
    provincia varchar(55),
    primary key(num_inscripcion, año_inscripcion)
);
Query OK, 0 rows affected (0,04 sec)
```

- Define los siguientes indices:

    - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
    ```sql
    ALTER TABLE alumno ADD UNIQUE idx_documento (documento);
    Query OK, 0 rows affected (0,03 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    CREATE INDEX idx_ciudad on alumno(ciudad);
    Query OK, 0 rows affected (0,01 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    CREATE INDEX idx_provincia on alumno(provincia);
    Query OK, 0 rows affected (0,05 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    ```

    - Vea los índices de la tabla.
    ```sql
    show index from alumno;
    +--------+------------+---------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table  | Non_unique | Key_name      | Seq_in_index | Column_name      | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +--------+------------+---------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | alumno |          0 | PRIMARY       |            1 | num_inscripcion  | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumno |          0 | PRIMARY       |            2 | año_inscripcion  | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumno |          0 | idx_documento |            1 | documento        | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | alumno |          1 | idx_ciudad    |            1 | ciudad           | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | alumno |          1 | idx_provincia |            1 | provincia        | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +--------+------------+---------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    ```
    - Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria:
    ```sql
    DELIMITER //
    create procedure inserta_persona()
    BEGIN
        declare inserts int;
        declare contador int;
        declare identificador int;
        set identificador = (select count(*) from alumno);
        set inserts = 5;
        set contador = 0;
        while contador <= inserts do
            set identificador = identificador + 1;
            insert into alumno values(identificador, 2000 + identificador, CONCAT('Pepe', identificador), identificador, CONCAT('Calle Prueba', identificador), 'La Orotava', 'Santa Cruz de Tenerife');
            set contador = contador + 1;
        end while;
    END
    //
    Query OK, 0 rows affected (0,02 sec)

    DELIMITER ;
    call inserta_persona();
    Query OK, 1 row affected (0,01 sec)
    call inserta_persona()
    Query OK, 1 row affected (0,03 sec)
    ```

    - Intente ingresar un alumno con clave primaria repetida:
    ```sql
    insert into alumno values(1, 2001, 'Pepe18', 90, 'Calle Prueba90', 'La Orotava', 'Sc');
    ERROR 1062 (23000): Duplicate entry '1-2001' for key 'alumno.PRIMARY'



