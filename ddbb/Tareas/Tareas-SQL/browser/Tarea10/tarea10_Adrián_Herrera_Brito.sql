---Creamos las tablas
CREATE table pieza(
	id int PRIMARY KEY,
	nombre TEXT
);


CREATE table proveedor(
	id text PRIMARY KEY,
	nombre TEXT
);


CREATE table suministrador(
	ref_pieza_codigo int REFERENCES pieza(id),
	ref_proveedor text REFERENCES proveedor(id),
	precio int,
	PRIMARY key(ref_pieza_codigo,ref_proveedor)
);

---Realizamos los insert de las piezas
INSERT into pieza values(1, "Pistón");
INSERT into pieza values(2, "Bujia");
INSERT into pieza values(3, "Radiador");
INSERT into pieza values(4, "Rueda");
INSERT into pieza values(5, "Volante");
INSERT into pieza values(6, "Caja");
INSERT into pieza values(7, "Suspensión");
INSERT into pieza values(8, "Escape");
INSERT into pieza values(9, "Aceite");
INSERT into pieza values(10, "Pastilla");


---Realizamos los insert de los proveedores
INSERT INTO proveedor VALUES("HAL", "Halruedas");
INSERT INTO proveedor VALUES("TNBC", "SkeHington Supplies");
INSERT INTO proveedor VALUES("RBT", "Susan Calvin Corp");
INSERT INTO proveedor VALUES("JCC", "Juan Carlos Carroceria");
INSERT INTO proveedor VALUES("SDH", "Suspensiones Diego Hernández");

---Realizamos los insert del suministrador relacionando ambas tablas
INSERT into suministrador values(4,"RBT", 10);
INSERT into suministrador values(1,"HAL", 15);
INSERT into suministrador values(2,"TNBC", 5);
INSERT into suministrador values(3,"JCC", 5);
INSERT into suministrador values(5,"SDH", 7);
INSERT into suministrador values(6,"RBT", 23);
INSERT into suministrador values(7,"HAL", 20);
INSERT into suministrador values(8,"TNBC", 8);
INSERT into suministrador values(9,"JCC", 12);
INSERT into suministrador values(10,"SDH", 14);   

---Pasamos a realizar las consultas

---1. Obtener los nombres de todas las piezas.
    SELECT nombre from pieza;
---2. Obtener todos los datos de todos los proveedores.
    SELECT * from proveedor;
---3. Obtener el precio medio al que se nos suministran las piezas.
    SELECT avg(precio) from suministrador;
---4. Obtener los nombres de los proveedores que suministran la pieza 1.
    SELECT proveedor.nombre from proveedor, pieza, suministrador on proveedor.id=suministrador.ref_proveedor and pieza.id=suministrador.ref_pieza_codigo and pieza.id=1;
---5. Obtener los nombres de las piezas suministradas por el proveedor cuyo código es HAL.
    SELECT pieza.nombre from pieza join suministrador join proveedor on pieza.id=suministrador.ref_pieza_codigo and proveedor.id=suministrador.ref_proveedor and proveedor.id="HAL";
---6. Obtener los nombres de los proveedores que suministran las piezas más caras, indicando el nombre de la pieza y el precio al que la suministran.
    SELECT p.nombre, pi.nombre, su.precio from proveedor as p, pieza as pi, suministrador as su where pi.id=su.ref_pieza_codigo and p.id=su.ref_proveedor ORDER by su.precio desc;
---7. Hacer constar en la base de datos que la empresa SkeHington Supplies (codigo TNBC) va a empezar a suministrarnos los elementos piezas con código 1 a 10 € cada tuerca.
    UPDATE suministrador set ref_pieza_codigo="1", ref_proveedor="TNBC", precio=10 where ref_pieza_codigo=1;
---8. Aumentar los precios en una unidad.
    UPDATE suministrador set precio = precio + 1;
---9. Hacer constar en la base de datos que la empresa Susan Calvin Corp.(RBT) no va a suministrarnos ninguna pieza (aunque la empresa en si va a seguir constando en nuestra base de datos).
    DELETE from suministrador where ref_proveedor="RBT";
---10. Hacer constar en la base de datos que la empresa Susan Calvin Corp. (RBT) ya no va a suministrarnos clavos (código 4).
    DELETE from suministrador where ref_proveedor="RBT" and ref_pieza_codigo=4;

