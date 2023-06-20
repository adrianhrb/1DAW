# EJERCICIOS PRÁCTICO XPATH

1. Dado el siguiente XML escribe las siguientes expresiones xpath:

   ```
   <?xml version="1.0" encoding="UTF-8"?>
   <ies>
      <nombre>IES Puerto de la Cruz – Telesforo Bravo</nombre>
      <web>
      https://www3.gobiernodecanarias.org/medusa/edublog/iespuertodelacruzte
      lesforobravo/</web>
      <ciclos>
          <ciclo id="ASIR">
              <nombre>Administración de Sistemas Informáticos en Red</nombre>
              <grado>Superior</grado>
              <decretoTitulo año="2009" />
          </ciclo>
          <ciclo id="DAM">
              <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
              <grado>Superior</grado>
              <decretoTitulo año="2010" />
          </ciclo>
          <ciclo id="SMR">
              <nombre>Sistemas Microinformáticos y Redes</nombre>
              <grado>Medio</grado>
              <decretoTitulo año="2008" />
          </ciclo>
      </ciclos>
   </ies>
   ```

   - Nombre del instituto:

     `/ies/nombre`

   - Página web del instituto:

     `/ies/web`

   - Nombre de los ciclos formativos:

     `/ies/ciclos/ciclo/nombre`

   - Siglas por las que se conocen los ciclos formativos:

     `/ies/ciclos/ciclo/@id`

   - Años en los que se publicaron:

     `/ies/ciclos/ciclo/decretoTitulo`

   - Nombre de los ciclos de grado medio:

     `/ies/ciclos/ciclo[grado = 'Medio']`

   - Nombre de los ciclos superiores:

     `/ies/ciclos/ciclo[grado='Superior']`

   - Nombre de los ciclos anteriores a 2010:

     `/ies/ciclos/ciclo/decretoTitulo[@año < 2010]`

   - Nombre de los ciclos de 2008 o 2010:

     `/ies/ciclos/ciclo/decretoTitulo[@año = 2010 or @año = 2008]`

2. Dado el siguiente xml, resuelva el xpath:

   ```
   <?xml version="1.0" encoding="UTF-8"?>
   <ies>
      <modulos>
          <modulo id="0228">
              <nombre>Aplicaciones web</nombre>
              <curso>2</curso>
              <horasSemanales>4</horasSemanales>
              <ciclo>SMR</ciclo>
          </modulo>
          <modulo id="0372">
              <nombre>Gestión de bases de datos</nombre>
              <curso>1</curso>
              <horasSemanales>5</horasSemanales>
          <ciclo>ASIR</ciclo>
          </modulo>
          <modulo id="0373">
              <nombre>Lenguajes de marcas y sistemas de gestión de
              información</nombre>
              <curso>1</curso>
              <horasSemanales>3</horasSemanales>
              <ciclo>ASIR</ciclo>
              <ciclo>DAM</ciclo>
          </modulo>
      <modulo id="0376">
              <nombre>Implantación de aplicaciones web</nombre>
              <curso>2</curso>
              <horasSemanales>5</horasSemanales>
              <ciclo>ASIR</ciclo>
          </modulo>
      </modulos>
   </ies>
   ```

   - Nombre de los módulos que se imparten en el Instituto:

     `/ies/modulos/modulo/nombre`

   - Nombre de los módulos del ciclo de Asir:

     `/ies/modulos/modulo[ciclo = 'ASIR']`

   - Nombre de los modulos que se imparten en segundo de cualquier ciclo:

     `/ies/modulos/modulo[curso = 2]/nombre`

   - Nombre de los módulos de menos de 5 horas semanales:

     `/ies/modulos/modulo[horasSemanales < 5]/nombre`

   - Nombre de los módulos que se imparten en el primer curso de ASIR:

     `/ies/modulos/modulo[ciclo = 'ASIR' and curso = 1]/nombre`

   - Horas semanales de los módulos de más de 3 horas semanales:

     `/ies/modulos/modulo[horasSemanales > 3]/horasSemanales`

3. Dado el siguiente XML realiza el Xpath:

   ```
   <?xml version="1.0" encoding="UTF-8"?>
   <ies>
      <nombre>IES Puerto de la Cruz – Telesforo Bravo</nombre>
      <web>
      https://www3.gobiernodecanarias.org/medusa/edublog/iespuertodelacruzte
      lesforobravo/</web>
      <ciclos>
          <ciclo id="ASIR">
              <nombre>Administración de Sistemas Informáticos en Red</nombre>
              <grado>Superior</grado>
              <decretoTitulo año="2009" />
          </ciclo>
          <ciclo id="DAM">
              <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
              <grado>Superior</grado>
              <decretoTitulo año="2010" />
          </ciclo>
          <ciclo id="SMR">
              <nombre>Sistemas Microinformáticos y Redes</nombre>
              <grado>Medio</grado>
              <decretoTitulo año="2008" />
          </ciclo>
      </ciclos>
      <modulos>
          <modulo id="0228">
              <nombre>Aplicaciones web</nombre>
              <curso>2</curso>
              <horasSemanales>4</horasSemanales>
              <ciclo>SMR</ciclo>
          </modulo>
          <modulo id="0372">
              <nombre>Gestión de bases de datos</nombre>
              <curso>1</curso>
              <horasSemanales>5</horasSemanales>
              <ciclo>ASIR</ciclo>
          </modulo>
          <modulo id="0373">
              <nombre>Lenguajes de marcas y sistemas de gestión de
              información</nombre>
              <curso>1</curso>
              <horasSemanales>3</horasSemanales>
              <ciclo>ASIR</ciclo>
              <ciclo>DAM</ciclo>
          </modulo>
          <modulo id="0376">
              <nombre>Implantación de aplicaciones web</nombre>
              <curso>2</curso>
              <horasSemanales>5</horasSemanales>
              <ciclo>ASIR</ciclo>
          </modulo>
      </modulos>
   </ies>
   ```

   - Nombre de los módulos del ciclo "Sistemas Microinformáticos y Redes" (en la expresión final no deben aparecer las siglas SMR):

     `/ies/modulos/modulo[ciclo = 'SMR']/nombre/text()`

   - Nombre de los ciclos que incluyen el módulo "Lenguajes de marcas y sistemas de gestión de información":

     `/ies/ciclos/ciclo[@id = /ies/modulos/modulo[nombre = 'Lenguajes de marcas y sistemas de gestión de información']/ciclo]/nombre`

   - Nombre de los módulos de ciclos de Grado Superior:

     `/ies/modulos/modulo[ciclo = /ies/ciclos/ciclo[grado = 'Superior']/@id]/nombre`

   - Nombre de los módulos de ciclos cuyo título se aprobó en 2008:

     `/ies/modulos/modulo[ciclo = /ies/ciclos/ciclo[decretoTitulo/@año = '2008']/@id]/nombre/text()`

   - Grado de los ciclos con módulos de primer curso:

     `/ies/ciclos/ciclo[@id = /ies/modulos/modulo[curso = 1]/ciclo]/grado/text()`
