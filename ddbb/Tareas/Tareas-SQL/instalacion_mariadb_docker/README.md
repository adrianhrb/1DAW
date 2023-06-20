# INSTALACIÓN Y CONFIGURACIÓN DE MARIADB EN DOCKER

1. De forma similar a mysql, con MariaDB podremos crear un contenedor con persistencia de datos o uno sin. Para esta instalación vamos a saltarnos el paso del contenedor sin perisistencia y haremos directamente el contendor con persistencia para que se mantengan los datos. 

2. Lanzamos el comando similar al anterior con el -v para mantener la persistencia. LO haremos con el comando:
```
docker run -d --rm --name mariabd -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v mariadb_data:/var/lib/mysql mariadb
```

3. Una vez lanzado, comprobamos que todo haya ido bien lanzando docker ps y así nos saldrá el contenedor de MariaDB junto a su información en docker. Antes de comprobarlo deberíamos ver algo similar a lo siguiente:
``` 
"root@adrian-VirtualBox:/home/adrian# docker run -d --rm --name mariabd -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v mariadb_data:/var/lib/mysql mariadb
bb65874751488e244189717b73f7ed0a081b1a5f1d48af3cb160453c7f1720d2"
```

4. Por último y habiendo comprobado con docker ps que exitse el contenedor con persistencia vamos a detenerlo para continuar con las siguientes instalaciones. Para ello hacemos un docker stop junto con el ID del contenedor que nos sale justo en la comprobación anterior que hemos realizado.