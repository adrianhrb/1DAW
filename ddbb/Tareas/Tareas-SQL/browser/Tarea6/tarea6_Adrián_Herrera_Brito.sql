<<<<<<< HEAD
--- Hacemos la creación de las tablas
CREATE table despacho(
	id INT PRIMARY KEY,
	capacidad INT
);

CREATE TABLE director(
	dni text PRIMARY KEY,
	nombre text,
	apellido TEXT,
	director_jefe text REFERENCES director(dni) DEFAULT 0,
	id_despacho int REFERENCES despacho(id)
);

--- Realizamos los insert siguiendo los requirimientos

---Los insert de despacho
insert into despacho values (1, 4);
insert into despacho values (2, 2);
insert into despacho values (3, 3);
insert into despacho values (4, 6);
insert into despacho values (5, 2);

---Los directores sin jefe
INSERT INTO director VALUES ("00000001A", "Pedro", "Benito", NULL, 1);
INSERT INTO director VALUES ("00000001B", "Juan", "Pérez", NULL, 2);
INSERT INTO director VALUES ("00000001C", "Paco", "Herrera", NULL, 3);
INSERT INTO director VALUES ("00000001D", "Yeray", "Gómez", NULL, 4);
INSERT INTO director VALUES ("00000001E", "Rodigo", "Gutierrez", NULL, 4);

---Los directores con jefe
INSERT INTO director VALUES ("00000002A", "Ricardo", "Santos", "00000001E", 4);
INSERT INTO director VALUES ("00000002B", "Antonio", "Loera", "00000001A", 1);
INSERT INTO director VALUES ("00000002C", "Roberto", "Farrais", "00000001D", 4);
INSERT INTO director VALUES ("00000002D", "Sergio", "Sánchez", "00000001B", 2);
INSERT INTO director VALUES ("00000002E", "Jonay", "Torres", "00000001C", 3);

--- Realizamos las consultas que se solicitan

---1. Mostrar el DNI, nombre y apellidos de todos los directores.
    SELECT dni, nombre from director;
---2. Mostrar los datos de los directores que no tienen jefes,
    SELECT * from director where director_jefe is null; 
---3. Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra.
    SELECT director.nombre, director.apellido, despacho.capacidad from despacho, director where despacho.id=director.id_despacho and director.dni=(SELECT director_jefe from director);
---4. Mostrar el número de directores que hay en cada despacho.
    SELECT despacho.id, despacho.capacidad, count(*) from director, despacho where despacho.id=director.id_despacho GROUP by despacho.id;
---5. Mostrar los datos de los directores cuyos jefes no tienen jefes.
---6. Mostrar los nombres y apellidos de los directores junto con los de su jefe.
---7. Mostrar el número de despachos que están sobreutilizados.
    SELECT count(*) from director, despacho where despacho.capacidad < (SELECT count(*) from director, despacho where despacho.capacidad=director.id_despacho group by despacho.id)
---8. Añadir un nuevo director llamado Paco Pérez, DNI 11111111T, sin jefe, y situado en el despacho 3,
    INSERT into director values ("Paco", "Pérez", "11111111T", NULL, 3)
---9. Asignar a todos los empleados apellidados Pérez un nuevo jefe con DNI 00000000H.
    UPDATE director set director_jefe="00000000H" where apellido="Pérez"
---10. Despedir a todos los directores, excepto a los que no tienen jefe.
    DELETE from director where director_jefe is not NULL;

