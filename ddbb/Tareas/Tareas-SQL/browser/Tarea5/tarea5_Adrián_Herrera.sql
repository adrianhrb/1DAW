--- Hacemos la creacion de las tablas: 
    CREATE TABLE caja(
        id INT PRIMARY KEY,
        contenido TEXT,
        valor INT,
        id_almacen INT	REFERENCES almacen(id)
    );

    CREATE TABLE almacen(
	id INT,
	lugar TEXT,
	capacidad INT,
	PRIMARY KEY(id)
    );

--- Realizamos los Insert de la tabla almacen:
    INSERT INTO almacen values ("1", "Sevilla", "10000");
    INSERT INTO almacen values ("2", "Madrid", "9500");
    INSERT INTO almacen values ("3", "Valencia", "9500");
    INSERT INTO almacen values ("4", "Valladolid", "17000");
    INSERT INTO almacen values ("5", "Sevilla", "5900");
    INSERT INTO almacen values ("6", "Lugo", "7500");
    INSERT INTO almacen values ("7", "Barcelona", "12000");
    INSERT INTO almacen values ("8", "Madrid", "15000");
    INSERT INTO almacen values ("9", "Tenerife", "6000");
    INSERT INTO almacen values ("10", "Las Palmas", "6000");
    INSERT INTO almacen values ("11", "Santander", "8500");
    INSERT INTO almacen values ("12", "Vigo", "2000");
    INSERT INTO almacen values ("13", "Barcelona", "2500");
    INSERT INTO almacen values ("14", "Sevilla", "2230");
    INSERT INTO almacen values ("15", "Lanzarote", "5500");
    INSERT INTO almacen values ("16", "La Palma", "4000");
    INSERT INTO almacen values ("17", "Pontevedra", "3750");
    INSERT INTO almacen values ("18", "Madrid", "14000");
    INSERT INTO almacen values ("19", "Barcelona", "19000");
    INSERT INTO almacen values ("20", "Barcelona", "12000");

--- Realizamos los Insert de la tabla caja:
    INSERT into caja VALUES ("1", "Tornillos", "140", "1");
    INSERT into caja VALUES ("2", "Cuerdas", "300", "2");
    INSERT into caja VALUES ("3", "Ruedas", "120", "3");
    INSERT into caja VALUES ("4", "Puertas", "100", "4");
    INSERT into caja VALUES ("5", "Ventanas", "175", "5");
    INSERT into caja VALUES ("6", "Hormigón", "140", "6");
    INSERT into caja VALUES ("7", "Pintura", "240", "7");
    INSERT into caja VALUES ("8", "Tuercas", "115", "8");
    INSERT into caja VALUES ("9", "Sierras", "195", "9");
    INSERT into caja VALUES ("10", "Destornilladores", "200", "10");
    INSERT into caja VALUES ("11", "Picos", "150", "11");
    INSERT into caja VALUES ("12", "Palas", "125", "12");
    INSERT into caja VALUES ("13", "Llantas", "240", "13");
    INSERT into caja VALUES ("14", "Escapes", "175", "14");
    INSERT into caja VALUES ("15", "Fundas", "120", "15");
    INSERT into caja VALUES ("16", "Pantallas", "230", "16");
    INSERT into caja VALUES ("17", "Teclados", "290", "17");
    INSERT into caja VALUES ("18", "Ratones", "300", "18");
    INSERT into caja VALUES ("19", "Discos", "110", "19");
    INSERT into caja VALUES ("20", "Leds", "90", "20");

--- Empezamos a hacer las consultas:
---1. Obtener todos los almacenes
    SELECT * from almacen;
---2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150 €.
    SELECT * from caja where valor > 150;
---3. Obtener los tipos de contenidos de las cajas.
    SELECT distinct contenido from caja;
---4. Obtener el valor medio de todas las cajas.
    SELECT avg(valor) from caja;
---5. Obtener el valor medio de las cajas de cada almacén.
    SELECT avg(valor), almacen.id from caja, almacen order by almacen.id
---6. Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150 €.
    SELECT almacen.id, avg(valor) from almacen, caja where 150 < (SELECT avg(valor) from caja) and caja.id_almacen=almacen.id;
---7. Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en la que se encuentra.
    SELECT caja.id, almacen.lugar from caja, almacen where caja.id_almacen=almacen.id;
---8. Obtener el número de cajas que hay en cada almacén.
    SELECT almacen.id, count(*) from almacen, caja where caja.id_almacen=almacen.id GROUP by almacen.id;
---9. Obtener los códigos de los almacenes que están saturados (los almacenes donde el número de cajas es superior a la capacidad).

---10. Obtener los números de referencia de las cajas que están en Bilbao.
    SELECT caja.id from caja, almacen where caja.id_almacen=almacen.id and almacen.lugar="Bilbao";
---11. Insertar un nuevo almacén en Madrid con capacidad para 3 cajas.
    INSERT into almacen values(21, "Madrid", 3);
---12. Insertar una nueva caja, con número de referencia __PH5__, con contenido __Papel__, valor 100, y situada en el almacén 2.
    INSERT into caja values("PH5", "Papel", 100, 2);    
---13. Rebajar el valor de todas las cajas un __15%__, dado que estamos en rebajas.
    UPDATE caja set valor=valor-(valor*0.15);
---14. Rebajar un __20%__ el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.
    UPDATE caja set valor=valor-(valor*0.20) where valor > (SELECT avg(valor) from caja);
---15. Eliminar todas las cajas cuyo valor sea inferior a __100__.
    DELETE from caja where valor < 100;
---16. Vaciar el contenido de los almacenes que están saturados.
    
