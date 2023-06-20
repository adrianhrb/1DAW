# PASOS PARA LA INSTALACIÓN DE DOCKER JUNTO A CONFIGURACIÓN MYSQL

1. En primer lugar, debemos instalar Docker siguiendo los pasos que aparecen en su página. Es una instalación sencilla que solo lleva unos minutos para copiar y pegar los comandos que se nos indican. Podemos seguir los pasos en [la página de docker](https://docs.docker.com/engine/install/ubuntu/)

2. Una vez instalado Docker, vamos a sumarle la instalación de docker compose. De nuevo, se trata de una instalación sencilla. Un tutorial sencillo poddría encontrarse en [la siguiente página](https://geekflare.com/es/docker-compose/)

3. Una vez tenemos instaladas ambas cosas, vamos a proceder a la instlación de un contenedor sin persistencia de datos. Esto significa que al finalizar la ejecución se perderá todo lo que hayamos hecho. Para crear el contenedor sin persistencia vamos a ejecutar el comando:

```
docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 mysql:8.0
```

Es posible que nos salte un error porque el servicio de mysql esté activo. Para solucionarlo lanzamos:

```
systemct status mysql
```

Y en caso de que esté activo lanzamos:

```
sudo systemctl stop mysql
```

Con lo anterior ya hecho y todo correctamente lanzado, vamos a entrar en la terminal de root para comprobar que docker funciona bien y que tenemos el contenedor sin persistencia creado. Para ello, lanzamos el comando "sudo su" y una vez ahí, lanzamos:

```
docker ps -a
```

Y deberíamos ver una salida similar a la siguiente:
![docker](/Tareas/Tareas-SQL/instalaci%C3%B3n_docker/img/1.png)

4. Por último, se borra el contenedor sin persistencia para crear uno nuevo con persistencia. Para este paso debemos lanzar "docker stop" más el ID del contenedor y para la creación del nuevo le pasamos el parámetro -v al comando que indicamos para el otro contenedor. De forma que quedaría un comando así junto a la salida esperada del docker ps -a:

```
docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v mysql_data:/var/lib/mysql mysql:8.0
```

![docker](/Tareas/Tareas-SQL/instalaci%C3%B3n_docker/img/3.png)
