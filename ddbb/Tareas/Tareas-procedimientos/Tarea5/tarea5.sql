--- # QUINTA TAREA DE PROCEDIMIENTOS: Salarios
---
--- Realizamos la creación de la base de datos y entramos en ella:
CREATE DATABASE infosalario;
use infosalario

--- Realizamos la creación de la tabla:
create table persona(
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(55) NOT NULL,
    salario_base float,
    PRIMARY KEY (dni)
);

---Realizamos los insert:
INSERT INTO persona VALUES('11111111A', 'Aarón', 1457.28);
INSERT INTO persona VALUES('11111111B', 'Adela', 1300.00);
INSERT INTO persona VALUES('11111111C', 'Adolfo', 1078.75);
INSERT INTO persona VALUES('11111111D', 'Adrián', 1120.55);

--- Procedimiento para realizar el cálculo de subsidio de transporte:

DELIMITER //
CREATE FUNCTION subsidio_transporte(dni_trabajador VARCHAR(9)) RETURNS float 
DETERMINISTIC
BEGIN
    DECLARE transporte FLOAT;
    DECLARE salario_persona float;
    set salario_persona = (select salario_base from persona where dni = dni_trabajador);
    set transporte = salario_persona * 0.07;
    return round(transporte, 2);
END
//

DELIMITER ;
select subsidio_transporte('11111111A');

---Procedimiento para calcular el porcentaje correspondiente a la salud:

DELIMITER //
CREATE FUNCTION salud(dni_trabajador VARCHAR(9)) RETURNS float
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare salud float;
    set salario_persona = (select salario_base from persona where dni = dni_trabajador);
    set salud = salario_persona * 0.04;
    return round(salud, 2);
END
//

DELIMITER ;
select salud('11111111A');

---Procedimiento para calcular el porcentaje de la pensión:

DELIMITER //
CREATE FUNCTION pension(dni_trabajador VARCHAR(9)) RETURNS float
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare pension float;
    set salario_persona = (select salario_base from persona where dni = dni_trabajador);
    set pension = salario_persona * 0.04;
    return round(pension, 2);
END
//

DELIMITER ;
select pension('11111111A');


---Procedimientos para calcular el bono:

DELIMITER //
CREATE FUNCTION bono(dni_trabajador VARCHAR(9)) RETURNS float
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare bono float;
    set salario_persona = (select salario_base from persona where dni = dni_trabajador);
    set bono = salario_persona * 0.08;
    return round(bono, 2);
END
//

DELIMITER ;
select bono('11111111A');




DELIMITER //
CREATE FUNCTION integral(dni_trabajador VARCHAR(9)) RETURNS float
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare salud float;
    declare pension float;
    declare bono float;
    declare transporte float;
    declare integral float;
    set salario_persona = (select salario_base from persona where dni = dni_trabajador);
    set salud = (select salud(dni_trabajador)); 
    set pension = (select pension(dni_trabajador));
    set bono = (select bono(dni_trabajador));
    set transporte = (select subsidio_transporte(dni_trabajador));
    set integral = salario_persona - salud - pension + bono + transporte;
    return integral;
END
//

DELIMITER ;
select integral('11111111A');

