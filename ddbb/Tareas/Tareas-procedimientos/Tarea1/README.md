# Científicos - Proyectos
- Dadas las siguientes tablas:
    - cientifico:

        - id: texto (PK)
        - nombre: texto
        - apellido1: texto
        - apellido2: texto

    - cientifico_proyecto

        - ref_cientifico: texto (FK ref id(científico))
        - ref_proyecto: texto (FK ref id(proyecto))

    - proyecto:

        - id: texto (PK)
        - nombre: texto
        - horas: entero

- Genera en pseudocódigo los procedimientos para cada una de las consultas que se plantean:
1. Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto:
    - Nombre del procedimiento: scientists_with_their_project
    - Valores de entrada: Sin valores de entrada
    - Valores de salida: El resultado de la consulta
    - Aproximación al procedimiento: 
    ```
    DELIMITER //
    CREATE PROCEDURE scientists_with_their_project
    BEGIN
        Select c. *, p. * from proyecto as p JOIN científico as c JOIN cientifico_proyecto as cp on cp.ref_científico = c.DNI and cp.ref_proyecto = p.id;
    END 
    //
    ```

2. Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre):
    - Nombre del procedimiento: asigned_projects
    - Valores de entrada: DNI del científico
    - Valores de salida: DNI y nombre del científico
    - Aproximación al procedimiento: 
    ```
    DELIMITER $$
    CREATE PROCEDURE asigned_projects(IN scientistdni VARCHAR(12), OUT num_projects INT unsigned)
    BEGIN
        SELECT count(p.id) INTO num_projects, c.dni, c.nombre from científico as c JOIN científico_proyecto as cp JOIN proyecto as p on c.dni = cp.ref_científico and p.id = cp.ref_proyecto where c.dni = scientistdni
    END 
    $$

    DELIMITER ;
    Call asigned_projects('12345678A', @num_projects)
    SELECT @num_projects;
    ```

3. Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto):
    - Nombre del procedimiento: scientist_into_project
    - Valores de entrada: Identidicador del proyecto
    - Valores de salida: Nombre e identificador del proyecto
    - Aproximación al procedimiento: 
    ```
    DELIMITER $$
    CREATE PROCEDURE scientist_into_project (IN IDPROJECT VARCHAR(12), OUT num_scientist INT UNSIGNED)
    BEGIN
        SELECT count(c.dni) INTO num_scientist, p.id, p.nombre from científico as c JOIN científico_proyecto as cp JOIN proyecto as p on c.dni = cp.ref_científico and p.id = cp.ref_proyecto where p.id = IDPROJECT;
    END 
    $$

    DELIMITER ;
    Call asigned_projects('1', @num_scientist)
    SELECT @num_scientist;
    ```

4. Obtener el número de horas de dedicación de cada científico:
    - Nombre del procedimiento: dedicated_hours
    - Valores de entrada: Identificador del científico
    - Valores de salida: Nombre e identificador del proyecto
    - Aproximación al procedimiento: 
    ```
    DELIMITER $$
    CREATE PROCEDURE scientist_into_project (IN scientistdni VARCHAR(12), OUT total_hours INT UNSIGNED)
    BEGIN
        SELECT c.nombre, sum(p.horas) INTO total_hours FROM cientifico as c JOIN proyecto as p JOIN cientifico_proyecto as cp on c.id=cp.ref_científico and p.id=cp.ref_proyecto where c.dni = scientistdni GROUP BY c.dni
    END 
    $$

    DELIMITER ;
    Call asigned_projects('12345678A', @scientistdni)
    SELECT @scientistdni
    ```

5. Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior a un número de horas superior a 10, por ejemplo 11 horas:
    - Nombre del procedimiento: hardest_working_scientists
    - Valores de entrada: Sin valores de entrada
    - Valores de salida: Sin valores de salida
    - Aproximación al procedimiento: 
    ```
    DELIMITER $$
    CREATE PROCEDURE hardest_working_scientists(IN valor INT)
    BEGIN
        SELECT c.id, c.nombre from cientifico as c join proyecto as p join cientifico_proyecto as cp on cp.ref_cientifico=c.id and p.id=cp.ref_proyecto where p.horas > (SELECT avg(horas) from proyecto group by id having avg(horas) > valor);
    END 
    $$


    