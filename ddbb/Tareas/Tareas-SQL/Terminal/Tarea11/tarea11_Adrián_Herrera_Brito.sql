--- Creación de tablas
create table cientifico(
...> id text primary key,
...> nombre text,
...> apellido1 text,
...> apellido2 text
...> );

create table cientifico_proyecto(
...> ref_científico text REFERENCES cientifico(id),
...> ref_proyecto text REFERENCES proyecto(id),
...> primary key(ref_científico,ref_proyecto)
...> );


create table proyecto(
...> id text,
...> nombre text,
...> horas INT
...> );


---Pasamos a realizar los inserts
sqlite> insert into cientifico VALUES ("00000000A","Antonio", "Méndez", "Herrera");
sqlite> insert into cientifico VALUES ("00000000B","Jose", "López", "Juarez");
sqlite> insert into cientifico VALUES ("00000000C","Manuel", "Herrera", "Brito");
sqlite> insert into cientifico VALUES ("00000000D","Laura", "Sánchez", "Cabrera");
sqlite> insert into cientifico VALUES ("00000000E","Yerobe", "Sánchez", "Cabrera");
sqlite> insert into cientifico VALUES ("00000000F","Sergio", "Lorenzo", "Alonso");
sqlite> insert into cientifico VALUES ("00000000G","Juan", "León", "Carballo");
sqlite> insert into cientifico VALUES ("00000000H","Alberto", "Francisco", "Méndez");
sqlite> insert into cientifico VALUES ("00000000I","Lorenzo", "David", "Pérez");
sqlite> insert into cientifico VALUES ("00000000J","Manuel", "Jiménez", "Moranco");


insert into proyecto VALUES ("A1", "Apolo", 6);
insert into proyecto VALUES ("B1", "Beta", 10);
insert into proyecto VALUES ("C1", "Charlie", 13);
insert into proyecto VALUES ("D1", "Delta", 20);
insert into proyecto VALUES ("E1", "Echo", 9);


insert INTO cientifico_proyecto VALUES ("00000000A","A1");
insert INTO cientifico_proyecto VALUES ("00000000B","B1");
insert INTO cientifico_proyecto VALUES ("00000000C","C1");
insert INTO cientifico_proyecto VALUES ("00000000D","D1");
insert INTO cientifico_proyecto VALUES ("00000000E","E1");
insert INTO cientifico_proyecto VALUES ("00000000F","A1");
insert INTO cientifico_proyecto VALUES ("00000000G","B1");
insert INTO cientifico_proyecto VALUES ("00000000H","C1");
insert INTO cientifico_proyecto VALUES ("00000000I","D1");
insert INTO cientifico_proyecto VALUES ("00000000J","E1");

--- Pasamos a hacer las consultas:

--- 1. Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto:
sqlite> SELECT c.id,c.nombre,p.id,p.nombre from cientifico as c, proyecto as p, cientifico_proyecto as cp where
   ...> c.id=cp.ref_científico and p.id=cp.ref_proyecto;
--- 2. Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).
sqlite> SELECT c.id,c.nombre,count(*) from cientifico as c, proyecto as p, cientifico_proyecto as cp where c.id=cp.ref_científico and p.id=cp.ref_proyecto;
--- 3. Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).
sqlite> SELECT p.id, p.nombre, count(c.id) FROM cientifico as c, proyecto as p, cientifico_proyecto as cp where
...> p.id=cp.ref_proyecto and c.id=cp.ref_científico GROUP by (p.id);
--- 4. Obtener el número de horas de dedicación de cada científico.
sqlite> SELECT c.nombre, p.horas FROM cientifico as c, proyecto as p, cientifico_proyecto as cp where
   ...> c.id=cp.ref_científico and p.id=cp.ref_proyecto;
--- 5. Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior __ a un número de horas superior a 10, por ejemplo 11 horas__.
sqlite> SELECT c.id, c.nombre from cientifico as c join proyecto as p join cientifico_proyecto as cp on 
   ...> cp.ref_cientifico=c.id and p.id=cp.ref_proyecto where p.horas > (SELECT avg(horas) from proyecto group by id having avg(horas) > 10);
