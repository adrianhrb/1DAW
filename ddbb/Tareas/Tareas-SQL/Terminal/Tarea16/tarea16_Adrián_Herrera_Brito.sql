---CONSULTAS SOBRE UNA TABLA

---Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
sqlite> SELECT codigo_oficina, ciudad from oficina;
/* ┌────────────────┬──────────────────────┐
│ codigo_oficina │        ciudad        │
├────────────────┼──────────────────────┤
│ BCN-ES         │ Barcelona            │
│ BOS-USA        │ Boston               │
│ LON-UK         │ Londres              │
│ MAD-ES         │ Madrid               │
│ PAR-FR         │ Paris                │
│ SFC-USA        │ San Francisco        │
│ SYD-AU         │ Sydney               │
│ TAL-ES         │ Talavera de la Reina │
│ TOK-JP         │ Tokyo                │
└────────────────┴──────────────────────┘ */

---Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
sqlite> SELECT ciudad, telefono from oficina where pais="España";
/* ┌──────────────────────┬────────────────┐
│        ciudad        │    telefono    │
├──────────────────────┼────────────────┤
│ Barcelona            │ +34 93 3561182 │
│ Madrid               │ +34 91 7514487 │
│ Talavera de la Reina │ +34 925 867231 │
└──────────────────────┴────────────────┘ */

---Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
sqlite> SELECT nombre,apellido1,apellido2,email from empleado where codigo_jefe=7;
/* ┌─────────┬───────────┬───────────┬──────────────────────────┐
│ nombre  │ apellido1 │ apellido2 │          email           │
├─────────┼───────────┼───────────┼──────────────────────────┤
│ Mariano │ López     │ Murcia    │ mlopez@jardineria.es     │
│ Lucio   │ Campoamor │ Martín    │ lcampoamor@jardineria.es │
│ Hilario │ Rodriguez │ Huertas   │ hrodriguez@jardineria.es │
└─────────┴───────────┴───────────┴──────────────────────────┘ */

---Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
sqlite> SELECT puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is null;
/* ┌──────────────────┬────────┬───────────┬───────────┬──────────────────────┐
│      puesto      │ nombre │ apellido1 │ apellido2 │        email         │
├──────────────────┼────────┼───────────┼───────────┼──────────────────────┤
│ Director General │ Marcos │ Magaña    │ Perez     │ marcos@jardineria.es │
└──────────────────┴────────┴───────────┴───────────┴──────────────────────┘ */

---Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
sqlite> SELECT nombre, apellido1, apellido2, puesto from empleado where puesto not in ("Representante Ventas");
/* ┌──────────┬────────────┬───────────┬───────────────────────┐
│  nombre  │ apellido1  │ apellido2 │        puesto         │
├──────────┼────────────┼───────────┼───────────────────────┤
│ Marcos   │ Magaña     │ Perez     │ Director General      │
│ Ruben    │ López      │ Martinez  │ Subdirector Marketing │
│ Alberto  │ Soria      │ Carrasco  │ Subdirector Ventas    │
│ Maria    │ Solís      │ Jerez     │ Secretaria            │
│ Carlos   │ Soria      │ Jimenez   │ Director Oficina      │
│ Emmanuel │ Magaña     │ Perez     │ Director Oficina      │
│ Francois │ Fignon     │           │ Director Oficina      │
│ Michael  │ Bolton     │           │ Director Oficina      │
│ Hilary   │ Washington │           │ Director Oficina      │
│ Nei      │ Nishikori  │           │ Director Oficina      │
│ Amy      │ Johnson    │           │ Director Oficina      │
│ Kevin    │ Fallmer    │           │ Director Oficina      │
└──────────┴────────────┴───────────┴───────────────────────┘ */

---Devuelve un listado con el nombre de los todos los clientes españoles.
sqlite> SELECT nombre_cliente from cliente where pais="Spain";
/* ┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Lasas S.A.                     │
│ Beragua                        │
│ Club Golf Puerta del hierro    │
│ Naturagua                      │
│ DaraDistribuciones             │
│ Madrileña de riegos            │
│ Lasas S.A.                     │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Flowers, S.A                   │
│ Naturajardin                   │
│ Golf S.A.                      │
│ Americh Golf Management SL     │
│ Aloha                          │
│ El Prat                        │
│ Sotogrande                     │
│ Vivero Humanes                 │
│ Fuenla City                    │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Top Campo                      │
│ Jardineria Sara                │
│ Campohermoso                   │
│ Flores S.L.                    │
└────────────────────────────────┘ */

---Devuelve un listado con los distintos estados por los que puede pasar un pedido.
sqlite> SELECT DISTINCT estado from pedido;
/* ┌───────────┐
│  estado   │
├───────────┤
│ Entregado │
│ Rechazado │
│ Pendiente │
└───────────┘ */

---Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
sqlite> SELECT DISTINCT codigo_cliente from pedido where fecha_pedido REGEXP "^2008";
/* ┌────────────────┐
│ codigo_cliente │
├────────────────┤
│ 5              │
│ 1              │
│ 14             │
│ 13             │
│ 4              │
│ 26             │
│ 15             │
│ 35             │
│ 16             │
│ 36             │
│ 38             │
└────────────────┘ */

---Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
sqlite> SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega > fecha_esperada;
/* ┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 9             │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 13            │ 7              │ 2009-01-14     │ 2009-01-15    │
│ 16            │ 7              │ 2009-01-07     │ 2009-01-15    │
│ 17            │ 7              │ 2009-01-09     │ 2009-01-11    │
│ 18            │ 9              │ 2009-01-06     │ 2009-01-07    │
│ 22            │ 9              │ 2009-01-11     │ 2009-01-13    │
│ 28            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │
│ 32            │ 4              │ 2007-01-19     │ 2007-01-27    │
│ 38            │ 19             │ 2009-03-06     │ 2009-03-07    │
│ 39            │ 19             │ 2009-03-07     │ 2009-03-09    │
│ 40            │ 19             │ 2009-03-10     │ 2009-03-13    │
│ 42            │ 19             │ 2009-03-23     │ 2009-03-27    │
│ 43            │ 23             │ 2009-03-26     │ 2009-03-28    │
│ 44            │ 23             │ 2009-03-27     │ 2009-03-30    │
│ 45            │ 23             │ 2009-03-04     │ 2009-03-07    │
│ 46            │ 23             │ 2009-03-04     │ 2009-03-05    │
│ 49            │ 26             │ 2008-07-22     │ 2008-07-30    │
│ 55            │ 14             │ 2009-01-10     │ 2009-01-11    │
│ 60            │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 68            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 92            │ 27             │ 2009-04-30     │ 2009-05-03    │
│ 96            │ 35             │ 2008-04-12     │ 2008-04-13    │
│ 103           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 106           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 112           │ 36             │ 2009-04-06     │ 2009-05-07    │
│ 113           │ 36             │ 2008-11-09     │ 2009-01-09    │
│ 114           │ 36             │ 2009-01-29     │ 2009-01-31    │
│ 115           │ 36             │ 2009-01-26     │ 2009-02-27    │
│ 123           │ 30             │ 2009-01-20     │ 2009-01-24    │
│ 126           │ 30             │ 2009-05-15     │ 2009-05-20    │
│ 128           │ 38             │ 2008-12-10     │ 2008-12-29    │
└───────────────┴────────────────┴────────────────┴───────────────┘ */

---Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.


---Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
sqlite> SELECT * from pedido where fecha_pedido REGEXP "^2009" and estado="Rechazado";
/* ┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬──────────────────────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                               comentarios                                │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼──────────────────────────────────────────────────────────────────────────┼────────────────┤
│ 14            │ 2009-01-02   │ 2009-01-02     │               │ Rechazado │ mal pago                                                                 │ 7              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                                 │ 9              │
│ 25            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                         │ 1              │
│ 26            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                 │ 3              │
│ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                                          │ 19             │
│ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                                          │ 23             │
│ 65            │ 2009-02-02   │ 2009-02-08     │               │ Rechazado │ El cliente carece de saldo en la cuenta asociada                         │ 1              │
│ 66            │ 2009-02-06   │ 2009-02-12     │               │ Rechazado │ El cliente anula la operacion para adquirir mas producto                 │ 3              │
│ 74            │ 2009-01-14   │ 2009-01-22     │               │ Rechazado │ El pedido no llego el dia que queria el cliente por fallo del transporte │ 15             │
│ 81            │ 2009-01-18   │ 2009-01-24     │               │ Rechazado │ Los producto estaban en mal estado                                       │ 28             │
│ 101           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                   │ 16             │
│ 105           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                      │ 30             │
│ 120           │ 2009-03-07   │ 2009-03-27     │               │ Rechazado │ El pedido fue rechazado por el cliente                                   │ 16             │
│ 125           │ 2009-02-14   │ 2009-02-20     │               │ Rechazado │ el producto ha sido rechazado por la pesima calidad                      │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴──────────────────────────────────────────────────────────────────────────┴────────────────┘ */
---Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
sqlite> SELECT * from pedido where fecha_entrega like "%-01-%";
/* ┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬───────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                        comentarios                        │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼───────────────────────────────────────────────────────────┼────────────────┤
│ 1             │ 2006-01-17   │ 2006-01-19     │ 2006-01-19    │ Entregado │ Pagado a plazos                                           │ 5              │
│ 13            │ 2009-01-12   │ 2009-01-14     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 15            │ 2009-01-09   │ 2009-01-12     │ 2009-01-11    │ Entregado │                                                           │ 7              │
│ 16            │ 2009-01-06   │ 2009-01-07     │ 2009-01-15    │ Entregado │                                                           │ 7              │
│ 17            │ 2009-01-08   │ 2009-01-09     │ 2009-01-11    │ Entregado │ mal estado                                                │ 7              │
│ 18            │ 2009-01-05   │ 2009-01-06     │ 2009-01-07    │ Entregado │                                                           │ 9              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                  │ 9              │
│ 22            │ 2009-01-11   │ 2009-01-11     │ 2009-01-13    │ Entregado │                                                           │ 9              │
│ 32            │ 2007-01-07   │ 2007-01-19     │ 2007-01-27    │ Entregado │ Entrega tardia, el cliente puso reclamacion               │ 4              │
│ 55            │ 2008-12-10   │ 2009-01-10     │ 2009-01-11    │ Entregado │ Retrasado 1 dia por problemas de transporte               │ 14             │
│ 58            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 3              │
│ 64            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                             │ 1              │
│ 75            │ 2009-01-11   │ 2009-01-13     │ 2009-01-13    │ Entregado │ El pedido llego perfectamente                             │ 15             │
│ 79            │ 2009-01-12   │ 2009-01-13     │ 2009-01-13    │ Entregado │                                                           │ 28             │
│ 82            │ 2009-01-20   │ 2009-01-29     │ 2009-01-29    │ Entregado │ El pedido llego un poco mas tarde de la hora fijada       │ 28             │
│ 95            │ 2008-01-04   │ 2008-01-19     │ 2008-01-19    │ Entregado │                                                           │ 35             │
│ 100           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 102           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 103           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio │ 36             │
│ 114           │ 2009-01-15   │ 2009-01-29     │ 2009-01-31    │ Entregado │ El envio llego dos dias más tarde debido al mal tiempo    │ 36             │
│ 119           │ 2009-01-10   │ 2009-01-15     │ 2009-01-15    │ Entregado │ El pedido llego perfectamente                             │ 16             │
│ 121           │ 2008-12-28   │ 2009-01-08     │ 2009-01-08    │ Entregado │ Pago pendiente                                            │ 16             │
│ 123           │ 2009-01-15   │ 2009-01-20     │ 2009-01-24    │ Pendiente │                                                           │ 30             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴───────────────────────────────────────────────────────────┴────────────────┘ */

---Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
sqlite> SELECT * from pago where fecha_pago REGEXP "^2008" and forma_pago="PayPal";
/* ┌────────────────┬────────────┬────────────────┬────────────┬─────────┐
│ codigo_cliente │ forma_pago │ id_transaccion │ fecha_pago │  total  │
├────────────────┼────────────┼────────────────┼────────────┼─────────┤
│ 1              │ PayPal     │ ak-std-000001  │ 2008-11-10 │ 2000.0  │
│ 1              │ PayPal     │ ak-std-000002  │ 2008-12-10 │ 2000.0  │
│ 13             │ PayPal     │ ak-std-000014  │ 2008-08-04 │ 2246.0  │
│ 14             │ PayPal     │ ak-std-000015  │ 2008-07-15 │ 4160.0  │
│ 26             │ PayPal     │ ak-std-000020  │ 2008-03-18 │ 18846.0 │
└────────────────┴────────────┴────────────────┴────────────┴─────────┘ */

---Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
sqlite> SELECT DISTINCT forma_pago from pago;
/* ┌───────────────┐
│  forma_pago   │
├───────────────┤
│ PayPal        │
│ Transferencia │
│ Cheque        │
└───────────────┘ */
---Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
sqlite> SELECT nombre from producto where gama="Ornamentales" and cantidad_en_stock > 100;
/* ┌──────────────────────────────────────────────┐
│                    nombre                    │
├──────────────────────────────────────────────┤
│ Escallonia (Mix)                             │
│ Evonimus Emerald Gayeti                      │
│ Evonimus Pulchellus                          │
│ Forsytia Intermedia \"Lynwood\"              │
│ Hibiscus Syriacus  \"Diana\" -Blanco Puro    │
│ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo │
│ Hibiscus Syriacus \"Pink Giant\" Rosa        │
│ Laurus Nobilis Arbusto - Ramificado Bajo     │
│ Lonicera Nitida                              │
│ Lonicera Nitida \"Maigrum\"                  │
│ Lonicera Pileata                             │
│ Philadelphus \"Virginal\"                    │
│ Prunus pisardii                              │
│ Viburnum Tinus \"Eve Price\"                 │
│ Weigelia \"Bristol Ruby\"                    │
└──────────────────────────────────────────────┘ */

---Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
sqlite> select nombre_cliente from cliente where ciudad="Madrid" and codigo_empleado_rep_ventas in (11,30);
/* ┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Beragua                     │
│ Club Golf Puerta del hierro │
│ Naturagua                   │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Jardin de Flores            │
│ Naturajardin                │
└─────────────────────────────┘ */



---CONSULTAS CON JOINS

---Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
sqlite> SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c JOIN empleado as e on e.codigo_empleado=codigo_empleado_rep_ventas;
/* ┌────────────────────────────────┬─────────────────┬────────────┬───────────┐
│         nombre_cliente         │     nombre      │ apellido1  │ apellido2 │
├────────────────────────────────┼─────────────────┼────────────┼───────────┤
│ GoldFish Garden                │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gardening Associates           │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gerudo Valley                  │ Lorena          │ Paxton     │           │
│ Tendo Garden                   │ Lorena          │ Paxton     │           │
│ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │
│ Beragua                        │ Emmanuel        │ Magaña     │ Perez     │
│ Club Golf Puerta del hierro    │ Emmanuel        │ Magaña     │ Perez     │
│ Naturagua                      │ Emmanuel        │ Magaña     │ Perez     │
│ DaraDistribuciones             │ Emmanuel        │ Magaña     │ Perez     │
│ Madrileña de riegos            │ Emmanuel        │ Magaña     │ Perez     │
│ Lasas S.A.                     │ Mariano         │ López      │ Murcia    │
│ Camunas Jardines S.L.          │ Mariano         │ López      │ Murcia    │
│ Dardena S.A.                   │ Mariano         │ López      │ Murcia    │
│ Jardin de Flores               │ Julian          │ Bellinelli │           │
│ Flores Marivi                  │ Felipe          │ Rosas      │ Marquez   │
│ Flowers, S.A                   │ Felipe          │ Rosas      │ Marquez   │
│ Naturajardin                   │ Julian          │ Bellinelli │           │
│ Golf S.A.                      │ José Manuel     │ Martinez   │ De la Osa │
│ Americh Golf Management SL     │ José Manuel     │ Martinez   │ De la Osa │
│ Aloha                          │ José Manuel     │ Martinez   │ De la Osa │
│ El Prat                        │ José Manuel     │ Martinez   │ De la Osa │
│ Sotogrande                     │ José Manuel     │ Martinez   │ De la Osa │
│ Vivero Humanes                 │ Julian          │ Bellinelli │           │
│ Fuenla City                    │ Felipe          │ Rosas      │ Marquez   │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Campoamor  │ Martín    │
│ Jardinerías Matías SL          │ Lucio           │ Campoamor  │ Martín    │
│ Agrojardin                     │ Julian          │ Bellinelli │           │
│ Top Campo                      │ Felipe          │ Rosas      │ Marquez   │
│ Jardineria Sara                │ Felipe          │ Rosas      │ Marquez   │
│ Campohermoso                   │ Julian          │ Bellinelli │           │
│ france telecom                 │ Lionel          │ Narvaez    │           │
│ Musée du Louvre                │ Lionel          │ Narvaez    │           │
│ Tutifruti S.A                  │ Mariko          │ Kishi      │           │
│ Flores S.L.                    │ Michael         │ Bolton     │           │
│ The Magic Garden               │ Michael         │ Bolton     │           │
│ El Jardin Viviente S.L         │ Mariko          │ Kishi      │           │
└────────────────────────────────┴─────────────────┴────────────┴───────────┘ */

---Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
sqlite> SELECT c.nombre_cliente, e.nombre from cliente as c JOIN empleado as e JOIN pago as p on p.codigo_cliente=c.codigo_cliente and e.codigo_empleado=c.codigo_empleado_rep_ventas;
/* ┌────────────────────────────────┬─────────────────┐
│         nombre_cliente         │     nombre      │
├────────────────────────────────┼─────────────────┤
│ GoldFish Garden                │ Walter Santiago │
│ GoldFish Garden                │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gardening Associates           │ Walter Santiago │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Gerudo Valley                  │ Lorena          │
│ Tendo Garden                   │ Lorena          │
│ Beragua                        │ Emmanuel        │
│ Naturagua                      │ Emmanuel        │
│ Camunas Jardines S.L.          │ Mariano         │
│ Dardena S.A.                   │ Mariano         │
│ Jardin de Flores               │ Julian          │
│ Jardin de Flores               │ Julian          │
│ Flores Marivi                  │ Felipe          │
│ Golf S.A.                      │ José Manuel     │
│ Sotogrande                     │ José Manuel     │
│ Jardines y Mansiones Cactus SL │ Lucio           │
│ Jardinerías Matías SL          │ Lucio           │
│ Agrojardin                     │ Julian          │
│ Jardineria Sara                │ Felipe          │
│ Tutifruti S.A                  │ Mariko          │
│ El Jardin Viviente S.L         │ Mariko          │
└────────────────────────────────┴─────────────────┘ */

---Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
sqlite> SELECT c.nombre_cliente, e.nombre from cliente as c JOIN empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado LEFT JOIN pago as p on p.codigo_cliente=c.codigo_cliente where p.codigo_cliente is null;
/* ┌─────────────────────────────┬─────────────┐
│       nombre_cliente        │   nombre    │
├─────────────────────────────┼─────────────┤
│ Lasas S.A.                  │ Mariano     │
│ Club Golf Puerta del hierro │ Emmanuel    │
│ DaraDistribuciones          │ Emmanuel    │
│ Madrileña de riegos         │ Emmanuel    │
│ Lasas S.A.                  │ Mariano     │
│ Flowers, S.A                │ Felipe      │
│ Naturajardin                │ Julian      │
│ Americh Golf Management SL  │ José Manuel │
│ Aloha                       │ José Manuel │
│ El Prat                     │ José Manuel │
│ Vivero Humanes              │ Julian      │
│ Fuenla City                 │ Felipe      │
│ Top Campo                   │ Felipe      │
│ Campohermoso                │ Julian      │
│ france telecom              │ Lionel      │
│ Musée du Louvre             │ Lionel      │
│ Flores S.L.                 │ Michael     │
│ The Magic Garden            │ Michael     │
└─────────────────────────────┴─────────────┘ */
---Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
sqlite> SELECT c.nombre_cliente, e.nombre, o.ciudad from cliente as c JOIN empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado JOIN oficina as o on o.codigo_oficina=e.codigo_oficina LEFT JOIN pago as p on p.codigo_cliente=c.codigo_cliente where p.codigo_cliente is null;
/* ┌─────────────────────────────┬─────────────┬──────────────────────┐
│       nombre_cliente        │   nombre    │        ciudad        │
├─────────────────────────────┼─────────────┼──────────────────────┤
│ Lasas S.A.                  │ Mariano     │ Madrid               │
│ Club Golf Puerta del hierro │ Emmanuel    │ Barcelona            │
│ DaraDistribuciones          │ Emmanuel    │ Barcelona            │
│ Madrileña de riegos         │ Emmanuel    │ Barcelona            │
│ Lasas S.A.                  │ Mariano     │ Madrid               │
│ Flowers, S.A                │ Felipe      │ Talavera de la Reina │
│ Naturajardin                │ Julian      │ Sydney               │
│ Americh Golf Management SL  │ José Manuel │ Barcelona            │
│ Aloha                       │ José Manuel │ Barcelona            │
│ El Prat                     │ José Manuel │ Barcelona            │
│ Vivero Humanes              │ Julian      │ Sydney               │
│ Fuenla City                 │ Felipe      │ Talavera de la Reina │
│ Top Campo                   │ Felipe      │ Talavera de la Reina │
│ Campohermoso                │ Julian      │ Sydney               │
│ france telecom              │ Lionel      │ Paris                │
│ Musée du Louvre             │ Lionel      │ Paris                │
│ Flores S.L.                 │ Michael     │ San Francisco        │
│ The Magic Garden            │ Michael     │ San Francisco        │
└─────────────────────────────┴─────────────┴──────────────────────┘ */

---Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
sqlite> SELECT o.linea_direccion1, o.linea_direccion2 from oficina as o JOIN empleado as e JOIN cliente as c on e.codigo_oficina=o.codigo_oficina and e.codigo_empleado=c.codigo_empleado_rep_ventas and c.ciudad="Fuenlabrada";
/* ┌──────────────────────────────┬────────────────────┐
│       linea_direccion1       │  linea_direccion2  │
├──────────────────────────────┼────────────────────┤
│ Bulevar Indalecio Prieto, 32 │                    │
│ Bulevar Indalecio Prieto, 32 │                    │
│ Francisco Aguirre, 32        │ 5º piso (exterior) │
│ Francisco Aguirre, 32        │ 5º piso (exterior) │
│ Francisco Aguirre, 32        │ 5º piso (exterior) │
│ 5-11 Wentworth Avenue        │ Floor #2           │
└──────────────────────────────┴────────────────────┘ */

---Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
sqlite> SELECT c.nombre_cliente, e.nombre, o.ciudad from cliente as c JOIN empleado as e JOIN oficina as o on c.codigo_empleado_rep_ventas=e.codigo_empleado and e.codigo_oficina=o.codigo_oficina;
/* ┌────────────────────────────────┬─────────────────┬──────────────────────┐
│         nombre_cliente         │     nombre      │        ciudad        │
├────────────────────────────────┼─────────────────┼──────────────────────┤
│ GoldFish Garden                │ Walter Santiago │ San Francisco        │
│ Gardening Associates           │ Walter Santiago │ San Francisco        │
│ Gerudo Valley                  │ Lorena          │ Boston               │
│ Tendo Garden                   │ Lorena          │ Boston               │
│ Lasas S.A.                     │ Mariano         │ Madrid               │
│ Beragua                        │ Emmanuel        │ Barcelona            │
│ Club Golf Puerta del hierro    │ Emmanuel        │ Barcelona            │
│ Naturagua                      │ Emmanuel        │ Barcelona            │
│ DaraDistribuciones             │ Emmanuel        │ Barcelona            │
│ Madrileña de riegos            │ Emmanuel        │ Barcelona            │
│ Lasas S.A.                     │ Mariano         │ Madrid               │
│ Camunas Jardines S.L.          │ Mariano         │ Madrid               │
│ Dardena S.A.                   │ Mariano         │ Madrid               │
│ Jardin de Flores               │ Julian          │ Sydney               │
│ Flores Marivi                  │ Felipe          │ Talavera de la Reina │
│ Flowers, S.A                   │ Felipe          │ Talavera de la Reina │
│ Naturajardin                   │ Julian          │ Sydney               │
│ Golf S.A.                      │ José Manuel     │ Barcelona            │
│ Americh Golf Management SL     │ José Manuel     │ Barcelona            │
│ Aloha                          │ José Manuel     │ Barcelona            │
│ El Prat                        │ José Manuel     │ Barcelona            │
│ Sotogrande                     │ José Manuel     │ Barcelona            │
│ Vivero Humanes                 │ Julian          │ Sydney               │
│ Fuenla City                    │ Felipe          │ Talavera de la Reina │
│ Jardines y Mansiones Cactus SL │ Lucio           │ Madrid               │
│ Jardinerías Matías SL          │ Lucio           │ Madrid               │
│ Agrojardin                     │ Julian          │ Sydney               │
│ Top Campo                      │ Felipe          │ Talavera de la Reina │
│ Jardineria Sara                │ Felipe          │ Talavera de la Reina │
│ Campohermoso                   │ Julian          │ Sydney               │
│ france telecom                 │ Lionel          │ Paris                │
│ Musée du Louvre                │ Lionel          │ Paris                │
│ Tutifruti S.A                  │ Mariko          │ Sydney               │
│ Flores S.L.                    │ Michael         │ San Francisco        │
│ The Magic Garden               │ Michael         │ San Francisco        │
│ El Jardin Viviente S.L         │ Mariko          │ Sydney               │
└────────────────────────────────┴─────────────────┴──────────────────────┘ */

---Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
sqlite> SELECT e.nombre, je.nombre from empleado as e JOIN empleado as je on e.codigo_empleado=je.codigo_jefe;
/* ┌──────────┬─────────────────┐
│  nombre  │     nombre      │
├──────────┼─────────────────┤
│ Marcos   │ Ruben           │
│ Ruben    │ Alberto         │
│ Ruben    │ Maria           │
│ Alberto  │ Felipe          │
│ Alberto  │ Juan Carlos     │
│ Alberto  │ Carlos          │
│ Carlos   │ Mariano         │
│ Carlos   │ Lucio           │
│ Carlos   │ Hilario         │
│ Alberto  │ Emmanuel        │
│ Emmanuel │ José Manuel     │
│ Emmanuel │ David           │
│ Emmanuel │ Oscar           │
│ Alberto  │ Francois        │
│ Francois │ Lionel          │
│ Francois │ Laurent         │
│ Alberto  │ Michael         │
│ Michael  │ Walter Santiago │
│ Alberto  │ Hilary          │
│ Hilary   │ Marcus          │
│ Hilary   │ Lorena          │
│ Alberto  │ Nei             │
│ Nei      │ Narumi          │
│ Nei      │ Takuma          │
│ Alberto  │ Amy             │
│ Amy      │ Larry           │
│ Amy      │ John            │
│ Alberto  │ Kevin           │
│ Kevin    │ Julian          │
│ Kevin    │ Mariko          │
└──────────┴─────────────────┘ */

---Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
sqlite> SELECT e.nombre, je.nombre, jj.nombre from empleado as e JOIN empleado as je JOIN empleado as jj on e.codigo_jefe=je.codigo_empleado and je.codigo_jefe=jj.codigo_empleado;
/* ┌─────────────────┬──────────┬─────────┐
│     nombre      │  nombre  │ nombre  │
├─────────────────┼──────────┼─────────┤
│ Alberto         │ Ruben    │ Marcos  │
│ Maria           │ Ruben    │ Marcos  │
│ Felipe          │ Alberto  │ Ruben   │
│ Juan Carlos     │ Alberto  │ Ruben   │
│ Carlos          │ Alberto  │ Ruben   │
│ Mariano         │ Carlos   │ Alberto │
│ Lucio           │ Carlos   │ Alberto │
│ Hilario         │ Carlos   │ Alberto │
│ Emmanuel        │ Alberto  │ Ruben   │
│ José Manuel     │ Emmanuel │ Alberto │
│ David           │ Emmanuel │ Alberto │
│ Oscar           │ Emmanuel │ Alberto │
│ Francois        │ Alberto  │ Ruben   │
│ Lionel          │ Francois │ Alberto │
│ Laurent         │ Francois │ Alberto │
│ Michael         │ Alberto  │ Ruben   │
│ Walter Santiago │ Michael  │ Alberto │
│ Hilary          │ Alberto  │ Ruben   │
│ Marcus          │ Hilary   │ Alberto │
│ Lorena          │ Hilary   │ Alberto │
│ Nei             │ Alberto  │ Ruben   │
│ Narumi          │ Nei      │ Alberto │
│ Takuma          │ Nei      │ Alberto │
│ Amy             │ Alberto  │ Ruben   │
│ Larry           │ Amy      │ Alberto │
│ John            │ Amy      │ Alberto │
│ Kevin           │ Alberto  │ Ruben   │
│ Julian          │ Kevin    │ Alberto │
│ Mariko          │ Kevin    │ Alberto │
└─────────────────┴──────────┴─────────┘ */

---Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
sqlite> SELECT c.nombre_cliente from cliente as c JOIN pedido as p on p.codigo_cliente=c.codigo_cliente and p.fecha_entrega > p.fecha_esperada;
/* ┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ GoldFish Garden                │
│ Beragua                        │
│ Beragua                        │
│ Beragua                        │
│ Naturagua                      │
│ Naturagua                      │
│ Gardening Associates           │
│ Camunas Jardines S.L.          │
│ Gerudo Valley                  │
│ Golf S.A.                      │
│ Golf S.A.                      │
│ Golf S.A.                      │
│ Golf S.A.                      │
│ Sotogrande                     │
│ Sotogrande                     │
│ Sotogrande                     │
│ Sotogrande                     │
│ Jardines y Mansiones Cactus SL │
│ Dardena S.A.                   │
│ GoldFish Garden                │
│ Gardening Associates           │
│ Jardinerías Matías SL          │
│ Tutifruti S.A                  │
│ Jardineria Sara                │
│ Jardineria Sara                │
│ Flores S.L.                    │
│ Flores S.L.                    │
│ Flores S.L.                    │
│ Flores S.L.                    │
│ Jardineria Sara                │
│ Jardineria Sara                │
│ El Jardin Viviente S.L         │
└────────────────────────────────┘ */

---Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.



--- Consultas multitabla (LEFT JOIN, RIGHT JOIN)

---Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
sqlite> SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto from cliente as c LEFT JOIN pago as p on p.codigo_cliente=c.codigo_cliente where p.codigo_cliente is null;
/* ┌─────────────────────────────┬─────────────────┬───────────────────┐
│       nombre_cliente        │ nombre_contacto │ apellido_contacto │
├─────────────────────────────┼─────────────────┼───────────────────┤
│ Lasas S.A.                  │ Antonio         │ Lasas             │
│ Club Golf Puerta del hierro │ Paco            │ Lopez             │
│ DaraDistribuciones          │ David           │ Serrano           │
│ Madrileña de riegos         │ Jose            │ Tacaño            │
│ Lasas S.A.                  │ Antonio         │ Lasas             │
│ Flowers, S.A                │ Beatriz         │ Fernandez         │
│ Naturajardin                │ Victoria        │ Cruz              │
│ Americh Golf Management SL  │ Mario           │ Suarez            │
│ Aloha                       │ Cristian        │ Rodrigez          │
│ El Prat                     │ Francisco       │ Camacho           │
│ Vivero Humanes              │ Federico        │ Gomez             │
│ Fuenla City                 │ Tony            │ Muñoz Mena        │
│ Top Campo                   │ Joseluis        │ Sanchez           │
│ Campohermoso                │ Luis            │ Jimenez           │
│ france telecom              │ FraÃ§ois        │ Toulou            │
│ Musée du Louvre             │ Pierre          │ Delacroux         │
│ Flores S.L.                 │ Antonio         │ Romero            │
│ The Magic Garden            │ Richard         │ Mcain             │
└─────────────────────────────┴─────────────────┴───────────────────┘ */

---Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
sqlite> SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto from cliente as c LEFT JOIN pedido as p on c.codigo_cliente=p.codigo_cliente where p.codigo_cliente is null;
/* ┌─────────────────────────────┬─────────────────┬───────────────────┐
│       nombre_cliente        │ nombre_contacto │ apellido_contacto │
├─────────────────────────────┼─────────────────┼───────────────────┤
│ Lasas S.A.                  │ Antonio         │ Lasas             │
│ Club Golf Puerta del hierro │ Paco            │ Lopez             │
│ DaraDistribuciones          │ David           │ Serrano           │
│ Madrileña de riegos         │ Jose            │ Tacaño            │
│ Lasas S.A.                  │ Antonio         │ Lasas             │
│ Flowers, S.A                │ Beatriz         │ Fernandez         │
│ Naturajardin                │ Victoria        │ Cruz              │
│ Americh Golf Management SL  │ Mario           │ Suarez            │
│ Aloha                       │ Cristian        │ Rodrigez          │
│ El Prat                     │ Francisco       │ Camacho           │
│ Vivero Humanes              │ Federico        │ Gomez             │
│ Fuenla City                 │ Tony            │ Muñoz Mena        │
│ Top Campo                   │ Joseluis        │ Sanchez           │
│ Campohermoso                │ Luis            │ Jimenez           │
│ france telecom              │ FraÃ§ois        │ Toulou            │
│ Musée du Louvre             │ Pierre          │ Delacroux         │
│ The Magic Garden            │ Richard         │ Mcain             │
└─────────────────────────────┴─────────────────┴───────────────────┘ */

---Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
sqlite> SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto from cliente as c LEFT JOIN pedido as p on c.codigo_cliente=p.codigo_cliente where p.codigo_cliente is null UNION SELECT c.nombre_cliente, c.nombre_contacto, c.apellido_contacto from cliente as c LEFT JOIN pago as p on p.codigo_cliente=c.codigo_cliente where p.codigo_cliente is null;
/* ┌─────────────────────────────┬─────────────────┬───────────────────┐
│       nombre_cliente        │ nombre_contacto │ apellido_contacto │
├─────────────────────────────┼─────────────────┼───────────────────┤
│ Aloha                       │ Cristian        │ Rodrigez          │
│ Americh Golf Management SL  │ Mario           │ Suarez            │
│ Campohermoso                │ Luis            │ Jimenez           │
│ Club Golf Puerta del hierro │ Paco            │ L┌─────────────────┬──────────┬─────────┐
│     nombre      │  nombre  │ nombre  │
├─────────────────┼──────────┼─────────┤
│ Alberto         │ Ruben    │ Marcos  │
│ Maria           │ Ruben    │ Marcos  │
│ Felipe          │ Alberto  │ Ruben   │
│ Juan Carlos     │ Alberto  │ Ruben   │
│ Carlos          │ Alberto  │ Ruben   │
│ Mariano         │ Carlos   │ Alberto │
│ Lucio           │ Carlos   │ Alberto │
│ Hilario         │ Carlos   │ Alberto │
│ Emmanuel        │ Alberto  │ Ruben   │
│ José Manuel     │ Emmanuel │ Alberto │
│ David           │ Emmanuel │ Alberto │
│ Oscar           │ Emmanuel │ Alberto │
│ Francois        │ Alberto  │ Ruben   │
│ Lionel          │ Francois │ Alberto │
│ Laurent         │ Francois │ Alberto │
│ Michael         │ Alberto  │ Ruben   │
│ Walter Santiago │ Michael  │ Alberto │
│ Hilary          │ Alberto  │ Ruben   │
│ Marcus          │ Hilary   │ Alberto │
│ Lorena          │ Hilary   │ Alberto │
│ Nei             │ Alberto  │ Ruben   │
│ Narumi          │ Nei      │ Alberto │
│ Takuma          │ Nei      │ Alberto │
│ Amy             │ Alberto  │ Ruben   │
│ Larry           │ Amy      │ Alberto │
│ John            │ Amy      │ Alberto │
│ Kevin           │ Alberto  │ Ruben   │
│ Julian          │ Kevin    │ Alberto │
│ Mariko          │ Kevin    │ Alberto │
└─────────────────┴──────────┴─────────┘opez             │
│ DaraDistribuciones          │ David           │ Serrano           │
│ El Prat                     │ Francisco       │ Camacho           │
│ Flores S.L.                 │ Antonio         │ Romero            │
│ Flowers, S.A                │ Beatriz         │ Fernandez         │
│ Fuenla City                 │ Tony            │ Muñoz Mena        │
│ Lasas S.A.                  │ Antonio         │ Lasas             │
│ Madrileña de riegos         │ Jose            │ Tacaño            │
│ Musée du Louvre             │ Pierre          │ Delacroux         │
│ Naturajardin                │ Victoria        │ Cruz              │
│ The Magic Garden            │ Richard         │ Mcain             │
│ Top Campo                   │ Joseluis        │ Sanchez           │
│ Vivero Humanes              │ Federico        │ Gomez             │
│ france telecom              │ FraÃ§ois        │ Toulou            │
└─────────────────────────────┴─────────────────┴───────────────────┘ */

---Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
sqlite> SELECT e.codigo_oficina, e.codigo_empleado, e.apellido1, e.apellido2 from empleado as e LEFT JOIN oficina as o on e.codigo_oficina=o.codigo_oficina where e.codigo_oficina is null;

---Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
sqlite> SELECT c.codigo_cliente, c.nombre_cliente, e.codigo_empleado, e.nombre from cliente as c LEFT JOIN empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado where c.codigo_empleado_rep_ventas is null;

---Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
sqlite> SELECT e.nombre, o.* from cliente as c LEFT JOIN empleado as e JOIN oficina as o on e.codigo_empleado=c.codigo_empleado_rep_ventas and o.codigo_oficina=e.codigo_oficina where c.codigo_empleado_rep_ventas is null;

---Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
sqlite> SELECT e.codigo_oficina, e.codigo_empleado, e.apellido1, e.apellido2 from empleado as e LEFT JOIN oficina as o on e.codigo_oficina=o.codigo_oficina where e.codigo_oficina is null UNION sqlite> SELECT c.codigo_cliente, c.nombre_cliente, e.codigo_empleado, e.nombre from cliente as c LEFT JOIN empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado where c.codigo_empleado_rep_ventas is null;

---Devuelve un listado de los productos que nunca han aparecido en un pedido.
sqlite> SELECT DISTINCT p.nombre from producto as p LEFT JOIN detalle_pedido as d on p.codigo_producto = d.codigo_producto where d.codigo_producto is null;
/* ┌─────────────────────────────────────────────────────────────┐
│                           nombre                            │
├─────────────────────────────────────────────────────────────┤
│ Olea-Olivos                                                 │
│ Calamondin Mini                                             │
│ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
│ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
│ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
│ Albaricoquero Corbato                                       │
│ Albaricoquero Moniqui                                       │
│ Albaricoquero Kurrot                                        │
│ Cerezo Burlat                                               │
│ Cerezo Picota                                               │
│ Ciruelo R. Claudia Verde                                    │
│ Ciruelo Golden Japan                                        │
│ Ciruelo Claudia Negra                                       │
│ Higuera Verdal                                              │
│ Higuera Breva                                               │
│ Melocotonero Spring Crest                                   │
│ Melocotonero Federica                                       │
│ Parra Uva de Mesa                                           │
│ Mandarino -Plantón joven                                    │
│ Peral Castell                                               │
│ Peral Williams                                              │
│ Peral Conference                                            │
│ Olivo Cipresino                                             │
│ Albaricoquero                                               │
│ Cerezo                                                      │
│ Ciruelo                                                     │
│ Granado                                                     │
│ Higuera                                                     │
│ Manzano                                                     │
│ Melocotonero                                                │
│ Membrillero                                                 │
│ Arbustos Mix Maceta                                         │
│ Mimosa Injerto CLASICA Dealbata                             │
│ Mimosa Semilla Bayleyana                                    │
│ Mimosa Semilla Espectabilis                                 │
│ Mimosa Semilla Longifolia                                   │
│ Mimosa Semilla Floribunda 4 estaciones                      │
│ Abelia Floribunda                                           │
│ Callistemom (Mix)                                           │
│ Corylus Avellana \"Contorta\"                               │
│ Escallonia (Mix)                                            │
│ Evonimus Emerald Gayeti                                     │
│ Evonimus Pulchellus                                         │
│ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │
│ Hibiscus Syriacus \"Pink Giant\" Rosa                       │
│ Lonicera Nitida \"Maigrum\"                                 │
│ Prunus pisardii                                             │
│ Weigelia \"Bristol Ruby\"                                   │
│ Leptospermum formado PIRAMIDE                               │
│ Leptospermum COPA                                           │
│ Nerium oleander-CALIDAD \"GARDEN\"                          │
│ Nerium Oleander Arbusto GRANDE                              │
│ Nerium oleander COPA  Calibre 6/8                           │
│ ROSAL TREPADOR                                              │
│ Solanum Jazminoide                                          │
│ Wisteria Sinensis  azul, rosa, blanca                       │
│ Wisteria Sinensis INJERTADAS DECÃ“                          │
│ Bougamvillea Sanderiana Tutor                               │
│ Bougamvillea Sanderiana Espaldera                           │
│ Bougamvillea Sanderiana, 3 tut. piramide                    │
│ Expositor Árboles clima mediterráneo                        │
│ Expositor Árboles borde del mar                             │
│ Brachychiton Acerifolius                                    │
│ Cassia Corimbosa                                            │
│ Cassia Corimbosa                                            │
│ Chitalpa Summer Bells                                       │
│ Erytrina Kafra                                              │
│ Eucalyptus Citriodora                                       │
│ Eucalyptus Ficifolia                                        │
│ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │
│ Lagunaria Patersonii                                        │
│ Lagunaria Patersonii                                        │
│ Morus Alba                                                  │
│ Platanus Acerifolia                                         │
│ Salix Babylonica  Pendula                                   │
│ Tamarix  Ramosissima Pink Cascade                           │
│ Tecoma Stands                                               │
│ Tecoma Stands                                               │
│ Tipuana Tipu                                                │
│ Pleioblastus distichus-Bambú enano                          │
│ Sasa palmata                                                │
│ Phylostachys aurea                                          │
│ Phylostachys Bambusa Spectabilis                            │
│ Phylostachys biseti                                         │
│ Pseudosasa japonica (Metake)                                │
│ Pseudosasa japonica (Metake)                                │
│ Cedrus Deodara \"Feeling Blue\" Novedad                     │
│ Juniperus chinensis \"Blue Alps\"                           │
│ Juniperus Chinensis Stricta                                 │
│ Juniperus squamata \"Blue Star\"                            │
│ Juniperus x media Phitzeriana verde                         │
│ Bismarckia Nobilis                                          │
│ Brahea Armata                                               │
│ Brahea Edulis                                               │
│ Butia Capitata                                              │
│ Chamaerops Humilis                                          │
│ Chamaerops Humilis \"Cerifera\"                             │
│ Chrysalidocarpus Lutescens -ARECA                           │
│ Cordyline Australis -DRACAENA                               │
│ Cycas Revoluta                                              │
│ Dracaena Drago                                              │
│ Livistonia Decipiens                                        │
│ Rhaphis Excelsa                                             │
│ Sabal Minor                                                 │
│ Trachycarpus Fortunei                                       │
│ Washingtonia Robusta                                        │
│ Zamia Furfuracaea                                           │
└─────────────────────────────────────────────────────────────┘ */
---Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
sqlite> SELECT p.nombre, p.descripcion  from producto as p LEFT JOIN detalle_pedido as d on p.codigo_producto = d.codigo_producto where d.codigo_producto is null;

---Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

---Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
sqlite> SELECT c.nombre_cliente from cliente as c LEFT JOIN pago as p JOIN pedido as pe on c.codigo_cliente=p.codigo_cliente and c.codigo_cliente = pe.codigo_cliente where p.codigo_cliente is null;

---Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
/* ┌──────────┬─────────────┐
│  nombre  │   nombre    │
├──────────┼─────────────┤
│ Marcos   │ Ruben       │
│ Ruben    │ Alberto     │
│ Ruben    │ Maria       │
│ Alberto  │ Felipe      │
│ Alberto  │ Juan Carlos │
│ Alberto  │ Carlos      │
│ Carlos   │ Mariano     │
│ Carlos   │ Lucio       │
│ Carlos   │ Hilario     │
│ Alberto  │ Emmanuel    │
│ Alberto  │ Francois    │
│ Francois │ Lionel      │
│ Francois │ Laurent     │
│ Alberto  │ Michael     │
│ Alberto  │ Hilary      │
│ Hilary   │ Marcus      │
│ Hilary   │ Lorena      │
│ Alberto  │ Nei         │
│ Nei      │ Narumi      │
│ Nei      │ Takuma      │ 
│ Alberto  │ Amy         │
│ Amy      │ Larry       │
│ Amy      │ John        │
│ Alberto  │ Kevin       │
│ Kevin    │ Julian      │
│ Kevin    │ Mariko      │
└──────────┴─────────────┘ */



---Consultas resumen

---¿Cuántos empleados hay en la compañía?
sqlite> SELECT count(*) from empleado;
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 31       │
└──────────┘ */

---¿Cuántos clientes tiene cada país?
sqlite> SELECT pais, count(*) as personas from cliente GROUP by pais;
/* ┌────────────────┬──────────┐
│      pais      │ personas │
├────────────────┼──────────┤
│ Australia      │ 2        │
│ France         │ 2        │
│ Spain          │ 27       │
│ USA            │ 4        │
│ United Kingdom │ 1        │
└────────────────┴──────────┘ */

---¿Cuál fue el pago medio en 2009?
sqlite> SELECT avg(total) from pago where fecha_pago REGEXP "^2009";
/* ┌──────────────────┐
│    avg(total)    │
├──────────────────┤
│ 4504.07692307692 │
└──────────────────┘ */

---¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
sqlite> SELECT count(*) as pedido, estado from pedido GROUP by estado ORDER BY pedido desc;
/* ┌────────┬───────────┐
│ pedido │  estado   │
├────────┼───────────┤
│ 61     │ Entregado │
│ 30     │ Pendiente │
│ 24     │ Rechazado │
└────────┴───────────┘ */

---Calcula el precio de venta del producto más caro y más barato en una misma consulta.
sqlite> SELECT nombre, max(precio_venta) from producto UNION SELECT nombre, min(precio_venta) from producto;
/* ┌───────────────────────┬───────────────────┐
│        nombre         │ max(precio_venta) │
├───────────────────────┼───────────────────┤
│ Ajedrea               │ 1.0               │
│ Trachycarpus Fortunei │ 462.0             │
└───────────────────────┴───────────────────┘ */

---Calcula el número de clientes que tiene la empresa.
sqlite> SELECT count(*) from cliente;
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 36       │
└──────────┘ */

---¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
sqlite> SELECT count(*), ciudad from cliente where ciudad="Madrid";
/* ┌──────────┬────────┐
│ count(*) │ ciudad │
├──────────┼────────┤
│ 11       │ Madrid │
└──────────┴────────┘ */

---¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
sqlite> SELECT count(*), ciudad from cliente where ciudad REGEXP "^M" GROUP BY ciudad;
/* ┌──────────┬──────────────────────┐
│ count(*) │        ciudad        │
├──────────┼──────────────────────┤
│ 11       │ Madrid               │
│ 2        │ Miami                │
│ 1        │ Montornes del valles │
└──────────┴──────────────────────┘ */

---Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
sqlite> SELECT e.nombre, c.codigo_cliente from cliente as c JOIN empleado as e on e.codigo_empleado=c.codigo_empleado_rep_ventas;
/* ┌─────────────────┬────────────────┐
│     nombre      │ codigo_cliente │
├─────────────────┼────────────────┤
│ Walter Santiago │ 1              │
│ Walter Santiago │ 3              │
│ Lorena          │ 4              │
│ Lorena          │ 5              │
│ Mariano         │ 6              │
│ Emmanuel        │ 7              │
│ Emmanuel        │ 8              │
│ Emmanuel        │ 9              │
│ Emmanuel        │ 10             │
│ Emmanuel        │ 11             │
│ Mariano         │ 12             │
│ Mariano         │ 13             │
│ Mariano         │ 14             │
│ Julian          │ 15             │
│ Felipe          │ 16             │
│ Felipe          │ 17             │
│ Julian          │ 18             │
│ José Manuel     │ 19             │
│ José Manuel     │ 20             │
│ José Manuel     │ 21             │
│ José Manuel     │ 22             │
│ José Manuel     │ 23             │
│ Julian          │ 24             │
│ Felipe          │ 25             │
│ Lucio           │ 26             │
│ Lucio           │ 27             │
│ Julian          │ 28             │
│ Felipe          │ 29             │
│ Felipe          │ 30             │
│ Julian          │ 31             │
│ Lionel          │ 32             │
│ Lionel          │ 33             │
│ Mariko          │ 35             │
│ Michael         │ 36             │
│ Michael         │ 37             │
│ Mariko          │ 38             │
└─────────────────┴────────────────┘ */

---Calcula el número de clientes que no tiene asignado representante de ventas.
sqlite> SELECT count(*) from cliente as c JOIN empleado as e on e.codigo_empleado=c.codigo_empleado_rep_ventas where c.codigo_empleado_rep_ventas is null;
/* ┌──────────┐
│ count(*) │
├──────────┤
│ 0        │
└──────────┘ */

---Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
sqlite> SELECT max(p.fecha_pago), min(p.fecha_pago), c.nombre_cliente from cliente as c JOIN pago as p GROUP by c.nombre_cliente;
/* ┌───────────────────┬───────────────────┬────────────────────────────────┐
│ max(p.fecha_pago) │ min(p.fecha_pago) │         nombre_cliente         │
├───────────────────┼───────────────────┼────────────────────────────────┤
│ 2009-03-26        │ 2006-01-18        │ Agrojardin                     │
│ 2009-03-26        │ 2006-01-18        │ Aloha                          │
│ 2009-03-26        │ 2006-01-18        │ Americh Golf Management SL     │
│ 2009-03-26        │ 2006-01-18        │ Beragua                        │
│ 2009-03-26        │ 2006-01-18        │ Campohermoso                   │
│ 2009-03-26        │ 2006-01-18        │ Camunas Jardines S.L.          │
│ 2009-03-26        │ 2006-01-18        │ Club Golf Puerta del hierro    │
│ 2009-03-26        │ 2006-01-18        │ DaraDistribuciones             │
│ 2009-03-26        │ 2006-01-18        │ Dardena S.A.                   │
│ 2009-03-26        │ 2006-01-18        │ El Jardin Viviente S.L         │
│ 2009-03-26        │ 2006-01-18        │ El Prat                        │
│ 2009-03-26        │ 2006-01-18        │ Flores Marivi                  │
│ 2009-03-26        │ 2006-01-18        │ Flores S.L.                    │
│ 2009-03-26        │ 2006-01-18        │ Flowers, S.A                   │
│ 2009-03-26        │ 2006-01-18        │ Fuenla City                    │
│ 2009-03-26        │ 2006-01-18        │ Gardening Associates           │
│ 2009-03-26        │ 2006-01-18        │ Gerudo Valley                  │
│ 2009-03-26        │ 2006-01-18        │ GoldFish Garden                │
│ 2009-03-26        │ 2006-01-18        │ Golf S.A.                      │
│ 2009-03-26        │ 2006-01-18        │ Jardin de Flores               │
│ 2009-03-26        │ 2006-01-18        │ Jardineria Sara                │
│ 2009-03-26        │ 2006-01-18        │ Jardinerías Matías SL          │
│ 2009-03-26        │ 2006-01-18        │ Jardines y Mansiones Cactus SL │
│ 2009-03-26        │ 2006-01-18        │ Lasas S.A.                     │
│ 2009-03-26        │ 2006-01-18        │ Madrileña de riegos            │
│ 2009-03-26        │ 2006-01-18        │ Musée du Louvre                │
│ 2009-03-26        │ 2006-01-18        │ Naturagua                      │
│ 2009-03-26        │ 2006-01-18        │ Naturajardin                   │
│ 2009-03-26        │ 2006-01-18        │ Sotogrande                     │
│ 2009-03-26        │ 2006-01-18        │ Tendo Garden                   │
│ 2009-03-26        │ 2006-01-18        │ The Magic Garden               │
│ 2009-03-26        │ 2006-01-18        │ Top Campo                      │
│ 2009-03-26        │ 2006-01-18        │ Tutifruti S.A                  │
│ 2009-03-26        │ 2006-01-18        │ Vivero Humanes                 │
│ 2009-03-26        │ 2006-01-18        │ france telecom                 │
└───────────────────┴───────────────────┴────────────────────────────────┘ */

---Calcula el número de productos diferentes que hay en cada uno de los pedidos.
sqlite> SELECT codigo_pedido, count(codigo_producto) from detalle_pedido GROUP BY codigo_pedido;
/* ┌───────────────┬────────────────────────┐
│ codigo_pedido │ count(codigo_producto) │
├───────────────┼────────────────────────┤
│ 1             │ 5                      │
│ 2             │ 7                      │
│ 3             │ 6                      │
│ 4             │ 8                      │
│ 8             │ 3                      │
│ 9             │ 4                      │
│ 10            │ 3                      │
│ 11            │ 2                      │
│ 12            │ 1                      │
│ 13            │ 3                      │
│ 14            │ 2                      │
│ 15            │ 4                      │
│ 16            │ 2                      │
│ 17            │ 5                      │
│ 18            │ 3                      │
│ 19            │ 5                      │
│ 20            │ 2                      │
│ 21            │ 3                      │
│ 22            │ 1                      │
│ 23            │ 4                      │
│ 24            │ 4                      │
│ 25            │ 3                      │
│ 26            │ 3                      │
│ 27            │ 3                      │
│ 28            │ 3                      │
│ 29            │ 5                      │
│ 30            │ 6                      │
│ 31            │ 3                      │
│ 32            │ 5                      │
│ 33            │ 4                      │
│ 34            │ 4                      │
│ 35            │ 5                      │
│ 36            │ 5                      │
│ 37            │ 3                      │
│ 38            │ 2                      │
│ 39            │ 2                      │
│ 40            │ 2                      │
│ 41            │ 2                      │
│ 42            │ 2                      │
│ 43            │ 1                      │
│ 44            │ 1                      │
│ 45            │ 2                      │
│ 46            │ 2                      │
│ 47            │ 2                      │
│ 48            │ 5                      │
│ 49            │ 3                      │
│ 50            │ 3                      │
│ 51            │ 3                      │
│ 52            │ 1                      │
│ 53            │ 4                      │
│ 54            │ 7                      │
│ 55            │ 5                      │
│ 56            │ 6                      │
│ 57            │ 4                      │
│ 58            │ 4                      │
│ 59            │ 1                      │
│ 60            │ 1                      │
│ 61            │ 1                      │
│ 62            │ 1                      │
│ 63            │ 1                      │
│ 64            │ 1                      │
│ 65            │ 1                      │
│ 66            │ 1                      │
│ 67            │ 1                      │
│ 68            │ 1                      │
│ 74            │ 3                      │
│ 75            │ 3                      │
│ 76            │ 5                      │
│ 77            │ 2                      │
│ 78            │ 4                      │
│ 79            │ 1                      │
│ 80            │ 3                      │
│ 81            │ 1                      │
│ 82            │ 1                      │
│ 83            │ 1                      │
│ 89            │ 6                      │
│ 90            │ 3                      │
│ 91            │ 3                      │
│ 92            │ 3                      │
│ 93            │ 3                      │
│ 94            │ 3                      │
│ 95            │ 3                      │
│ 96            │ 4                      │
│ 97            │ 3                      │
│ 98            │ 5                      │
│ 99            │ 2                      │
│ 100           │ 2                      │
│ 101           │ 2                      │
│ 102           │ 2                      │
│ 103           │ 2                      │
│ 104           │ 2                      │
│ 105           │ 2                      │
│ 106           │ 2                      │
│ 107           │ 2                      │
│ 108           │ 2                      │
│ 109           │ 7                      │
│ 110           │ 3                      │
│ 111           │ 1                      │
│ 112           │ 1                      │
│ 113           │ 1                      │
│ 114           │ 1                      │
│ 115           │ 1                      │
│ 116           │ 5                      │
│ 117           │ 4                      │
│ 118           │ 1                      │
│ 119           │ 1                      │
│ 120           │ 1                      │
│ 121           │ 1                      │
│ 122           │ 1                      │
│ 123           │ 1                      │
│ 124           │ 1                      │
│ 125           │ 1                      │
│ 126           │ 1                      │
│ 127           │ 1                      │
│ 128           │ 2                      │
└───────────────┴────────────────────────┘ */

---Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
sqlite> SELECT codigo_pedido, sum(cantidad) from detalle_pedido GROUP BY codigo_pedido;
/* ┌───────────────┬───────────────┐
│ codigo_pedido │ sum(cantidad) │
├───────────────┼───────────────┤
│ 1             │ 113           │
│ 2             │ 164           │
│ 3             │ 232           │
│ 4             │ 179           │
│ 8             │ 14            │
│ 9             │ 625           │
│ 10            │ 40            │
│ 11            │ 260           │
│ 12            │ 290           │
│ 13            │ 22            │
│ 14            │ 21            │
│ 15            │ 21            │
│ 16            │ 22            │
│ 17            │ 25            │
│ 18            │ 16            │
│ 19            │ 41            │
│ 20            │ 22            │
│ 21            │ 30            │
│ 22            │ 1             │
│ 23            │ 194           │
│ 24            │ 19            │
│ 25            │ 29            │
│ 26            │ 27            │
│ 27            │ 84            │
│ 28            │ 12            │
│ 29            │ 40            │
│ 30            │ 33            │
│ 31            │ 32            │
│ 32            │ 40            │
│ 33            │ 905           │
│ 34            │ 112           │
│ 35            │ 178           │
│ 36            │ 28            │
│ 37            │ 245           │
│ 38            │ 7             │
│ 39            │ 9             │
│ 40            │ 12            │
│ 41            │ 10            │
│ 42            │ 4             │
│ 43            │ 9             │
│ 44            │ 5             │
│ 45            │ 10            │
│ 46            │ 12            │
│ 47            │ 14            │
│ 48            │ 147           │
│ 49            │ 65            │
│ 50            │ 71            │
│ 51            │ 200           │
│ 52            │ 10            │
│ 53            │ 10            │
│ 54            │ 69            │
│ 55            │ 20            │
│ 56            │ 22            │
│ 57            │ 17            │
│ 58            │ 364           │
│ 59            │ 10            │
│ 60            │ 10            │
│ 61            │ 10            │
│ 62            │ 10            │
│ 63            │ 10            │
│ 64            │ 10            │
│ 65            │ 10            │
│ 66            │ 10            │
│ 67            │ 10            │
│ 68            │ 10            │
│ 74            │ 91            │
│ 75            │ 130           │
│ 76            │ 374           │
│ 77            │ 49            │
│ 78            │ 153           │
│ 79            │ 50            │
│ 80            │ 162           │
│ 81            │ 30            │
│ 82            │ 34            │
│ 83            │ 30            │
│ 89            │ 47            │
│ 90            │ 41            │
│ 91            │ 101           │
│ 92            │ 62            │
│ 93            │ 79            │
│ 94            │ 124           │
│ 95            │ 20            │
│ 96            │ 36            │
│ 97            │ 36            │
│ 98            │ 62            │
│ 99            │ 45            │
│ 100           │ 60            │
│ 101           │ 209           │
│ 102           │ 55            │
│ 103           │ 64            │
│ 104           │ 122           │
│ 105           │ 48            │
│ 106           │ 278           │
│ 107           │ 158           │
│ 108           │ 112           │
│ 109           │ 69            │
│ 110           │ 21            │
│ 111           │ 10            │
│ 112           │ 10            │
│ 113           │ 10            │
│ 114           │ 10            │
│ 115           │ 10            │
│ 116           │ 78            │
│ 117           │ 24            │
│ 118           │ 10            │
│ 119           │ 10            │
│ 120           │ 10            │
│ 121           │ 10            │
│ 122           │ 10            │
│ 123           │ 10            │
│ 124           │ 10            │
│ 125           │ 10            │
│ 126           │ 10            │
│ 127           │ 10            │
│ 128           │ 33            │
└───────────────┴───────────────┘ */

---Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
sqlite> SELECT codigo_producto, sum(cantidad) as total from detalle_pedido GROUP BY codigo_producto ORDER by total desc limit 20;
/* ┌─────────────────┬───────┐
│ codigo_producto │ total │
├─────────────────┼───────┤
│ AR-009          │ 961   │
│ AR-008          │ 455   │
│ FR-17           │ 423   │
│ AR-006          │ 291   │
│ FR-67           │ 285   │
│ OR-247          │ 279   │
│ OR-157          │ 262   │
│ OR-227          │ 236   │
│ OR-208          │ 221   │
│ 30310           │ 220   │
│ OR-214          │ 212   │
│ FR-57           │ 203   │
│ OR-177          │ 150   │
│ AR-001          │ 135   │
│ FR-11           │ 131   │
│ AR-002          │ 128   │
│ OR-136          │ 127   │
│ FR-48           │ 120   │
│ FR-29           │ 120   │
│ FR-100          │ 114   │
└─────────────────┴───────┘ */

---La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
sqlite> SELECT d.codigo_producto, sum(d.cantidad) as total, p.precio_venta * sum(d.cantidad) as base_imponible, (p.precio_venta * sum(cantidad)) * 0.21 as IVA, (p.precio_venta * sum(d.cantidad)) + ((p.precio_venta * sum(cantidad)) * 0.21)as facturacion_total from detalle_pedido as d JOIN producto as p GROUP BY d.codigo_producto ORDER by total desc;
/* ┌─────────────────┬────────┬────────────────┬───────────┬───────────────────┐
│ codigo_producto │ total  │ base_imponible │    IVA    │ facturacion_total │
├─────────────────┼────────┼────────────────┼───────────┼───────────────────┤
│ AR-009          │ 265236 │ 3713304.0      │ 779793.84 │ 4493097.84        │
│ AR-008          │ 125580 │ 1758120.0      │ 369205.2  │ 2127325.2         │
│ FR-17           │ 116748 │ 1634472.0      │ 343239.12 │ 1977711.12        │
│ AR-006          │ 80316  │ 1124424.0      │ 236129.04 │ 1360553.04        │
│ FR-67           │ 78660  │ 1101240.0      │ 231260.4  │ 1332500.4         │
│ OR-247          │ 77004  │ 1078056.0      │ 226391.76 │ 1304447.76        │
│ OR-157          │ 72312  │ 1012368.0      │ 212597.28 │ 1224965.28        │
│ OR-227          │ 65136  │ 911904.0       │ 191499.84 │ 1103403.84        │
│ OR-208          │ 60996  │ 853944.0       │ 179328.24 │ 1033272.24        │
│ 30310           │ 60720  │ 850080.0       │ 178516.8  │ 1028596.8         │
│ OR-214          │ 58512  │ 819168.0       │ 172025.28 │ 991193.28         │
│ FR-57           │ 56028  │ 784392.0       │ 164722.32 │ 949114.32         │
│ OR-177          │ 41400  │ 579600.0       │ 121716.0  │ 701316.0          │
│ AR-001          │ 37260  │ 521640.0       │ 109544.4  │ 631184.4          │
│ FR-11           │ 36156  │ 506184.0       │ 106298.64 │ 612482.64         │
│ AR-002          │ 35328  │ 494592.0       │ 103864.32 │ 598456.32         │
│ OR-136          │ 35052  │ 490728.0       │ 103052.88 │ 593780.88         │
│ FR-48           │ 33120  │ 463680.0       │ 97372.8   │ 561052.8          │
│ FR-29           │ 33120  │ 463680.0       │ 97372.8   │ 561052.8          │
│ FR-100          │ 31464  │ 440496.0       │ 92504.16  │ 533000.16         │
│ FR-94           │ 30636  │ 428904.0       │ 90069.84  │ 518973.84         │
│ FR-53           │ 25668  │ 359352.0       │ 75463.92  │ 434815.92         │
│ OR-172          │ 24564  │ 343896.0       │ 72218.16  │ 416114.16         │
│ FR-4            │ 24288  │ 340032.0       │ 71406.72  │ 411438.72         │
│ OR-102          │ 24012  │ 336168.0       │ 70595.28  │ 406763.28         │
│ OR-225          │ 23184  │ 324576.0       │ 68160.96  │ 392736.96         │
│ FR-106          │ 22908  │ 320712.0       │ 67349.52  │ 388061.52         │
│ 22225           │ 22632  │ 316848.0       │ 66538.08  │ 383386.08         │
│ OR-210          │ 22080  │ 309120.0       │ 64915.2   │ 374035.2          │
│ OR-139          │ 22080  │ 309120.0       │ 64915.2   │ 374035.2          │
│ OR-240          │ 21528  │ 301392.0       │ 63292.32  │ 364684.32         │
│ FR-85           │ 20976  │ 293664.0       │ 61669.44  │ 355333.44         │
│ FR-87           │ 19872  │ 278208.0       │ 58423.68  │ 336631.68         │
│ FR-3            │ 19596  │ 274344.0       │ 57612.24  │ 331956.24         │
│ OR-211          │ 19320  │ 270480.0       │ 56800.8   │ 327280.8          │
│ FR-36           │ 19044  │ 266616.0       │ 55989.36  │ 322605.36         │
│ OR-234          │ 15180  │ 212520.0       │ 44629.2   │ 257149.2          │
│ FR-47           │ 15180  │ 212520.0       │ 44629.2   │ 257149.2          │
│ FR-58           │ 14076  │ 197064.0       │ 41383.44  │ 238447.44         │
│ OR-237          │ 13800  │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-209          │ 13800  │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-204          │ 13800  │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-140          │ 13800  │ 193200.0       │ 40572.0   │ 233772.0          │
│ FR-107          │ 13800  │ 193200.0       │ 40572.0   │ 233772.0          │
│ FR-40           │ 13524  │ 189336.0       │ 39760.56  │ 229096.56         │
│ OR-236          │ 12420  │ 173880.0       │ 36514.8   │ 210394.8          │
│ OR-141          │ 12420  │ 173880.0       │ 36514.8   │ 210394.8          │
│ 11679           │ 12420  │ 173880.0       │ 36514.8   │ 210394.8          │
│ FR-79           │ 11868  │ 166152.0       │ 34891.92  │ 201043.92         │
│ FR-34           │ 11592  │ 162288.0       │ 34080.48  │ 196368.48         │
│ OR-186          │ 11040  │ 154560.0       │ 32457.6   │ 187017.6          │
│ OR-127          │ 11040  │ 154560.0       │ 32457.6   │ 187017.6          │
│ 21636           │ 11040  │ 154560.0       │ 32457.6   │ 187017.6          │
│ FR-54           │ 10764  │ 150696.0       │ 31646.16  │ 182342.16         │
│ OR-99           │ 10488  │ 146832.0       │ 30834.72  │ 177666.72         │
│ OR-218          │ 10488  │ 146832.0       │ 30834.72  │ 177666.72         │
│ OR-176          │ 10488  │ 146832.0       │ 30834.72  │ 177666.72         │
│ FR-102          │ 10212  │ 142968.0       │ 30023.28  │ 172991.28         │
│ OR-181          │ 9936   │ 139104.0       │ 29211.84  │ 168315.84         │
│ OR-213          │ 9660   │ 135240.0       │ 28400.4   │ 163640.4          │
│ OR-156          │ 9108   │ 127512.0       │ 26777.52  │ 154289.52         │
│ OR-122          │ 8832   │ 123648.0       │ 25966.08  │ 149614.08         │
│ FR-12           │ 8832   │ 123648.0       │ 25966.08  │ 149614.08         │
│ OR-249          │ 8280   │ 115920.0       │ 24343.2   │ 140263.2          │
│ FR-91           │ 8280   │ 115920.0       │ 24343.2   │ 140263.2          │
│ AR-004          │ 8280   │ 115920.0       │ 24343.2   │ 140263.2          │
│ OR-128          │ 8004   │ 112056.0       │ 23531.76  │ 135587.76         │
│ OR-196          │ 7728   │ 108192.0       │ 22720.32  │ 130912.32         │
│ FR-33           │ 7452   │ 104328.0       │ 21908.88  │ 126236.88         │
│ FR-18           │ 7452   │ 104328.0       │ 21908.88  │ 126236.88         │
│ OR-241          │ 6900   │ 96600.0        │ 20286.0   │ 116886.0          │
│ OR-174          │ 6624   │ 92736.0        │ 19474.56  │ 112210.56         │
│ OR-101          │ 6624   │ 92736.0        │ 19474.56  │ 112210.56         │
│ FR-1            │ 6624   │ 92736.0        │ 19474.56  │ 112210.56         │
│ OR-159          │ 6072   │ 85008.0        │ 17851.68  │ 102859.68         │
│ OR-222          │ 5796   │ 81144.0        │ 17040.24  │ 98184.24          │
│ FR-69           │ 5796   │ 81144.0        │ 17040.24  │ 98184.24          │
│ AR-005          │ 5796   │ 81144.0        │ 17040.24  │ 98184.24          │
│ OR-104          │ 5520   │ 77280.0        │ 16228.8   │ 93508.8           │
│ FR-101          │ 5244   │ 73416.0        │ 15417.36  │ 88833.36          │
│ OR-150          │ 4968   │ 69552.0        │ 14605.92  │ 84157.92          │
│ FR-8            │ 4968   │ 69552.0        │ 14605.92  │ 84157.92          │
│ FR-108          │ 4968   │ 69552.0        │ 14605.92  │ 84157.92          │
│ OR-146          │ 4692   │ 65688.0        │ 13794.48  │ 79482.48          │
│ FR-10           │ 4692   │ 65688.0        │ 13794.48  │ 79482.48          │
│ AR-003          │ 4692   │ 65688.0        │ 13794.48  │ 79482.48          │
│ FR-6            │ 4416   │ 61824.0        │ 12983.04  │ 74807.04          │
│ FR-56           │ 4416   │ 61824.0        │ 12983.04  │ 74807.04          │
│ OR-226          │ 4140   │ 57960.0        │ 12171.6   │ 70131.6           │
│ OR-217          │ 4140   │ 57960.0        │ 12171.6   │ 70131.6           │
│ FR-77           │ 4140   │ 57960.0        │ 12171.6   │ 70131.6           │
│ OR-123          │ 3864   │ 54096.0        │ 11360.16  │ 65456.16          │
│ OR-116          │ 3864   │ 54096.0        │ 11360.16  │ 65456.16          │
│ FR-82           │ 3864   │ 54096.0        │ 11360.16  │ 65456.16          │
│ FR-45           │ 3864   │ 54096.0        │ 11360.16  │ 65456.16          │
│ FR-13           │ 3588   │ 50232.0        │ 10548.72  │ 60780.72          │
│ OR-130          │ 3312   │ 46368.0        │ 9737.28   │ 56105.28          │
│ FR-7            │ 3312   │ 46368.0        │ 9737.28   │ 56105.28          │
│ FR-42           │ 3312   │ 46368.0        │ 9737.28   │ 56105.28          │
│ FR-41           │ 3312   │ 46368.0        │ 9737.28   │ 56105.28          │
│ FR-31           │ 3312   │ 46368.0        │ 9737.28   │ 56105.28          │
│ FR-84           │ 3036   │ 42504.0        │ 8925.84   │ 51429.84          │
│ FR-60           │ 3036   │ 42504.0        │ 8925.84   │ 51429.84          │
│ OR-205          │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-203          │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-200          │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-160          │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-119          │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ FR-89           │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ FR-71           │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ FR-22           │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ AR-010          │ 2760   │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-115          │ 2484   │ 34776.0        │ 7302.96   │ 42078.96          │
│ FR-15           │ 2484   │ 34776.0        │ 7302.96   │ 42078.96          │
│ AR-007          │ 2484   │ 34776.0        │ 7302.96   │ 42078.96          │
│ FR-9            │ 2208   │ 30912.0        │ 6491.52   │ 37403.52          │
│ FR-23           │ 2208   │ 30912.0        │ 6491.52   │ 37403.52          │
│ FR-75           │ 1932   │ 27048.0        │ 5680.08   │ 32728.08          │
│ OR-147          │ 1656   │ 23184.0        │ 4868.64   │ 28052.64          │
│ FR-43           │ 1656   │ 23184.0        │ 4868.64   │ 28052.64          │
│ OR-206          │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-193          │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-179          │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-120          │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ FR-66           │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ FR-64           │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ FR-37           │ 1380   │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-207          │ 1104   │ 15456.0        │ 3245.76   │ 18701.76          │
│ OR-188          │ 1104   │ 15456.0        │ 3245.76   │ 18701.76          │
│ OR-155          │ 1104   │ 15456.0        │ 3245.76   │ 18701.76          │
│ FR-90           │ 1104   │ 15456.0        │ 3245.76   │ 18701.76          │
│ FR-72           │ 1104   │ 15456.0        │ 3245.76   │ 18701.76          │
│ FR-105          │ 1104   │ 15456.0        │ 3245.76   │ 18701.76          │
│ OR-250          │ 828    │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-165          │ 828    │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-152          │ 828    │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-129          │ 828    │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-125          │ 828    │ 11592.0        │ 2434.32   │ 14026.32          │
│ FR-81           │ 828    │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-243          │ 552    │ 7728.0         │ 1622.88   │ 9350.88           │
│ OR-168          │ 552    │ 7728.0         │ 1622.88   │ 9350.88           │
│ FR-86           │ 552    │ 7728.0         │ 1622.88   │ 9350.88           │
│ FR-78           │ 552    │ 7728.0         │ 1622.88   │ 9350.88           │
│ FR-80           │ 276    │ 3864.0         │ 811.44    │ 4675.44           │
│ FR-2            │ 276    │ 3864.0         │ 811.44    │ 4675.44           │
│ FR-16           │ 276    │ 3864.0         │ 811.44    │ 4675.44           │
│ FR-103          │ 276    │ 3864.0         │ 811.44    │ 4675.44           │
└─────────────────┴────────┴────────────────┴───────────┴───────────────────┘ */

---La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
sqlite> SELECT d.codigo_producto, sum(d.cantidad) as total, p.precio_venta * sum(d.cantidad) as base_imponible, (p.precio_venta * sum(cantidad)) * 0.21 as IVA, (p.precio_venta * sum(d.cantidad)) + ((p.precio_venta * sum(cantidad)) * 0.21)as facturacion_total from detalle_pedido as d JOIN producto as p where d.codigo_producto REGEXP "^OR" GROUP BY d.codigo_producto ORDER by total desc;
/* ┌─────────────────┬───────┬────────────────┬───────────┬───────────────────┐
│ codigo_producto │ total │ base_imponible │    IVA    │ facturacion_total │
├─────────────────┼───────┼────────────────┼───────────┼───────────────────┤
│ OR-247          │ 77004 │ 1078056.0      │ 226391.76 │ 1304447.76        │
│ OR-157          │ 72312 │ 1012368.0      │ 212597.28 │ 1224965.28        │
│ OR-227          │ 65136 │ 911904.0       │ 191499.84 │ 1103403.84        │
│ OR-208          │ 60996 │ 853944.0       │ 179328.24 │ 1033272.24        │
│ OR-214          │ 58512 │ 819168.0       │ 172025.28 │ 991193.28         │
│ OR-177          │ 41400 │ 579600.0       │ 121716.0  │ 701316.0          │
│ OR-136          │ 35052 │ 490728.0       │ 103052.88 │ 593780.88         │
│ OR-172          │ 24564 │ 343896.0       │ 72218.16  │ 416114.16         │
│ OR-102          │ 24012 │ 336168.0       │ 70595.28  │ 406763.28         │
│ OR-225          │ 23184 │ 324576.0       │ 68160.96  │ 392736.96         │
│ OR-210          │ 22080 │ 309120.0       │ 64915.2   │ 374035.2          │
│ OR-139          │ 22080 │ 309120.0       │ 64915.2   │ 374035.2          │
│ OR-240          │ 21528 │ 301392.0       │ 63292.32  │ 364684.32         │
│ OR-211          │ 19320 │ 270480.0       │ 56800.8   │ 327280.8          │
│ OR-234          │ 15180 │ 212520.0       │ 44629.2   │ 257149.2          │
│ OR-237          │ 13800 │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-209          │ 13800 │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-204          │ 13800 │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-140          │ 13800 │ 193200.0       │ 40572.0   │ 233772.0          │
│ OR-236          │ 12420 │ 173880.0       │ 36514.8   │ 210394.8          │
│ OR-141          │ 12420 │ 173880.0       │ 36514.8   │ 210394.8          │
│ OR-186          │ 11040 │ 154560.0       │ 32457.6   │ 187017.6          │
│ OR-127          │ 11040 │ 154560.0       │ 32457.6   │ 187017.6          │
│ OR-99           │ 10488 │ 146832.0       │ 30834.72  │ 177666.72         │
│ OR-218          │ 10488 │ 146832.0       │ 30834.72  │ 177666.72         │
│ OR-176          │ 10488 │ 146832.0       │ 30834.72  │ 177666.72         │
│ OR-181          │ 9936  │ 139104.0       │ 29211.84  │ 168315.84         │
│ OR-213          │ 9660  │ 135240.0       │ 28400.4   │ 163640.4          │
│ OR-156          │ 9108  │ 127512.0       │ 26777.52  │ 154289.52         │
│ OR-122          │ 8832  │ 123648.0       │ 25966.08  │ 149614.08         │
│ OR-249          │ 8280  │ 115920.0       │ 24343.2   │ 140263.2          │
│ OR-128          │ 8004  │ 112056.0       │ 23531.76  │ 135587.76         │
│ OR-196          │ 7728  │ 108192.0       │ 22720.32  │ 130912.32         │
│ OR-241          │ 6900  │ 96600.0        │ 20286.0   │ 116886.0          │
│ OR-174          │ 6624  │ 92736.0        │ 19474.56  │ 112210.56         │
│ OR-101          │ 6624  │ 92736.0        │ 19474.56  │ 112210.56         │
│ OR-159          │ 6072  │ 85008.0        │ 17851.68  │ 102859.68         │
│ OR-222          │ 5796  │ 81144.0        │ 17040.24  │ 98184.24          │
│ OR-104          │ 5520  │ 77280.0        │ 16228.8   │ 93508.8           │
│ OR-150          │ 4968  │ 69552.0        │ 14605.92  │ 84157.92          │
│ OR-146          │ 4692  │ 65688.0        │ 13794.48  │ 79482.48          │
│ OR-226          │ 4140  │ 57960.0        │ 12171.6   │ 70131.6           │
│ OR-217          │ 4140  │ 57960.0        │ 12171.6   │ 70131.6           │
│ OR-123          │ 3864  │ 54096.0        │ 11360.16  │ 65456.16          │
│ OR-116          │ 3864  │ 54096.0        │ 11360.16  │ 65456.16          │
│ OR-130          │ 3312  │ 46368.0        │ 9737.28   │ 56105.28          │
│ OR-205          │ 2760  │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-203          │ 2760  │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-200          │ 2760  │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-160          │ 2760  │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-119          │ 2760  │ 38640.0        │ 8114.4    │ 46754.4           │
│ OR-115          │ 2484  │ 34776.0        │ 7302.96   │ 42078.96          │
│ OR-147          │ 1656  │ 23184.0        │ 4868.64   │ 28052.64          │
│ OR-206          │ 1380  │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-193          │ 1380  │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-179          │ 1380  │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-120          │ 1380  │ 19320.0        │ 4057.2    │ 23377.2           │
│ OR-207          │ 1104  │ 15456.0        │ 3245.76   │ 18701.76          │
│ OR-188          │ 1104  │ 15456.0        │ 3245.76   │ 18701.76          │
│ OR-155          │ 1104  │ 15456.0        │ 3245.76   │ 18701.76          │
│ OR-250          │ 828   │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-165          │ 828   │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-152          │ 828   │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-129          │ 828   │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-125          │ 828   │ 11592.0        │ 2434.32   │ 14026.32          │
│ OR-243          │ 552   │ 7728.0         │ 1622.88   │ 9350.88           │
│ OR-168          │ 552   │ 7728.0         │ 1622.88   │ 9350.88           │
└─────────────────┴───────┴────────────────┴───────────┴───────────────────┘ */

---Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

---Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
sqlite> SELECT substr(fecha_pago,1,4) as año, sum(total) from pago GROUP by año;
/* ┌──────┬────────────┐
│ año  │ sum(total) │
├──────┼────────────┤
│ 2006 │ 24965.0    │
│ 2007 │ 85170.0    │
│ 2008 │ 29252.0    │
│ 2009 │ 58553.0    │
└──────┴────────────┘ */



---SUBCONSULTAS COMPARADORES BÁSICOS

---Devuelve el nombre del cliente con mayor límite de crédito.
sqlite> SELECT nombre_cliente from cliente where limite_credito = (SELECT max(limite_credito) from cliente);
/* ┌────────────────┐
│ nombre_cliente │
├────────────────┤
│ Tendo Garden   │
└────────────────┘ */

---Devuelve el nombre del producto que tenga el precio de venta más caro.
sqlite> SELECT nombre from producto where precio_venta = (SELECT max(precio_venta) from producto);
/* ┌───────────────────────┐
│        nombre         │
├───────────────────────┤
│ Trachycarpus Fortunei │
└───────────────────────┘ */

---Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
sqlite> SELECT nombre from producto WHERE codigo_producto = (SELECT codigo_producto from detalle_pedido where cantidad = (SELECT max(cantidad) from detalle_pedido));
/* ┌──────────────────────────────────┐
│              nombre              │
├──────────────────────────────────┤
│ Thymus Citriodra (Tomillo limón) │
└──────────────────────────────────┘ */

---Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
sqlite> SELECT nombre_cliente, limite_credito from cliente where limite_credito > (SELECT total from pago GROUP BY codigo_cliente);
/* ┌────────────────────────────────┬────────────────┐
│         nombre_cliente         │ limite_credito │
├────────────────────────────────┼────────────────┤
│ GoldFish Garden                │ 3000.0         │
│ Gardening Associates           │ 6000.0         │
│ Gerudo Valley                  │ 12000.0        │
│ Tendo Garden                   │ 600000.0       │
│ Lasas S.A.                     │ 154310.0       │
│ Beragua                        │ 20000.0        │
│ Club Golf Puerta del hierro    │ 40000.0        │
│ Naturagua                      │ 32000.0        │
│ DaraDistribuciones             │ 50000.0        │
│ Madrileña de riegos            │ 20000.0        │
│ Lasas S.A.                     │ 154310.0       │
│ Camunas Jardines S.L.          │ 16481.0        │
│ Dardena S.A.                   │ 321000.0       │
│ Jardin de Flores               │ 40000.0        │
│ Flowers, S.A                   │ 3500.0         │
│ Naturajardin                   │ 5050.0         │
│ Golf S.A.                      │ 30000.0        │
│ Americh Golf Management SL     │ 20000.0        │
│ Aloha                          │ 50000.0        │
│ El Prat                        │ 30000.0        │
│ Sotogrande                     │ 60000.0        │
│ Vivero Humanes                 │ 7430.0         │
│ Fuenla City                    │ 4500.0         │
│ Jardines y Mansiones Cactus SL │ 76000.0        │
│ Jardinerías Matías SL          │ 100500.0       │
│ Agrojardin                     │ 8040.0         │
│ Top Campo                      │ 5500.0         │
│ Jardineria Sara                │ 7500.0         │
│ Campohermoso                   │ 3250.0         │
│ france telecom                 │ 10000.0        │
│ Musée du Louvre                │ 30000.0        │
│ Tutifruti S.A                  │ 10000.0        │
│ Flores S.L.                    │ 6000.0         │
│ The Magic Garden               │ 10000.0        │
│ El Jardin Viviente S.L         │ 8000.0         │
└────────────────────────────────┴────────────────┘ */

---Devuelve el producto que más unidades tiene en stock.
sqlite> SELECT nombre, cantidad_en_stock FROM producto where cantidad_en_stock = (SELECT max(cantidad_en_stock) from producto) limit 1;
/* ┌─────────────┬───────────────────┐
│   nombre    │ cantidad_en_stock │
├─────────────┼───────────────────┤
│ Rosal copa  │ 400               │
└─────────────┴───────────────────┘ */

---Devuelve el producto que menos unidades tiene en stock.
sqlite> SELECT nombre, cantidad_en_stock FROM producto where cantidad_en_stock = (SELECT min(cantidad_en_stock) from producto) limit 1;
/* ┌───────────────┬───────────────────┐
│    nombre     │ cantidad_en_stock │
├───────────────┼───────────────────┤
│ Brahea Armata │ 0                 │
└───────────────┴───────────────────┘ */

---Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
sqlite> SELECT nombre, apellido1, apellido2, email from empleado where codigo_jefe = (SELECT codigo_empleado from empleado where nombre="Alberto" and apellido1="Soria");
/* ┌─────────────┬────────────┬───────────┬───────────────────────────┐
│   nombre    │ apellido1  │ apellido2 │           email           │
├─────────────┼────────────┼───────────┼───────────────────────────┤
│ Felipe      │ Rosas      │ Marquez   │ frosas@jardineria.es      │
│ Juan Carlos │ Ortiz      │ Serrano   │ cortiz@jardineria.es      │
│ Carlos      │ Soria      │ Jimenez   │ csoria@jardineria.es      │
│ Emmanuel    │ Magaña     │ Perez     │ manu@jardineria.es        │
│ Francois    │ Fignon     │           │ ffignon@gardening.com     │
│ Michael     │ Bolton     │           │ mbolton@gardening.com     │
│ Hilary      │ Washington │           │ hwashington@gardening.com │
│ Nei         │ Nishikori  │           │ nnishikori@gardening.com  │
│ Amy         │ Johnson    │           │ ajohnson@gardening.com    │
│ Kevin       │ Fallmer    │           │ kfalmer@gardening.com     │
└─────────────┴────────────┴───────────┴───────────────────────────┘ */



---SUBCONSULTAS CON IN/NOT IN

---Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
sqlite> SELECT nombre, apellido1, puesto from empleado where codigo_empleado not in (SELECT codigo_empleado_rep_ventas from cliente);
/* ┌─────────────┬────────────┬───────────────────────┐
│   nombre    │ apellido1  │        puesto         │
├─────────────┼────────────┼───────────────────────┤
│ Marcos      │ Magaña     │ Director General      │
│ Ruben       │ López      │ Subdirector Marketing │
│ Alberto     │ Soria      │ Subdirector Ventas    │
│ Maria       │ Solís      │ Secretaria            │
│ Juan Carlos │ Ortiz      │ Representante Ventas  │
│ Carlos      │ Soria      │ Director Oficina      │
│ Hilario     │ Rodriguez  │ Representante Ventas  │
│ David       │ Palma      │ Representante Ventas  │
│ Oscar       │ Palma      │ Representante Ventas  │
│ Francois    │ Fignon     │ Director Oficina      │
│ Laurent     │ Serra      │ Representante Ventas  │
│ Hilary      │ Washington │ Director Oficina      │
│ Marcus      │ Paxton     │ Representante Ventas  │
│ Nei         │ Nishikori  │ Director Oficina      │
│ Narumi      │ Riko       │ Representante Ventas  │
│ Takuma      │ Nomura     │ Representante Ventas  │
│ Amy         │ Johnson    │ Director Oficina      │
│ Larry       │ Westfalls  │ Representante Ventas  │
│ John        │ Walton     │ Representante Ventas  │
│ Kevin       │ Fallmer    │ Director Oficina      │
└─────────────┴────────────┴───────────────────────┘ */

---Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
sqlite> SELECT nombre_cliente from cliente where codigo_cliente not in (SELECT codigo_cliente from pago);
/* ┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ Flores S.L.                 │
│ The Magic Garden            │
└─────────────────────────────┘ */

---Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
sqlite> SELECT nombre_cliente from cliente where codigo_cliente in (SELECT codigo_cliente from pago);
/* ┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ GoldFish Garden                │
│ Gardening Associates           │
│ Gerudo Valley                  │
│ Tendo Garden                   │
│ Beragua                        │
│ Naturagua                      │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Golf S.A.                      │
│ Sotogrande                     │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Jardineria Sara                │
│ Tutifruti S.A                  │
│ El Jardin Viviente S.L         │
└────────────────────────────────┘ */

---Devuelve un listado de los productos que nunca han aparecido en un pedido.
sqlite> SELECT codigo_producto, nombre from producto where codigo_producto not in (SELECT codigo_producto from detalle_pedido);
/* ┌─────────────────┬─────────────────────────────────────────────────────────────┐
│ codigo_producto │                           nombre                            │
├─────────────────┼─────────────────────────────────────────────────────────────┤
│ FR-104          │ Olea-Olivos                                                 │
│ FR-14           │ Calamondin Mini                                             │
│ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
│ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
│ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
│ FR-24           │ Albaricoquero Corbato                                       │
│ FR-25           │ Albaricoquero Moniqui                                       │
│ FR-26           │ Albaricoquero Kurrot                                        │
│ FR-27           │ Cerezo Burlat                                               │
│ FR-28           │ Cerezo Picota                                               │
│ FR-30           │ Ciruelo R. Claudia Verde                                    │
│ FR-32           │ Ciruelo Golden Japan                                        │
│ FR-35           │ Ciruelo Claudia Negra                                       │
│ FR-38           │ Higuera Verdal                                              │
│ FR-39           │ Higuera Breva                                               │
│ FR-44           │ Melocotonero Spring Crest                                   │
│ FR-46           │ Melocotonero Federica                                       │
│ FR-49           │ Parra Uva de Mesa                                           │
│ FR-5            │ Mandarino -Plantón joven                                    │
│ FR-50           │ Peral Castell                                               │
│ FR-51           │ Peral Williams                                              │
│ FR-52           │ Peral Conference                                            │
│ FR-55           │ Olivo Cipresino                                             │
│ FR-59           │ Albaricoquero                                               │
│ FR-61           │ Albaricoquero                                               │
│ FR-62           │ Albaricoquero                                               │
│ FR-63           │ Cerezo                                                      │
│ FR-65           │ Cerezo                                                      │
│ FR-68           │ Cerezo                                                      │
│ FR-70           │ Ciruelo                                                     │
│ FR-73           │ Granado                                                     │
│ FR-74           │ Granado                                                     │
│ FR-76           │ Granado                                                     │
│ FR-83           │ Higuera                                                     │
│ FR-88           │ Manzano                                                     │
│ FR-92           │ Melocotonero                                                │
│ FR-93           │ Melocotonero                                                │
│ FR-95           │ Melocotonero                                                │
│ FR-96           │ Membrillero                                                 │
│ FR-97           │ Membrillero                                                 │
│ FR-98           │ Membrillero                                                 │
│ FR-99           │ Membrillero                                                 │
│ OR-001          │ Arbustos Mix Maceta                                         │
│ OR-100          │ Mimosa Injerto CLASICA Dealbata                             │
│ OR-103          │ Mimosa Semilla Bayleyana                                    │
│ OR-105          │ Mimosa Semilla Espectabilis                                 │
│ OR-106          │ Mimosa Semilla Longifolia                                   │
│ OR-107          │ Mimosa Semilla Floribunda 4 estaciones                      │
│ OR-108          │ Abelia Floribunda                                           │
│ OR-109          │ Callistemom (Mix)                                           │
│ OR-110          │ Callistemom (Mix)                                           │
│ OR-111          │ Corylus Avellana \"Contorta\"                               │
│ OR-112          │ Escallonia (Mix)                                            │
│ OR-113          │ Evonimus Emerald Gayeti                                     │
│ OR-114          │ Evonimus Pulchellus                                         │
│ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │
│ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa                       │
│ OR-121          │ Lonicera Nitida \"Maigrum\"                                 │
│ OR-124          │ Prunus pisardii                                             │
│ OR-126          │ Weigelia \"Bristol Ruby\"                                   │
│ OR-131          │ Leptospermum formado PIRAMIDE                               │
│ OR-132          │ Leptospermum COPA                                           │
│ OR-133          │ Nerium oleander-CALIDAD \"GARDEN\"                          │
│ OR-134          │ Nerium Oleander Arbusto GRANDE                              │
│ OR-135          │ Nerium oleander COPA  Calibre 6/8                           │
│ OR-137          │ ROSAL TREPADOR                                              │
│ OR-138          │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
│ OR-142          │ Solanum Jazminoide                                          │
│ OR-143          │ Wisteria Sinensis  azul, rosa, blanca                       │
│ OR-144          │ Wisteria Sinensis INJERTADAS DECÃ“                          │
│ OR-145          │ Bougamvillea Sanderiana Tutor                               │
│ OR-148          │ Bougamvillea Sanderiana Espaldera                           │
│ OR-149          │ Bougamvillea Sanderiana Espaldera                           │
│ OR-151          │ Bougamvillea Sanderiana, 3 tut. piramide                    │
│ OR-153          │ Expositor Árboles clima mediterráneo                        │
│ OR-154          │ Expositor Árboles borde del mar                             │
│ OR-158          │ Brachychiton Acerifolius                                    │
│ OR-161          │ Cassia Corimbosa                                            │
│ OR-162          │ Cassia Corimbosa                                            │
│ OR-163          │ Chitalpa Summer Bells                                       │
│ OR-164          │ Erytrina Kafra                                              │
│ OR-166          │ Eucalyptus Citriodora                                       │
│ OR-167          │ Eucalyptus Ficifolia                                        │
│ OR-169          │ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │
│ OR-170          │ Lagunaria Patersonii                                        │
│ OR-171          │ Lagunaria Patersonii                                        │
│ OR-173          │ Morus Alba                                                  │
│ OR-175          │ Platanus Acerifolia                                         │
│ OR-178          │ Salix Babylonica  Pendula                                   │
│ OR-180          │ Tamarix  Ramosissima Pink Cascade                           │
│ OR-182          │ Tecoma Stands                                               │
│ OR-183          │ Tecoma Stands                                               │
│ OR-184          │ Tipuana Tipu                                                │
│ OR-185          │ Pleioblastus distichus-Bambú enano                          │
│ OR-187          │ Sasa palmata                                                │
│ OR-189          │ Phylostachys aurea                                          │
│ OR-190          │ Phylostachys aurea                                          │
│ OR-191          │ Phylostachys Bambusa Spectabilis                            │
│ OR-192          │ Phylostachys biseti                                         │
│ OR-194          │ Pseudosasa japonica (Metake)                                │
│ OR-195          │ Pseudosasa japonica (Metake)                                │
│ OR-197          │ Cedrus Deodara \"Feeling Blue\" Novedad                     │
│ OR-198          │ Juniperus chinensis \"Blue Alps\"                           │
│ OR-199          │ Juniperus Chinensis Stricta                                 │
│ OR-201          │ Juniperus squamata \"Blue Star\"                            │
│ OR-202          │ Juniperus x media Phitzeriana verde                         │
│ OR-212          │ Bismarckia Nobilis                                          │
│ OR-215          │ Brahea Armata                                               │
│ OR-216          │ Brahea Edulis                                               │
│ OR-219          │ Butia Capitata                                              │
│ OR-220          │ Butia Capitata                                              │
│ OR-221          │ Butia Capitata                                              │
│ OR-223          │ Chamaerops Humilis                                          │
│ OR-224          │ Chamaerops Humilis                                          │
│ OR-228          │ Chamaerops Humilis \"Cerifera\"                             │
│ OR-229          │ Chrysalidocarpus Lutescens -ARECA                           │
│ OR-230          │ Cordyline Australis -DRACAENA                               │
│ OR-231          │ Cycas Revoluta                                              │
│ OR-232          │ Cycas Revoluta                                              │
│ OR-233          │ Dracaena Drago                                              │
│ OR-235          │ Dracaena Drago                                              │
│ OR-238          │ Livistonia Decipiens                                        │
│ OR-239          │ Livistonia Decipiens                                        │
│ OR-242          │ Rhaphis Excelsa                                             │
│ OR-244          │ Sabal Minor                                                 │
│ OR-245          │ Sabal Minor                                                 │
│ OR-246          │ Trachycarpus Fortunei                                       │
│ OR-248          │ Washingtonia Robusta                                        │
│ OR-251          │ Zamia Furfuracaea                                           │
└─────────────────┴─────────────────────────────────────────────────────────────┘ */

---Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
sqlite> SELECT e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono from empleado as e JOIN oficina as o on e.codigo_oficina=o.codigo_oficina where e.codigo_empleado not in (SELECT codigo_empleado_rep_ventas from cliente);
/* ┌─────────────┬────────────┬───────────┬───────────────────────┬─────────────────┐
│   nombre    │ apellido1  │ apellido2 │        puesto         │    telefono     │
├─────────────┼────────────┼───────────┼───────────────────────┼─────────────────┤
│ Marcos      │ Magaña     │ Perez     │ Director General      │ +34 925 867231  │
│ Ruben       │ López      │ Martinez  │ Subdirector Marketing │ +34 925 867231  │
│ Alberto     │ Soria      │ Carrasco  │ Subdirector Ventas    │ +34 925 867231  │
│ Maria       │ Solís      │ Jerez     │ Secretaria            │ +34 925 867231  │
│ Juan Carlos │ Ortiz      │ Serrano   │ Representante Ventas  │ +34 925 867231  │
│ Carlos      │ Soria      │ Jimenez   │ Director Oficina      │ +34 91 7514487  │
│ Hilario     │ Rodriguez  │ Huertas   │ Representante Ventas  │ +34 91 7514487  │
│ David       │ Palma      │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
│ Oscar       │ Palma      │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
│ Francois    │ Fignon     │           │ Director Oficina      │ +33 14 723 4404 │
│ Laurent     │ Serra      │           │ Representante Ventas  │ +33 14 723 4404 │
│ Hilary      │ Washington │           │ Director Oficina      │ +1 215 837 0825 │
│ Marcus      │ Paxton     │           │ Representante Ventas  │ +1 215 837 0825 │
│ Nei         │ Nishikori  │           │ Director Oficina      │ +81 33 224 5000 │
│ Narumi      │ Riko       │           │ Representante Ventas  │ +81 33 224 5000 │
│ Takuma      │ Nomura     │           │ Representante Ventas  │ +81 33 224 5000 │
│ Amy         │ Johnson    │           │ Director Oficina      │ +44 20 78772041 │
│ Larry       │ Westfalls  │           │ Representante Ventas  │ +44 20 78772041 │
│ John        │ Walton     │           │ Representante Ventas  │ +44 20 78772041 │
│ Kevin       │ Fallmer    │           │ Director Oficina      │ +61 2 9264 2451 │
└─────────────┴────────────┴───────────┴───────────────────────┴─────────────────┘ */

---Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
sqlite> SELECT * from oficina where codigo_oficina not in (SELECT codigo_oficina from empleado where codigo_empleado in (SELECT codigo_empleado_rep_ventas from cliente where codigo_cliente in (SELECT codigo_cliente from pedido where codigo_producto in);

---Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
sqlite> SELECT codigo_cliente, nombre_cliente from cliente where codigo_cliente in (SELECT codigo_cliente from pedido) and codigo_cliente not in (SELECT codigo_cliente from pago);
/* ┌────────────────┬────────────────┐
│ codigo_cliente │ nombre_cliente │
├────────────────┼────────────────┤
│ 36             │ Flores S.L.    │
└────────────────┴────────────────┘ */



---SUBCONSULTAS CON EXIST/NOT EXIST

---Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
sqlite> SELECT nombre_cliente from cliente as c WHERE not EXISTS (SELECT p.codigo_cliente from pago as p where c.codigo_cliente=p.codigo_cliente);
/* ┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Club Golf Puerta del hierro │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Flowers, S.A                │
│ Naturajardin                │
│ Americh Golf Management SL  │
│ Aloha                       │
│ El Prat                     │
│ Vivero Humanes              │
│ Fuenla City                 │
│ Top Campo                   │
│ Campohermoso                │
│ france telecom              │
│ Musée du Louvre             │
│ Flores S.L.                 │
│ The Magic Garden            │
└─────────────────────────────┘ */
---Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
sqlite> SELECT nombre_cliente from cliente as c WHERE EXISTS (SELECT p.codigo_cliente from pago as p where c.codigo_cliente=p.codigo_cliente);
/* ┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ GoldFish Garden                │
│ Gardening Associates           │
│ Gerudo Valley                  │
│ Tendo Garden                   │
│ Beragua                        │
│ Naturagua                      │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Golf S.A.                      │
│ Sotogrande                     │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Jardineria Sara                │
│ Tutifruti S.A                  │
│ El Jardin Viviente S.L         │
└────────────────────────────────┘ */

---Devuelve un listado de los productos que nunca han aparecido en un pedido.
sqlite> SELECT nombre from producto as pro where not EXISTS (SELECT d.codigo_producto from detalle_pedido as d where pro.codigo_producto=d.codigo_producto);
/* ┌─────────────────────────────────────────────────────────────┐
│                           nombre                            │
├─────────────────────────────────────────────────────────────┤
│ Olea-Olivos                                                 │
│ Calamondin Mini                                             │
│ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
│ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
│ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
│ Albaricoquero Corbato                                       │
│ Albaricoquero Moniqui                                       │
│ Albaricoquero Kurrot                                        │
│ Cerezo Burlat                                               │
│ Cerezo Picota                                               │
│ Ciruelo R. Claudia Verde                                    │
│ Ciruelo Golden Japan                                        │
│ Ciruelo Claudia Negra                                       │
│ Higuera Verdal                                              │
│ Higuera Breva                                               │
│ Melocotonero Spring Crest                                   │
│ Melocotonero Federica                                       │
│ Parra Uva de Mesa                                           │
│ Mandarino -Plantón joven                                    │
│ Peral Castell                                               │
│ Peral Williams                                              │
│ Peral Conference                                            │
│ Olivo Cipresino                                             │
│ Albaricoquero                                               │
│ Albaricoquero                                               │
│ Albaricoquero                                               │
│ Cerezo                                                      │
│ Cerezo                                                      │
│ Cerezo                                                      │
│ Ciruelo                                                     │
│ Granado                                                     │
│ Granado                                                     │
│ Granado                                                     │
│ Higuera                                                     │
│ Manzano                                                     │
│ Melocotonero                                                │
│ Melocotonero                                                │
│ Melocotonero                                                │
│ Membrillero                                                 │
│ Membrillero                                                 │
│ Membrillero                                                 │
│ Membrillero                                                 │
│ Arbustos Mix Maceta                                         │
│ Mimosa Injerto CLASICA Dealbata                             │
│ Mimosa Semilla Bayleyana                                    │
│ Mimosa Semilla Espectabilis                                 │
│ Mimosa Semilla Longifolia                                   │
│ Mimosa Semilla Floribunda 4 estaciones                      │
│ Abelia Floribunda                                           │
│ Callistemom (Mix)                                           │
│ Callistemom (Mix)                                           │
│ Corylus Avellana \"Contorta\"                               │
│ Escallonia (Mix)                                            │
│ Evonimus Emerald Gayeti                                     │
│ Evonimus Pulchellus                                         │
│ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                │
│ Hibiscus Syriacus \"Pink Giant\" Rosa                       │
│ Lonicera Nitida \"Maigrum\"                                 │
│ Prunus pisardii                                             │
│ Weigelia \"Bristol Ruby\"                                   │
│ Leptospermum formado PIRAMIDE                               │
│ Leptospermum COPA                                           │
│ Nerium oleander-CALIDAD \"GARDEN\"                          │
│ Nerium Oleander Arbusto GRANDE                              │
│ Nerium oleander COPA  Calibre 6/8                           │
│ ROSAL TREPADOR                                              │
│ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │
│ Solanum Jazminoide                                          │
│ Wisteria Sinensis  azul, rosa, blanca                       │
│ Wisteria Sinensis INJERTADAS DECÃ“                          │
│ Bougamvillea Sanderiana Tutor                               │
│ Bougamvillea Sanderiana Espaldera                           │
│ Bougamvillea Sanderiana Espaldera                           │
│ Bougamvillea Sanderiana, 3 tut. piramide                    │
│ Expositor Árboles clima mediterráneo                        │
│ Expositor Árboles borde del mar                             │
│ Brachychiton Acerifolius                                    │
│ Cassia Corimbosa                                            │
│ Cassia Corimbosa                                            │
│ Chitalpa Summer Bells                                       │
│ Erytrina Kafra                                              │
│ Eucalyptus Citriodora                                       │
│ Eucalyptus Ficifolia                                        │
│ Hibiscus Syriacus  Var. Injertadas 1 Tallo                  │
│ Lagunaria Patersonii                                        │
│ Lagunaria Patersonii                                        │
│ Morus Alba                                                  │
│ Platanus Acerifolia                                         │
│ Salix Babylonica  Pendula                                   │
│ Tamarix  Ramosissima Pink Cascade                           │
│ Tecoma Stands                                               │
│ Tecoma Stands                                               │
│ Tipuana Tipu                                                │
│ Pleioblastus distichus-Bambú enano                          │
│ Sasa palmata                                                │
│ Phylostachys aurea                                          │
│ Phylostachys aurea                                          │
│ Phylostachys Bambusa Spectabilis                            │
│ Phylostachys biseti                                         │
│ Pseudosasa japonica (Metake)                                │
│ Pseudosasa japonica (Metake)                                │
│ Cedrus Deodara \"Feeling Blue\" Novedad                     │
│ Juniperus chinensis \"Blue Alps\"                           │
│ Juniperus Chinensis Stricta                                 │
│ Juniperus squamata \"Blue Star\"                            │
│ Juniperus x media Phitzeriana verde                         │
│ Bismarckia Nobilis                                          │
│ Brahea Armata                                               │
│ Brahea Edulis                                               │
│ Butia Capitata                                              │
│ Butia Capitata                                              │
│ Butia Capitata                                              │
│ Chamaerops Humilis                                          │
│ Chamaerops Humilis                                          │
│ Chamaerops Humilis \"Cerifera\"                             │
│ Chrysalidocarpus Lutescens -ARECA                           │
│ Cordyline Australis -DRACAENA                               │
│ Cycas Revoluta                                              │
│ Cycas Revoluta                                              │
│ Dracaena Drago                                              │
│ Dracaena Drago                                              │
│ Livistonia Decipiens                                        │
│ Livistonia Decipiens                                        │
│ Rhaphis Excelsa                                             │
│ Sabal Minor                                                 │
│ Sabal Minor                                                 │
│ Trachycarpus Fortunei                                       │
│ Washingtonia Robusta                                        │
│ Zamia Furfuracaea                                           │
└─────────────────────────────────────────────────────────────┘ */

---Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
sqlite> SELECT nombre from producto as pro where EXISTS (SELECT d.codigo_producto from detalle_pedido as d where pro.codigo_producto=d.codigo_producto);
/* ┌─────────────────────────────────────────────────────────────┐
│                           nombre                            │
├─────────────────────────────────────────────────────────────┤
│ Sierra de Poda 400MM                                        │
│ Pala                                                        │
│ Rastrillo de Jardín                                         │
│ Azadón                                                      │
│ Ajedrea                                                     │
│ Lavándula Dentata                                           │
│ Mejorana                                                    │
│ Melissa                                                     │
│ Mentha Sativa                                               │
│ Petrosilium Hortense (Peregil)                              │
│ Salvia Mix                                                  │
│ Thymus Citriodra (Tomillo limón)                            │
│ Thymus Vulgaris                                             │
│ Santolina Chamaecyparys                                     │
│ Expositor Cítricos Mix                                      │
│ Limonero 2 años injerto                                     │
│ Nectarina                                                   │
│ Nogal                                                       │
│ Olea-Olivos                                                 │
│ Olea-Olivos                                                 │
│ Olea-Olivos                                                 │
│ Peral                                                       │
│ Peral                                                       │
│ Peral                                                       │
│ Limonero 30/40                                              │
│ Kunquat                                                     │
│ Kunquat  EXTRA con FRUTA                                    │
│ Calamondin Copa                                             │
│ Calamondin Copa EXTRA Con FRUTA                             │
│ Rosal bajo 1Âª -En maceta-inicio brotación                  │
│ ROSAL TREPADOR                                              │
│ Naranjo -Plantón joven 1 año injerto                        │
│ Pitimini rojo                                               │
│ Rosal copa                                                  │
│ Cerezo Napoleón                                             │
│ Naranjo 2 años injerto                                      │
│ Ciruelo Santa Rosa                                          │
│ Ciruelo Friar                                               │
│ Ciruelo Reina C. De Ollins                                  │
│ Granado Mollar de Elche                                     │
│ Higuera Napolitana                                          │
│ Naranjo calibre 8/10                                        │
│ Manzano Starking Delicious                                  │
│ Manzano Reineta                                             │
│ Manzano Golden Delicious                                    │
│ Membrillero Gigante de Wranja                               │
│ Melocotonero Amarillo de Agosto                             │
│ Melocotonero Paraguayo                                      │
│ Nogal Común                                                 │
│ Peral Blanq. de Aranjuez                                    │
│ Níspero Tanaca                                              │
│ Nectarina                                                   │
│ Kaki Rojo Brillante                                         │
│ Albaricoquero                                               │
│ Mandarino 2 años injerto                                    │
│ Albaricoquero                                               │
│ Cerezo                                                      │
│ Cerezo                                                      │
│ Cerezo                                                      │
│ Cerezo                                                      │
│ Mandarino calibre 8/10                                      │
│ Ciruelo                                                     │
│ Ciruelo                                                     │
│ Granado                                                     │
│ Granado                                                     │
│ Higuera                                                     │
│ Higuera                                                     │
│ Limonero -Plantón joven                                     │
│ Higuera                                                     │
│ Higuera                                                     │
│ Higuera                                                     │
│ Kaki                                                        │
│ Kaki                                                        │
│ Manzano                                                     │
│ Manzano                                                     │
│ Manzano                                                     │
│ Limonero calibre 8/10                                       │
│ Níspero                                                     │
│ Níspero                                                     │
│ Melocotonero                                                │
│ Expositor Mimosa Semilla Mix                                │
│ Mimosa Semilla Bayleyana                                    │
│ Mimosa Semilla Cyanophylla                                  │
│ Forsytia Intermedia \"Lynwood\"                             │
│ Hibiscus Syriacus  \"Diana\" -Blanco Puro                   │
│ Laurus Nobilis Arbusto - Ramificado Bajo                    │
│ Lonicera Nitida                                             │
│ Lonicera Pileata                                            │
│ Philadelphus \"Virginal\"                                   │
│ Viburnum Tinus \"Eve Price\"                                │
│ Camelia japonica                                            │
│ Camelia japonica ejemplar                                   │
│ Camelia japonica ejemplar                                   │
│ Callistemom COPA                                            │
│ Nerium oleander ARBOL Calibre 8/10                          │
│ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │
│ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │
│ Pitimini rojo                                               │
│ Bougamvillea Sanderiana Tutor                               │
│ Bougamvillea Sanderiana Tutor                               │
│ Bougamvillea roja, naranja                                  │
│ Expositor Árboles clima continental                         │
│ Acer Negundo                                                │
│ Acer platanoides                                            │
│ Acer Pseudoplatanus                                         │
│ Brachychiton Discolor                                       │
│ Brachychiton Rupestris                                      │
│ Erytrina Kafra                                              │
│ Eucalyptus Ficifolia                                        │
│ Lagunaria patersonii  calibre 8/10                          │
│ Morus Alba  calibre 8/10                                    │
│ Prunus pisardii                                             │
│ Robinia Pseudoacacia Casque Rouge                           │
│ Sesbania Punicea                                            │
│ Tamarix  Ramosissima Pink Cascade                           │
│ Sasa palmata                                                │
│ Sasa palmata                                                │
│ Phylostachys biseti                                         │
│ Cedrus Deodara                                              │
│ Juniperus horizontalis Wiltonii                             │
│ Pinus Canariensis                                           │
│ Pinus Halepensis                                            │
│ Pinus Pinea -Pino Piñonero                                  │
│ Thuja Esmeralda                                             │
│ Tuja Occidentalis Woodwardii                                │
│ Tuja orientalis \"Aurea nana\"                              │
│ Archontophoenix Cunninghamiana                              │
│ Beucarnea Recurvata                                         │
│ Beucarnea Recurvata                                         │
│ Bismarckia Nobilis                                          │
│ Brahea Armata                                               │
│ Brahea Edulis                                               │
│ Butia Capitata                                              │
│ Butia Capitata                                              │
│ Chamaerops Humilis                                          │
│ Chamaerops Humilis                                          │
│ Chamaerops Humilis                                          │
│ Dracaena Drago                                              │
│ Jubaea Chilensis                                            │
│ Livistonia Australis                                        │
│ Phoenix Canariensis                                         │
│ Phoenix Canariensis                                         │
│ Rhaphis Humilis                                             │
│ Trachycarpus Fortunei                                       │
│ Washingtonia Robusta                                        │
│ Yucca Jewel                                                 │
│ Mimosa DEALBATA Gaulois Astier                              │
└─────────────────────────────────────────────────────────────┘ */

