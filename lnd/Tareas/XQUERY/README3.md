### Ejercicio 2

### 1. Muestra el título del videojuego.

```
for $videojuego in /videojuego/titulo
return $videojuego
```

### 2. Muestra la plataforma del videojuego.

```
for $videojuego in /videojuego/plataforma
return $videojuego
```

### 3. Muestra el nombre de todos los agentes.

```
for $agente in /videojuego/agentes/agente/nombre
return $agente
```

### 4. Muestra el nombre y la habilidad ultimate de todos los agentes.

```
for $infoagente in /videojuego/agentes/agente
return
<agente>
<nombre>{$infoagente/nombre}</nombre>
<ulti>{$infoagente/habilidadUltimate}</ulti>
</agente>
```

### 5. Muestra los nombres de los agentes cuya habilidad primaria es "Incendiario".

```
for $info in /videojuego/agentes/agente
where ends-with ($info/habilidadPrimaria, "Incendiario")
return $info/nombre
```

### 6. Muestra los nombres de los agentes cuya habilidad ultimate es "Fénix".

```
for $info /videojuego/agentes/agente
where $info/habilidadUltimate = 'Fénix'
return $info/nombre
```

### 7. Muestra las habilidades primarias de los agentes cuyo nombre empieza por "J".

```
for $info in /videojuego/agentes/agente
where starts-with ($info/nombre, "J")
return $info/habilidadPrimaria
```

### 8. Muestra los nombres de los agentes cuyas habilidades primarias empiezan por "Bola".

```
for $info in /videojuego/agentes/agente
where starts-with ($info/habilidadPrimaria, "Bola")
return $info/nombre
```

### 9. Muestra los nombres de todos los agentes en orden alfabético.

```
for $nombre in /videojuego/agentes/agente/nombre
orderby $nombre
return $nombre
```

### 10. Muestra las habilidades primarias y secundarias de los agentes cuyo nombre contiene la letra "y".

```
for $info in /videojuego/agentes/agente
where contains ($info/nombre, 'y')
return <agente>
<ph>{$info/habilidadPrimaria}</ph>
<hs>{$info/habilidadSecundaria}</hs>
</agente>
```

### 11. Muestra los nombres de los agentes cuya habilidad ultimate contiene la palabra "cuchillos".

```
for $info in /videojuego/agentes/agente
where contains($info/habilidadUltimate, 'Cuchillos')
return $info/nombre
```

### 12. Muestra las habilidades primarias de los agentes cuyo nombre contiene la letra "o" y la habilidad secundaria contiene la palabra "humo".

```
for $info in /videojuego/agentes/agente
where contains ($info/nombre, 'o') and contains($info/habilidadSecundaria, 'humo')
return $info/habilidadPrimaria
```

### 13. Muestra los nombres de los agentes que tienen exactamente tres habilidades.

```
for $info in //agente
where count($info/*[contains(local-name(), "habilidad")]) = 3
return $info/nombre
```

### 14. Muestra los nombres de los agentes cuya habilidad secundaria no es "Granada Cegadora".

```
for $info in videojuego/agentes/agente
where $info/habilidadSecundaria != 'Granada Cegadora'
return $info/nombre
```

### 15. Muestra las habilidades primarias de los agentes cuyos nombres no contienen la letra "e".

```
for $info in /videojuego/agentes/agente
where not(contains($info/nombre, 'e'))
return $info/nombre
```

### 16. Muestra los nombres de los agentes cuyas habilidades primarias contienen la palabra "muro" o la palabra "barrera".

```
for $info in /videojuego/agentes/agente
where contains($info/habilidadPrimaria, "muro") or contains($info/habilidadPrimaria, "barrera")
return $info/nombre
```

```
for $info in /videojuego/agentes/agente
where contains($info/habilidadPrimaria, "Barrera") or contains($info/habilidadSecundaria, "Muro")
return $info/nombre
```

### 17. Muestra las habilidades ultimates de los agentes en orden alfabético inverso.

```
for $info in /videojuego/agentes/agente
order by $info/habilidadUltimate descending
return $info/habilidadUltimate
```

### 18. Muestra los nombres de los agentes cuya habilidad ultimate tiene una duración mayor a 8 segundos.

```
for $info in /videojuego/agentes/agente
where $info/habilidadUltimate/@duracion > 8
return $info/nombre
```

### 19. Muestra el nombre del agente con la habilidad ultimate más corta.

```
for $info in /videojuego/agentes/agente
let $minimo := min(//agente/habilidadUltimate/@duracion)
where $info/habilidadUltimate/@duracion = $minimo
return $info/nombre
```

### 20. Muestra los nombres de los agentes que tienen habilidades primarias y secundarias con la misma duración.

```
for $info in /videojuego/agentes/agente
where $info/habilidadPrimaria/@duracion = $info/habilidadSecundaria/@duracion
return $info/nombre
```

### 21. Muestra el nombre de los agentes que tienen habilidades primarias y secundarias que pertenecen al mismo tipo.

```
for $info in /videojuego/agentes/agente
where $info/habilidadPrimaria/@tipo = $info/habilidadSecundaria/@tipo
return $info/nombre
```

### 22. Muestra los nombres de los agentes cuyas habilidades primarias son de tipo "Daño" y sus habilidades secundarias son de tipo "Curación".

```
for $info in //agente
where $info/habilidadPrimaria/@tipo = 'Daño' and $info/habilidadSecundaria/@tipo = 'Curación'
return $info/nombre
```

### 23. Muestra los nombres de los agentes que tienen habilidades primarias y secundarias que contienen la misma palabra.

```
for $info in //agente
where contains($info/habilidadPrimaria, $info/habilidadSecundaria)
return $info/nombre
```
