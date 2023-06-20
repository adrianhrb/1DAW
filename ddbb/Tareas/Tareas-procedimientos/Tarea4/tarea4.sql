--- # CUARTA TAREA DE PROCEDIMIENTOS: Gestión de clientes
---
--- Realizamos la creación de la base de datos y entramos en ella:
CREATE DATABASE gestionclientes;
use gestionclientes

--- Realizamos la creación de la tabla:
create table persona(
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(55) NOT NULL,
    apellido1 VARCHAR(55) NOT NULL,
    apellido2 VARCHAR(55) NOT NULL,
    peso INTEGER NOT NULL,
    sexo VARCHAR(1) NOT NULL
);

---Realizamos los insert:
INSERT INTO persona VALUES('11111111A', 'Aarón', 'Rivero', 'Gómez',70, 'H');
INSERT INTO persona VALUES('11111111B', 'Adela', 'Salas', 'Díaz',75, 'M');
INSERT INTO persona VALUES('11111111C', 'Adolfo', 'Rubio', 'Flores',80, 'H');
INSERT INTO persona VALUES('11111111D', 'Adrián', 'Suárez', 'Benitez',50, 'H');
INSERT INTO persona VALUES('11111111E', 'Marcos', 'Loyola', 'Méndez',45, 'H');
INSERT INTO persona VALUES('11111111F', 'María', 'Santana', 'Moreno',52, 'M');
INSERT INTO persona VALUES('11111111G', 'Pilar', 'Ruiz', 'Gómez',90, 'M');
INSERT INTO persona VALUES('11111111H', 'Pepe', 'Ruiz', 'Santana',48, 'H');
INSERT INTO persona VALUES('11111111I', 'Guillermo', 'López', 'Gómez',49, 'H');
INSERT INTO persona VALUES('11111111J', 'Daniel', 'Santana', 'Loyola',53, 'H');

--- Procedimiento para realizar insetar infromación en la base de datos:

DELIMITER $$
drop procedure nuevo_cliente $$
create procedure nuevo_cliente(
    IN u_dni VARCHAR(9), 
    IN u_nombre VARCHAR(55), 
    IN u_apellido1 VARCHAR(55), 
    IN u_apellido2 VARCHAR(55), 
    IN u_peso INTEGER, 
    IN u_sexo VARCHAR(1)
)
BEGIN
    declare anterior INT default 0;
    set anterior = select id from persona where dni = u_dni
    if (anterior == 0) then
        INSERT INTO persona VALUES(u_dni, u_nombre, u_apellido1, u_apellido2, u_peso, u_sexo);
END
$$

---Procedimiento para actualizar el nombre de un cliente solicitado:

DELIMITER $$
drop procedure cambiar_nombre $$
create procedure cambiar_nombre(
    IN dni_cliente VARCHAR(9),
    IN nuevo_nombre VARCHAR(55)
)
BEGIN
    UPDATE persona set nombre = nuevo_nombre where dni = dni_cliente;
END
$$

---Procedimiento que elimine un cliente de la base de datos:

DELIMITER $$
drop procedure elimina_cliente $$
create procedure elimina_cliente(
    IN dni_cliente VARCHAR(9)
)
BEGIN
    DELETE from persona where dni = dni_cliente;
END
$$

---Procedimientos con parámetros de salida:

DELIMITER $$
create procedure muestra_peso(
    IN dni_cliente VARCHAR(9),
    OUT peso_cliente INT
)0
BEGIN
    select peso from persona where dni = dni_cliente INTO peso_cliente;
END
$$

DELIMITER ;
CALL muestra_peso('11111111A', @peso_cliente);
select @peso_cliente;

---Procedimiento que calcula la diferencia del peso de una persona respecto a la media
DELIMITER $$
create procedure diferencia_respecto_a_media(
    IN dni_persona VARCHAR(9)
)
BEGIN
    declare diferencia_entre_media int;
    declare media int;
    declare peso_persona int;
    set media = (select round(avg(peso)) from persona);
    set peso_persona = (select peso from persona where dni_persona = dni)
    set diferencia_entre_media = (peso_persona - media);
    select diferencia_entre_media;
END
$$

DELIMITER ;
call diferencia_respecto_a_media('11111111A');