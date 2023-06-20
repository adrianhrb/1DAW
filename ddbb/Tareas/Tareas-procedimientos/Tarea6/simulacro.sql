--- Crea la base de datos:
CREATE DATABASE salario;
use salario

--- Crea la tabla con los campos indicados:
create table persona(
    identificador VARCHAR(55),
    nombre VARCHAR(55),
    salario_base float,
    subsidios float default NULL,
    salud float default NULL,
    pension float default NULL,
    bono float default NULL,
    integral float default NULL,
    PRIMARY KEY(identificador)
)

--- Crea un procedimiento de forma aleatoria que inserte un número x de registros:
DELIMITER $$
drop procedure if exist insertar_persona$$
create procedure insertar_persona(IN nombre VARCHAR(55), IN inserts int)
BEGIN
    declare total int;
    declare contador int;
    set total = (select count(*) from persona);
    set contador = 0;
    while contador < inserts do
        set total=total+1;
        INSERT INTO persona(identificador, nombre, salario_base) VALUES(LPAD(CONCAT(total, 'A'), 12, 0), CONCAT(nombre, total), total + 1000.50);
        set contador = contador+1;
    end while;
END
$$

--- Crea una función para el subsidio de transporte:
DELIMITER //
CREATE FUNCTION subsidio (id_persona VARCHAR(55)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare subsidio float;
    set salario_persona = (select salario_base from persona where identificador = id_persona);
    set subsidio = salario_persona * 0.07;
    UPDATE persona set subsidios = subsidio where identificador = id_persona;
    return subsidio;
END
//

--- Crea una función para la pensión:
DELIMITER //
CREATE FUNCTION pension(id_persona VARCHAR(55)) RETURNS FLOAT
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare pension float;
    set salario_persona = (select salario_base from persona where identificador = id_persona);
    set pension = salario_persona * 0.04;
    UPDATE persona set pension = pension where identificador = id_persona;
    return pension;
END
//

---Crea una función para la salud:
DELIMITER //
CREATE FUNCTION salud(id_persona VARCHAR(55)) RETURNS FLOAT;
DETERMINISTIC
BEGIN
    declare salario_persona float;
    declare salud float;
    set salario_persona = (select salario_base from persona where identificador = id_persona);
    set salud = salario_persona * 0.04;
    UPDATE persona set salud = salud where identificador = id_persona;
    return salud;
END
//

--- Crea una función para el integral:
DELIMITER //
CREATE FUNCTION integral(id_persona VARCHAR(55)) RETURNS FLOAT;
DETERMINISTIC
BEGIN
    declare salario float;
    declare subsidio float;
    declare salud float;
    declare pension float;
    declare bono float;
    declare integral float;
    set salario = (select salario_base from persona where identificador = id_persona);
    set subsidio = subsidio(id_persona);
    set salud = salud(id_persona);
    set pension = pension(id_persona);
    set bono = bono(id_persona);
    set integral = salario - pension - salud + bono + subsidio;
    UPDATE persona set integral = integral;
    return integral;
END
//

--- Todo en una función:
DELIMITER //
CREATE FUNCTION integral(id_persona VARCHAR(55)) RETURNS FLOAT;
DETERMINISTIC
BEGIN
    declare salario float;
    declare subsidio float;
    declare salud float;
    declare pension float;
    declare bono float;
    declare integral float;
    set salario = (select salario_base from persona where identificador = id_persona);
    set subsidio = salario * 0.07;
    set salud = salario * 0.04;
    set pension = salario * 0.04;
    set bono = salario * 0.08;
    set integral = salario - pension - salud + bono + subsidio;
    UPDATE persona set integral = integral;
    return integral;
END
//






