/*Adrián Herrera Brito*/
--- Creación de las tablas
create table clase(
	id INT PRIMARY KEY,
	max_alumnos int
);

CREATE TABLE alumno(
	dni text,
	nombre text,
	apellido text,
	nota int,
	id_clase int REFERENCES clase(id)
);



Se pide realizar:
---1. Realiza la inserción de, al menos, 10 alumnos.
---Primero las aulas para poder referenciar a los alumnos en una clase
insert into clase values(1, 5);
insert into clase values(2, 3);
insert into clase values(3, 7);
insert into clase values(4, 12);
insert into clase values(5, 10);
insert into clase values(6, 4);
insert into clase values(7, 2);
insert into clase values(8, 13);
insert into clase values(9, 30);
insert into clase values(10, 9);
---Ahora pasamos a los alumnos
insert into alumno values("00000000A", "Pedro", "Benito", 6, 1);
insert into alumno values("00000000B", "Juan", "Martínez", 4, 2);
insert into alumno values("00000000C", "Paco", "Pérez", 3, 3);
insert into alumno values("00000000D", "Sergio", "Herrera", 7, 4);
insert into alumno values("00000000E", "Yerobe", "Santos", 9, 4);
insert into alumno values("00000000F", "Jose", "López", 10, 5);
insert into alumno values("00000000G", "Antonio", "Llanos", 5, 5);
insert into alumno values("00000000H", "Luis", "Lorenzo", 7, 6);
insert into alumno values("00000000I", "Samuel", "Salamanca", 2, 7);
insert into alumno values("00000000J", "Daniel", "Dorta", 10, 8);

--- 2. Obtener los apellidos de los alumnos.
SELECT apellido from alumno;
---3. Obtener los apellidos de los alumnos sin repeticiones.
SELECT DISTINCT apellido from alumno;
---4. Obtener todos los datos de los alumnos que se apellidan __Martínez__.
SELECT * from alumno where apellido="Martínez";
---5. Obtener todos los datos de los alumnos que se apellidan __Martínez__ y los que se apellidan __Pérez__.
SELECT * from alumno where apellido in ("Martínez", "Pérez");
---6. Obtener todos los datos de los alumnos que asisten a la clase __10__.
SELECT * from alumno where id_clase = 10;
---7. Obtener todos los datos de los alumnos que asisten a la clase __8__ y para el clase 5.
SELECT * from alumno where id_clase in (8,10);
---8. Obtener todos los datos de los alumnos cuyo apellido comience por __P__.
SELECT * from alumno where apellido REGEXP "^P";
---9. Obtener el número máximo de alumnos por en todas las clases.

---10. Obtener el número de alumnos en cada clase.
SELECT clase.id, count(*) from alumno, clase where clase.id=alumno.id_clase GROUP by clase.id;
---12. Muestra todos los alumnos ordenando por nombre de forma descendiente y por nota de forma .
SELECT nombre, nota from alumno ORDER by nota DESC, nombre asc;
---11. Obtener un listado completo de alumnos, incluyendo los datos de su clase a la que asisten.
SELECT a.dni, a.nombre, a.apellido, a.nota, c.id, c.max_alumnos from alumno as a, clase as c where c.id=a.id_clase;
---13. Obtener los nombres y apellido de los alumnos que asisten a la clase 4 y cuyo máximo de alumnos es mayor 10.
SELECT a.nombre, a.apellido from alumno as a, clase where (a.id_clase=clase.id and a.id_clase=4) or (clase.id=a.id_clase and clase.max_alumnos > 10);---14. Obtener los datos de los clases cuyo número de alumnos es superior a la media de todos los clases.
SELECT * from clase where max_alumnos > (SELECT avg(max_alumnos) from clase);
---15. Obtener los nombres (únicamente los nombres) de los clases que tiene más de dos alumnos.
SELECT nombre from alumno where 2<(SELECT count(*) from alumno, clase where clase.id = alumno.id_clase GROUP by clase.id);
---16. Añadir un nuevo clase, con un número máximo de alumnos es 20.
insert into clase VALUES(11, 20);
--17. Añadir dos nuevos alumnos vinculando a la clase creada.
insert into alumno VALUES("00000000K", "Ricardo", "López", 6, 11);
insert into alumno VALUES("00000000L", "Manuel", "Méndez", 9, 11);
---18. Calcula el 10% de los alumnos por clase.
SELECT count(*)*0.9 as nuevos_alumnos from alumno, clase where clase.id=alumno.id_clase GROUP by clase.id;
---19. Elimina a todos los alumnos que asisten a la clase con id 2.
DELETE from alumno where id_clase=2;
20. Elimina a todos los alumnos cuyo nota sea inferior al 30%.