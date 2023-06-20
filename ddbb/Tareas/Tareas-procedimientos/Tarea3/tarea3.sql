--- # Tercera tarea de procedimientos: Simulación de examen
---
--- Base de datos para donantes de sangre
---
--- Realizamos la creación de la base de datos y entramos en ella:
CREATE DATABASE donantes;
USE donantes

--- Realizamos la creación de la tabla persona:
CREATE TABLE persona (
    id INTEGER NOT NULL,
    peso INTEGER, 
    admitido VARCHAR(2),
    sexo CHAR(1),
    fecha_ultima_donacion DATE,
    PRIMARY KEY (id)
);

--- Realizamos los insert:
INSERT INTO persona values (1,70,'Si', 'H', '2022-10-25');
INSERT INTO persona values (2,80,'Si', 'H', '2022-05-24');
INSERT INTO persona values (3,64,'Si', 'M', '2023-01-10');
INSERT INTO persona values (4,45,'Si', 'M', '2022-12-12');
INSERT INTO persona values (5,78,'Si', 'M', '2023-03-15');
INSERT INTO persona values (6,83,'Si', 'H', '2023-02-29');
INSERT INTO persona values (7,92,'Si', 'H', '2022-11-04');
INSERT INTO persona values (8,55,'Si', 'H', '2022-08-04');
INSERT INTO persona values (9,48,'Si', 'M', '2023-03-12');
INSERT INTO persona values (10,40,'Si', 'H', '2023-04-15');

--- Pasamos a realizar el procedimiento que comprueba que se pueda o no donar:
drop procedure if exist donante_apto;

--- Versión que actualiza directamente a todos los donantes
DELIMITER $$
create procedure donante_apto()
BEGIN
    UPDATE persona
    set admitido = 'No'
    where peso<50;
end
$$

--- Versión con personas en concreto:
DELIMITER $$
create procedure actualzia_donante(IN persona_id INT, IN peso_minimo INT)
BEGIN
    declare peso_persona int;
    set peso_persona = (SELECT peso from persona where id = persona_id);
    if peso_persona > peso_minimo then
        UPDATE persona set admitido = 'Si' where id = persona_id;
    else
        UPDATE persona set admitido = 'No' where id = persona_id;
    end if;
end
$$



