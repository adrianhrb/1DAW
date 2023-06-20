# CONTENEDOR DE DOCKER CON POSTGRESQL

1. Como en las últimas tareas hemos visto, tenemos la opción de crear un contenedor sin persistencia de datos, y vamos a hacerlo con el siguiente comando:
```
docker run -d --rm --name postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres
```

2. Una vez hecho vamos a conectarnos al conetenedor usando adminer. Lanzamos el siguiente comando: 
```
docker run -d --rm  --link postgres:db -p 8080:8080 adminer
```

3. Y por último, tras comprobar con "docker ps" que todo ha ido bien, detenemos el contenedor con docker stop y el ID del propio contenedor. Esta vez debemos parar el contenedor de postgre y la conexion de adminer. 