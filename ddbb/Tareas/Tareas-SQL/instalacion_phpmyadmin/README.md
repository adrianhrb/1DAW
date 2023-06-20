# INSTALACIÓN + CONFIGURACIÓN PHPMYADMIN Y MARIADB CON DOCKER
1. Antes de comenzar con la instalación debemos comprobar que tenemos el servicio de mysql parado. Para ello lanzamos: 
```
systemctl status mysql
```
y en caso de que salga verde, que significa que está corriendo, lanzamos para pararlo:
```
systemctl stop mysql
```

2. Una vez comprobado lo anterior, pasamos a la instalación y configuración. En primer lugar, comprobamos con "sudo docker ps -a" que no hay ningún contenedor para evitar problemas. Una vez hecho, lanzamos un contenedor de MySql en docker. Usamos para ello:
```
docker run -d \
--rm \
--name mysqlc \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=root \
-v mysql_data:/var/lib/mysql \
mysql:8.0
```
Con el contenedor lanzado, ahora podemos crear el contenedor de phpMyAdmin, para ello lanzamos el comando:
```
docker run -d \
--rm \
--name phpmyadminc \
--link mysqlc \
-e PMA_HOST=mysqlc \
-p 8080:80 \
phpmyadmin
```
Para comprobar que todo ha ido bien, entramos en el navegador y con http://localhost:8080 podemos comprobar que se abre phpMyAdmin, en tal caso todo ha funcionado correcamente. Además, si ejecutamos un docker ps -a deberiamos ver una salida similar a:
```
root@adrian-VirtualBox:/home/adrian# docker ps -a
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS                  PORTS                                                  NAMES
c96b9024b7e1   phpmyadmin    "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes            0.0.0.0:8080->80/tcp, :::8080->80/tcp                  phpmyadminc
0a1795ff26ee   mysql:8.0     "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes            0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   mysqlc
```

3. Esta que hemos visto es la primera solución, ahora vamos a ver como hacerlo a través de una user-defined bridge network. Ahora, en primer lugar creamos una user-defined bridge network con:
```
docker network create my-net
```
Ahora, creamos el contenedor con MySQL con --network my-net. Usamos:
```
docker run -d \
--rm \
--name mysqlc \
--network my-net \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=root \
-v mysql_data:/var/lib/mysql \
mysql:8.0
```
Y ahora lo mismo con phpMyAdmin:
```docker run -d \
--rm \
--name phpmyadminc \
--network my-net \
-e PMA_HOST=mysqlc \
-p 8080:80 \
phpmyadmin
```

Volvemos a comprobar con http://localhost:8080 en un navegador que todo ha ido bien.

4. Ahora pasamos con MariaDB. Lo primero para hacer un crear un contenedor con persistencia de datos con:
```
docker run -d \
--rm \
--name mariadbc \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=root \
-v mariadb_data:/var/lib/mysql \
mariadb:10
```

Y con este contendor hecho, hacemos la conexión de phpMyAdmin con el de MariaDB. Lanzamos:
```
docker run -d \
--rm \
--name phpmyadminc \
--link mariadbc \
-e PMA_HOST=mariadbc \
-p 8080:80 \
phpmyadmin
```

Con los pasos anteriores terminados, comprobamos que todo haya ido bien con "sudo docker ps -a" y debería de aparecer una salida así:
```
root@adrian-VirtualBox:/home/adrian# docker ps -a
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS                  PORTS                                       NAMES
26f03d9d5e58   phpmyadmin    "/docker-entrypoint.…"   49 seconds ago   Up 48 seconds           0.0.0.0:8080->80/tcp, :::8080->80/tcp       phpmyadminc
2e4504c77aa9   mariadb:10    "docker-entrypoint.s…"   59 seconds ago   Up 58 seconds           0.0.0.0:3306->3306/tcp, :::3306->3306/tcp   mariadbc
```
Con todo hecho, detenemos los contenedores y listo.