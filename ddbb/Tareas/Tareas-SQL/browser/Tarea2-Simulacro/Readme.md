# SIMULACRO DE SENTENCIAS SQL

- En primer lugar hacemos la creación de la tabla:
    - 

- Una vez hecho, comenzamos con las consultas:

1. Listar los nombres de los usuarios
    - SELECT nombre from Usuario;
2. Calcular el saldo máximo de los usuarios de sexo “Mujer”
    - SELECT max(saldo) from Usuario where sexo="M";
3. Listar nombre y teléfono de los usuarios con teléfono TOMTON, BLACK o DREAMS
    - SELECT nombre, teléfono from Usuario where marca in ("TOMTON", "BLACK", "DREAMS");
4. Contar los usuarios sin saldo o inactivos
    - SELECT count(id) from Usuario where saldo=0 or activo=0
5. Listar el login de los usuarios con nivel 1, 2 o 3
    - SELECT login from Usuario where nivel in (1,2,3);
6. Listar los números de teléfono con saldo menor o igual a 300
    - SELECT teléfono from Usuario where saldo <=300 
7. Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL
    - SELECT sum(saldo) from Usuario where compañia="NEXTEL";
8. Contar el número de usuarios por compañía telefónica
    - SELECT count(id), compañia from Usuario group by compañia;
9. Contar el número de usuarios por nivel
    - SELECT count(id), nivel from Usuario GROUP by nivel;
10. Listar el login de los usuarios con nivel 2
    - SELECT login from Usuario where nivel=2;
11. Mostrar el email de los usuarios que usan gmail
    - SELECT email from Usuario where email REGEXP 'gmail';
12. Listar nombre y teléfono de los usuarios con teléfono LG4, KINKI o MOT
    - SELECT nombre, telefono FROM Usuario where marca in ("LG4", "KINKI", "MOT");
13. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG4 o KINKI
    - SELECT nombre, telefono FROM Usuario where marca not in ("LG4", "KINKI");
14. Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL
    - SELECT login, telefono from Usuario where compañia="IUSACELL";
15. Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL
    - SELECT login, telefono from Usuario where compañia not in ("TELCEL");
16. Calcular el saldo promedio de los usuarios que tienen teléfono marca TOMTON
    - SELECT avg(saldo) from Usuario where marca="TOMTON";
17. Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL
    - SELECT login, telefono from Usuario where compañia in ("IUSACELL", "AXEL");
18. Mostrar el email de los usuarios que no usan yahoo
    - SELECT email from Usuario where email not REGEXP 'yahoo';
19. Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL
    - SELECT login, telefono from Usuario WHERE compañia not in ("TELCEL", "IUSACELL");
20. Listar el login y teléfono de los usuarios con compañia telefónica UNEFON
    - SELECT login, telefono from Usuario where compañia="UNEFON";
21. Listar las diferentes marcas de celular en orden alfabético descendentemente
    - SELECT DISTINCT marca from Usuario ORDER by marca DESC;
22. Listar las diferentes compañias en orden alfabético aleatorio
    - SELECT DISTINCT compañia from Usuario;
23. Listar el login de los usuarios con nivel 0 o 2
    - SELECT login from Usuario where nivel in (0, 2);
24. Calcular el saldo promedio de los usuarios que tienen teléfono marca LG4
    - SELECT avg(saldo) FROM Usuario where marca in ("LG4");
25. Listar el login de los usuarios con nivel 1 o 3
    - SELECT login from Usuario where nivel=1 or nivel=3;
26. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACK
    - SELECT nombre, telefono from Usuario where marca not in ("BLACK");
27. Listar el login de los usuarios con nivel 3
    - SELECT login from Usuario where nivel=3;
28. Listar el login de los usuarios con nivel 0
    - SELECT login from Usuario where nivel=0;
29. Listar el login de los usuarios con nivel 1
    - SELECT login from Usuario where nivel=1;
31. Contar el número de usuarios por sexo
    - SELECT count(id), sexo from Usuario GROUP by sexo;
32. Listar el login y teléfono de los usuarios con compañia telefónica AT&T
    - SELECT login, telefono from Usuario WHERE compañia="AT&T";
33. Listar las diferentes compañias en orden alfabético descendentemente
    - SELECT DISTINCT compañia from Usuario ORDER by compañia DESC;
34. Listar el logn de los usuarios inactivos
    - SELECT login from Usuario where activo=0;
35. Listar los números de teléfono sin saldo
    - SELECT telefono from Usuario where saldo=0;
36. Calcular el saldo mínimo de los usuarios de sexo “Hombre”
    - SELECT min(saldo) from Usuario where sexo="H";
37. Listar los números de teléfono con saldo mayor a 300.
    - SELECT telefono from Usuario where saldo>300;