/* Realizamos la creación de las tablas */
---Tabla departamento:
    CREATE TABLE departamento (
        id integer PRIMARY KEY,
        nombre text,
        presupuesto integer
    );

--- Tabla empleado:
        CREATE TABLE empleado (
        dni text PRIMARY KEY,
        nombre text,
        apellido text,
        id_departamento     REFERENCES departamento(id)
    );

/* Realizamos 10 insert a la tabla empleado */
INSERT INTO empleado VALUES ("00000000", "Esther", "Vázquez", "11");
INSERT INTO empleado VALUES ("00000002", "Juan", "Mendez", "9");
INSERT INTO empleado VALUES ("00000003", "Manuel", "Santos", "3");
INSERT INTO empleado VALUES ("00000004", "Paco", "López", "2");
INSERT INTO empleado VALUES ("00000005", "Pedro", "Herrera", "1");
INSERT INTO empleado VALUES ("00000006", "Sergio", "Rodríguez", "8");
INSERT INTO empleado VALUES ("00000007", "Luis", "Llanos", "12");
INSERT INTO empleado VALUES ("00000008", "Benito", "López", "6");
INSERT INTO empleado VALUES ("00000009", "Adrián", "Contreras", "4");
INSERT INTO empleado VALUES ("00000010", "Jousep", "Pedrerol", "5");
INSERT INTO empleado VALUES ("00000011", "Rodrigo", "Pérez", "7");
INSERT INTO empleado VALUES ("00000012", "Antonio", "Dominguez", "10");
INSERT INTO empleado VALUES ("00000013", "Eduardo", "Aguirre", "13");
INSERT INTO empleado VALUES ("00000014", "Jordi", "Wild", "14");
INSERT INTO empleado VALUES ("00000015", "Doni", "Doniz", "15");

/* Realizamos 15 insert a la tabla departamento */
INSERT into departamento values("1", "Financiero", "75000");
INSERT into departamento values("2", "Informática", "100000");
INSERT into departamento values("3", "Recursos humanos", "60000");
INSERT into departamento values("4", "Marketing", "70000");
INSERT into departamento values("5", "Comercial", "87000");
INSERT into departamento values("6", "Compras", "72000");
INSERT into departamento values("7", "Logística", "73500");
INSERT into departamento values("8", "Gestión", "82500");
INSERT into departamento values("9", "Directivo", "125000");
INSERT into departamento values("10", "Ventas", "100000");
INSERT into departamento values("11", "Reformas", "68450");
INSERT into departamento values("12", "Difusión", "98200");
INSERT into departamento values("13", "Redes", "91000");
INSERT into departamento values("14", "Reparación", "94750");
INSERT into departamento values("15", "I+D", "70000");

/* Ahora pasamos a hacer las consultas */
---1. Obtener los apellidos de los empleados.
    SELECT apellido from empleado;
---2. Obtener los apellidos de los empleados sin repeticiones.
    SELECT DISTINCT apellido from empleado;
---3. Obtener todos los datos de los empleados que se apellidan __López__.
    SELECT * from empleado where apellido="López";
---4. Obtener todos los datos de los empleados que se apellidan __López__ y los que se apellidan __Pérez__.
    SELECT * from empleado where apellido in ("López", "Pérez");
                                --- REGEXP ('^López$ | ^Pérez$')
---5. Obtener todos los datos de los empleados que trabajan para el departamento __10__.
    SELECT * from empleado where id_departamento=10
---6. Obtener todos los datos de los empleados que trabajan para el departamento __8__ y para el departamento 5.
    SELECT * from empleado where id_departamento in (8, 5);
---7. Obtener todos los datos de los empleados cuyo apellido comience por __P__.
    SELECT * from empleado where apellido REGEXP '^P';
---8. Obtener el presupuesto total de todos los departamentos.
    SELECT sum(presupuesto) from departamento;
---9. Obtener el número de empleados en cada departamento.
    SELECT departamento.nombre, count(*) from departamento join empleado where departamento.id=empleado.id_departamento GROUP by departamento.nombre;
---10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
    SELECT empleado.*, departamento.* from empleado join departamento where empleado.id_departamento=departamento.id;
---11. Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.
    SELECT empleado.nombre, empleado.apellido, departamento.nombre, departamento.presupuesto from empleado join departamento where empleado.id_departamento=departamento.id;
---12. Obtener los nombres y apellido de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.
    SELECT DISTINCT empleado.nombre, empleado.apellido from empleado join departamento where departamento.presupuesto >= 60000;
---13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.
    SELECT * from departamento where presupuesto > (SELECT avg(presupuesto) from departamento);
---14. Obtener los nombres (únicamente los nombres) de los departamentos que tiene más de dos empleados.
    SELECT departamento.nombre from empleado, departamento where departamento.id=empleado.id_departamento and 2<(SELECT count(*) from empleado GROUP by id_departamento);
---15. Añadir un nuevo departamento: “Calidad”, con presupuesto de 40.000 € y código 11.
    INSERT INTO departamento VALUES ("16", "calidad", "40000");
---16. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:00000000.
    INSERT INTO empleado VALUES ("00000016", "Esther", "Sánchez", "16");
---17. Calcular un recorte presupuestario del 10 % a todos los departamentos.
    SELECT nombre, presupuesto * 0.9 from departamento GROUP by nombre;
---18. Despedir a todos los empleados que trabajan para el departamento de informática (código 2).
    DELETE from empleado where id_departamento = 2;
---19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.
    DELETE from empleado where dni=(SELECT empleado.* from empleado join departamento where departamento.id=empleado.id_departamento and departamento.presupuesto>60000);
---20. Despedir a todos los empleados.
    DELETE from empleado;