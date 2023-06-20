--- # SEGUNDA TAREA PROCEDIMINETOS
--- Una empresa almacena los datos de sus empleados en una tabla llamada empleados.
--- 
---1. Eliminamos la tabla, si existe y la creamos:
    DROP table empleado if EXIST;
    CREATE TABLE empleado(
        documento CHAR(8) NOT NULL PRIMARY KEY,
        nombre VARCHAR(20),
        apellido VARCHAR(20),
        sueldo DECIMAL(6,2)
        cantidadhijos INT,
        seccion VARCHAR(20)
    );

---2. Ingrese algunos registros:
    INSERT INTO empleados VALUES(22222222, 'Juan', 'Perez', 300.0, 2, 'Contaduria')
    INSERT INTO empleados VALUES(22333333, 'Luis', 'Lopez', 300.0, 1, 'Contaduria')
    INSERT INTO empleados VALUES(22444444, 'Marta', 'Perez', 500.0, 1, 'Sistemas')
    INSERT INTO empleados VALUES(22555555, 'Susana', 'Garcia', 400.0, 2, 'Secretaria')
    INSERT INTO empleados VALUES(22666666, 'Jose Maria', 'Morales', 400.0, 3, 'Secretaria')

---3. Elimine el procedimineot llamado pa_empleados_sueldo si existe:
---4. Cree un procedimiento almacenado llamado pa_empleados_sueldo que seleccione los nombres
    DELIMITER $$
    DROP PROCEDURE IF EXIST pa_empleados_sueldo$$
    CREATE PROCEDURE pa_empleados_sueldo
    BEGIN
        SELECT nombre from empleado;
    END
    $$

---5. Ejecute el procedimiento creado anteriormente:
    CALL pa_empleados_sueldo()
    
---6. Elimine el procedimiento llamado pa_empleados_hijos si existe:
---7.Cree un procedimiento almacenado llamado pa_empleados_hijos que seleccione los nombres apellidos y cantidad de hijos de los empleados con hijos.
    DELIMITER $$
    DROP PROCEDURE IF EXIST pa_empleados_hijos$$
    CREATE PROCEDURE pa_empleados_hijos
    BEGIN
        SELECT nombre, apellido, cantidadhijos from empleado
        where cantidadhijos > 0;
    END
    $$

---8. Ejecute el procedimiento creado anteriormente:
    CALL pa_empleados_hijos()

---9.  Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el procedimiento para verificar que ahora si aparece en la lista.
    UPDATE empleado SET cantidadhijos=0 where documento=22222222;
