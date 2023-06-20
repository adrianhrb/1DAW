--- Realizamos la creación de la base de datos
CREATE DATABASE examen;
use examen

---Realizamos la creación de la tabla:
create table persona(
    identificador char(9),
    peso int,
    admitido enum('Si', 'No'),
    sexo enum('H', 'M'),
    fecha_ultima_donacion date,
    primary key(identificador)
);

---Procedimiento para insertar datos:
--- Partimos de que el valor admitido es NULL y que este se va a calcular más adelante
DELIMITER $$
drop procedure if exists inserta_persona$$
create procedure inserta_persona(IN inserts int)
BEGIN
    declare contador int;
    declare ultimo_id int;
    declare id char(9);
    set ultimo_id = (Select count(*) from persona);
    set contador = 0;
    while contador < inserts do
        set ultimo_id = ultimo_id + 1;
        set id = LPAD(CONCAT(ultimo_id, 'A'), 9, 0);
        INSERT INTO persona(identificador, peso, admitido, sexo) values(id, FLOOR(40 + (RAND() * 60)), NULL, ROUND(RAND() + 1));
        set contador = contador + 1;
    end while;
END
$$


--- Procedimiento para actualizar la fecha de última fonación:
DELIMITER $$
drop procedure if exists actualiza_fecha$$
create procedure actualiza_fecha(IN dni char(9), IN fecha_cambio date)
BEGIN
    UPDATE persona set fecha_ultima_donacion = fecha_cambio where identificador = dni;
END
$$

---Procedimiento para actualizar valores en caso de admitido
---Se añade el parámetro de entrada admitido para que las funciones creadas puedan hacer
---los cálculos y este procedimiento solo se encargue de actualizar datos y así
---no repetir dos veces las comprobaciones
DELIMITER $$
drop procedure if exists admision$$
create procedure admision(IN dni char(9), IN fecha_cambio date, IN admitido varchar(2))
BEGIN
    if admitido = 'Si' then
        UPDATE persona set fecha_ultima_donacion = fecha_cambio, admitido = 'Si' where identificador = dni;
    else
        UPDATE persona set admitido = 'No' where identificador = dni;
    end if;
END
$$


---Función para comprobar validación por peso:
---La función comprueba que el peso es correcto, en ese caso llama al procedimiento anterior
--y le envía el valor ya comprobado, para así evitar calcular que los datos sean correctos
---dos veces en dos lugares distintos
DELIMITER //
drop function if exists valida_peso//
create function valida_peso(dni char(9), fecha_donacion date) RETURNS varchar (50)
DETERMINISTIC
BEGIN
    declare peso_persona int;
    set peso_persona = (select peso from persona where identificador = dni);
    if peso_persona > 50 then
        call admision(dni, fecha_donacion, 'Si');
    else
        call admision(dni, fecha_donacion, 'No');
    end if;
    return 'Actualizado con éxito';
END
//

--- Para usar en la función de abajo
DELIMITER //
drop function if exists valida_peso//
create function valida_peso2(dni char(9), fecha_donacion date) RETURNS varchar (50)
DETERMINISTIC
BEGIN
    declare peso_persona int;
    set peso_persona = (select peso from persona where identificador = dni);
    if peso_persona > 50 then
        return 'Si';
    else
        return 'No';
    end if;
END
//



---Función para comprobar validación:
DELIMITER //
drop function if exists comprueba_valido//
create function comprueba_valido(dni char(9), fecha_donacion date) RETURNS varchar(55)
BEGIN
    declare ultima_donacion date;
    declare sexo varchar(2);
    declare peso_persona int;
    declare dias_diferencia int;
    declare comprueba_peso varchar(2);
    set comprueba_peso = (select valida_peso2(dni, fecha_donacion));
    set ultima_donacion = (select fecha_ultima_donacion from persona where identificador = dni);
    set dias_diferencia = (SELECT TIMESTAMPDIFF(DAY, ultima_donacion, fecha_donacion));
    set sexo = (select sexo from persona where identificador = dni);
    set peso_persona = (select peso from persona where identificador = dni);
    if sexo = 'H' then
        if comprueba_peso = 'Si' then
            if dias_diferencia > 90 then
                call admision(dni, fecha_donacion, 'Si');
            else
                call admision(dni, fecha_donacion, 'No');
        else
            call admision(dni, fecha_donacion, 'No');
    else
        if comprueba_peso = 'Si' then
            if dias_diferencia > 90 then
                call admision(dni, fecha_donacion, 'Si');
            else
                call admision(dni, fecha_donacion, 'No');
        else
            call admision(dni, fecha_donacion, 'No');
    end if;
    return 'Todo ok';
END
//



