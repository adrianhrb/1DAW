---Realizamos la carga de la BBDD de sakila desde MySQL:
SOURCE /tmp/sakila-db/sakila-schema.sql;
SOURCE /tmp/sakila-db/sakila-schema-data.sql;
---Realiza cada una de las siguientes consultas:

---Actores que tienen de primer nombre Scarlett.
select * from actor where first_name = "Scarlett";
/* +----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+ */

---Actores que tienen de apellido Johansson.
select * from actor where last_name = "Johansson";
/* +----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+ */

---Actores que contengan una O en su nombre.
select * from actor where first_name regexp 'o';
/* +----------+-------------+--------------+---------------------+
| actor_id | first_name  | last_name    | last_update         |
+----------+-------------+--------------+---------------------+
|        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
|       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
|       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
|       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
|       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
|       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
|       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
|      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
|      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
|      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
|      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
|      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
|      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
|      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
|      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
|      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
|      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
|      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
|      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
|      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
|      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
|      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
|      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
+----------+-------------+--------------+---------------------+ */

---Actores que contengan una O en su nombre y en una A en su apellido.
select * from actor where first_name regexp 'o' and last_name regexp 'a'; 
/* +----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
|      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
|      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
|      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
|      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
|      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+ */

---Actores que contengan dos O en su nombre y en una A en su apellido.
select * from actor where first_name like '%o%o%' and last_name regexp 'a';
/* +----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA   | 2006-02-15 04:34:33 |
|      172 | GROUCHO    | WILLIAMS  | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+ */


---Actores donde su tercera letra sea B.
select * from actor where first_name regexp '^..b';
/* +----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
|      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
|      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
|      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
|      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+ */

---Ciudades que empiezan por a.
select * from city where city regexp '^A';
/* +---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|       2 | Abha                    |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
|       4 | Acuña                   |         60 | 2006-02-15 04:45:25 |
|       5 | Adana                   |         97 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
|       7 | Aden                    |        107 | 2006-02-15 04:45:25 |
|       8 | Adoni                   |         44 | 2006-02-15 04:45:25 |
|       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
|      10 | Akishima                |         50 | 2006-02-15 04:45:25 |
|      11 | Akron                   |        103 | 2006-02-15 04:45:25 |
|      12 | al-Ayn                  |        101 | 2006-02-15 04:45:25 |
|      13 | al-Hawiya               |         82 | 2006-02-15 04:45:25 |
|      14 | al-Manama               |         11 | 2006-02-15 04:45:25 |
|      15 | al-Qadarif              |         89 | 2006-02-15 04:45:25 |
|      16 | al-Qatif                |         82 | 2006-02-15 04:45:25 |
|      17 | Alessandria             |         49 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
|      19 | Allende                 |         60 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
|      21 | Alvorada                |         15 | 2006-02-15 04:45:25 |
|      22 | Ambattur                |         44 | 2006-02-15 04:45:25 |
|      23 | Amersfoort              |         67 | 2006-02-15 04:45:25 |
|      24 | Amroha                  |         44 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                |         15 | 2006-02-15 04:45:25 |
|      27 | Antofagasta             |         22 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
|      29 | Apeldoorn               |         67 | 2006-02-15 04:45:25 |
|      30 | Araçatuba               |         15 | 2006-02-15 04:45:25 |
|      31 | Arak                    |         46 | 2006-02-15 04:45:25 |
|      32 | Arecibo                 |         77 | 2006-02-15 04:45:25 |
|      33 | Arlington               |        103 | 2006-02-15 04:45:25 |
|      34 | Ashdod                  |         48 | 2006-02-15 04:45:25 |
|      35 | Ashgabat                |         98 | 2006-02-15 04:45:25 |
|      36 | Ashqelon                |         48 | 2006-02-15 04:45:25 |
|      37 | Asunción                |         73 | 2006-02-15 04:45:25 |
|      38 | Athenai                 |         39 | 2006-02-15 04:45:25 |
|      39 | Atšinsk                 |         80 | 2006-02-15 04:45:25 |
|      40 | Atlixco                 |         60 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
|      42 | Aurora                  |        103 | 2006-02-15 04:45:25 |
|      43 | Avellaneda              |          6 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+ */

---Ciudades que acaban por s.
select * from city where city regexp 's$';
/* +---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis                   |         15 | 2006-02-15 04:45:25 |
|      79 | Bilbays                    |         29 | 2006-02-15 04:45:25 |
|     102 | Caracas                    |        104 | 2006-02-15 04:45:25 |
|     118 | Ciomas                     |         45 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     125 | Coatzacoalcos              |         60 | 2006-02-15 04:45:25 |
|     135 | Dallas                     |        103 | 2006-02-15 04:45:25 |
|     137 | Daugavpils                 |         54 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     221 | Imus                       |         75 | 2006-02-15 04:45:25 |
|     238 | Jelets                     |         80 | 2006-02-15 04:45:25 |
|     266 | Kilis                      |         97 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     330 | Matamoros                  |         60 | 2006-02-15 04:45:25 |
|     333 | Memphis                    |        103 | 2006-02-15 04:45:25 |
|     391 | Ozamis                     |         75 | 2006-02-15 04:45:25 |
|     401 | Patras                     |         39 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     424 | Quilmes                    |          6 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     442 | Saint-Denis                |         79 | 2006-02-15 04:45:25 |
|     446 | Salinas                    |        103 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     482 | Sivas                      |         97 | 2006-02-15 04:45:25 |
|     497 | Springs                    |         85 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     529 | Tarsus                     |         97 | 2006-02-15 04:45:25 |
|     570 | Vilnius                    |         56 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+ */

---Ciudades del country 61.
select * from city where country_id = 61;
/* +---------+----------+------------+---------------------+
| city_id | city     | country_id | last_update         |
+---------+----------+------------+---------------------+
|     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
+---------+----------+------------+---------------------+ */

---Ciudades del country Spain.
select ci.city from city as ci join country as co where co.country_id = ci.country_id and country = 'Spain';
/* +-------------------------+
| city                    |
+-------------------------+
| A Coruña (La Coruña)    |
| Donostia-San Sebastián  |
| Gijón                   |
| Ourense (Orense)        |
| Santiago de Compostela  |
+-------------------------+ */

---Ciudades con nombres compuestos.
select * from city where city regexp ' ';
/* +---------+----------------------------+------------+---------------------+
| city_id | city                       | country_id | last_update         |
+---------+----------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)       |         87 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi                  |        101 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba                |         31 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)      |         44 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown            |          6 | 2006-02-15 04:45:25 |
|      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
|      28 | Aparecida de Goiânia       |         15 | 2006-02-15 04:45:25 |
|      41 | Augusta-Richmond County    |        103 | 2006-02-15 04:45:25 |
|      45 | Bahía Blanca               |          6 | 2006-02-15 04:45:25 |
|      53 | Bandar Seri Begawan        |         16 | 2006-02-15 04:45:25 |
|      57 | Bat Yam                    |         48 | 2006-02-15 04:45:25 |
|      69 | Benin City                 |         69 | 2006-02-15 04:45:25 |
|      71 | Berhampore (Baharampur)    |         44 | 2006-02-15 04:45:25 |
|      84 | Boa Vista                  |         15 | 2006-02-15 04:45:25 |
|     100 | Cam Ranh                   |        105 | 2006-02-15 04:45:25 |
|     101 | Cape Coral                 |        103 | 2006-02-15 04:45:25 |
|     111 | Charlotte Amalie           |        106 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
|     121 | Città del Vaticano         |         41 | 2006-02-15 04:45:25 |
|     122 | Ciudad del Este            |         73 | 2006-02-15 04:45:25 |
|     124 | Coacalco de Berriozábal    |         60 | 2006-02-15 04:45:25 |
|     141 | Deba Habe                  |         69 | 2006-02-15 04:45:25 |
|     144 | Dhule (Dhulia)             |         44 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián     |         87 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
|     153 | El Alto                    |         14 | 2006-02-15 04:45:25 |
|     154 | El Fuerte                  |         60 | 2006-02-15 04:45:25 |
|     155 | El Monte                   |        103 | 2006-02-15 04:45:25 |
|     177 | Garden Grove               |        103 | 2006-02-15 04:45:25 |
|     185 | Grand Prairie              |        103 | 2006-02-15 04:45:25 |
|     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
|     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
|     233 | Jalib al-Shuyukh           |         53 | 2006-02-15 04:45:25 |
|     246 | José Azueta                |         60 | 2006-02-15 04:45:25 |
|     247 | Juazeiro do Norte          |         15 | 2006-02-15 04:45:25 |
|     248 | Juiz de Fora               |         15 | 2006-02-15 04:45:25 |
|     262 | Kansas City                |        103 | 2006-02-15 04:45:25 |
|     279 | Kowloon and New Kowloon    |         42 | 2006-02-15 04:45:25 |
|     288 | La Paz                     |         60 | 2006-02-15 04:45:25 |
|     289 | La Plata                   |          6 | 2006-02-15 04:45:25 |
|     290 | La Romana                  |         27 | 2006-02-15 04:45:25 |
|     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
|     324 | Mandi Bahauddin            |         72 | 2006-02-15 04:45:25 |
|     337 | Mit Ghamr                  |         29 | 2006-02-15 04:45:25 |
|     346 | Munger (Monghyr)           |         44 | 2006-02-15 04:45:25 |
|     352 | Nabereznyje Tšelny         |         80 | 2006-02-15 04:45:25 |
|     358 | Nakhon Sawan               |         94 | 2006-02-15 04:45:25 |
|     359 | Nam Dinh                   |        105 | 2006-02-15 04:45:25 |
|     366 | Nha Trang                  |        105 | 2006-02-15 04:45:25 |
|     368 | Novi Sad                   |        108 | 2006-02-15 04:45:25 |
|     373 | Ocumare del Tuy            |        104 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)           |         87 | 2006-02-15 04:45:25 |
|     393 | Pachuca de Soto            |         60 | 2006-02-15 04:45:25 |
|     394 | Pak Kret                   |         94 | 2006-02-15 04:45:25 |
|     395 | Palghat (Palakkad)         |         44 | 2006-02-15 04:45:25 |
|     396 | Pangkal Pinang             |         45 | 2006-02-15 04:45:25 |
|     406 | Phnom Penh                 |         18 | 2006-02-15 04:45:25 |
|     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
|     418 | Purnea (Purnia)            |         44 | 2006-02-15 04:45:25 |
|     425 | Rae Bareli                 |         44 | 2006-02-15 04:45:25 |
|     430 | Richmond Hill              |         20 | 2006-02-15 04:45:25 |
|     431 | Rio Claro                  |         15 | 2006-02-15 04:45:25 |
|     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
|     449 | San Bernardino             |        103 | 2006-02-15 04:45:25 |
|     450 | San Felipe de Puerto Plata |         27 | 2006-02-15 04:45:25 |
|     451 | San Felipe del Progreso    |         60 | 2006-02-15 04:45:25 |
|     452 | San Juan Bautista Tuxtepec |         60 | 2006-02-15 04:45:25 |
|     453 | San Lorenzo                |         73 | 2006-02-15 04:45:25 |
|     454 | San Miguel de Tucumán      |          6 | 2006-02-15 04:45:25 |
|     456 | Santa Brbara dOeste        |         15 | 2006-02-15 04:45:25 |
|     457 | Santa Fé                   |          6 | 2006-02-15 04:45:25 |
|     458 | Santa Rosa                 |         75 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela     |         87 | 2006-02-15 04:45:25 |
|     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
|     461 | Santo André                |         15 | 2006-02-15 04:45:25 |
|     467 | Shahr-e Kord               |         46 | 2006-02-15 04:45:25 |
|     476 | Shubra al-Khayma           |         29 | 2006-02-15 04:45:25 |
|     478 | Siliguri (Shiliguri)       |         44 | 2006-02-15 04:45:25 |
|     485 | São Bernardo do Campo      |         15 | 2006-02-15 04:45:25 |
|     486 | São Leopoldo               |         15 | 2006-02-15 04:45:25 |
|     493 | South Hill                 |          5 | 2006-02-15 04:45:25 |
|     498 | Stara Zagora               |         17 | 2006-02-15 04:45:25 |
|     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
|     507 | Sungai Petani              |         59 | 2006-02-15 04:45:25 |
|     533 | Tel Aviv-Jaffa             |         48 | 2006-02-15 04:45:25 |
|     562 | Valle de la Pascua         |        104 | 2006-02-15 04:45:25 |
|     563 | Valle de Santiago          |         60 | 2006-02-15 04:45:25 |
|     566 | Varanasi (Benares)         |         44 | 2006-02-15 04:45:25 |
|     567 | Vicente López              |          6 | 2006-02-15 04:45:25 |
|     569 | Vila Velha                 |         15 | 2006-02-15 04:45:25 |
|     572 | Vitória de Santo Antão     |         15 | 2006-02-15 04:45:25 |
|     582 | Yamuna Nagar               |         44 | 2006-02-15 04:45:25 |
+---------+----------------------------+------------+---------------------+ */

---Películas con una duración entre 80 y 100.
select title, length from film where length between 80 and 100;
+-------------------------+--------+
| title                   | length |
/* +-------------------------+--------+
| ACADEMY DINOSAUR        |     86 |
| ALICE FANTASIA          |     94 |
| ALONE TRIP              |     82 |
| AMISTAD MIDSUMMER       |     85 |
| ANACONDA CONFESSIONS    |     92 |
| ANNIE IDENTITY          |     86 |
| ANTHEM LUKE             |     91 |
| ANYTHING SAVANNAH       |     82 |
| APACHE DIVINE           |     92 |
| ARMAGEDDON LOST         |     99 |
| ATTRACTION NEWTON       |     83 |
| BANG KWAI               |     87 |
| BASIC EASY              |     90 |
| BEAST HUNCHBACK         |     89 |
| BEHAVIOR RUNAWAY        |    100 |
| BEVERLY OUTLAW          |     85 |
| BILKO ANONYMOUS         |    100 |
| BILL OTHERS             |     93 |
| BLACKOUT PRIVATE        |     85 |
| BOUND CHEAPER           |     98 |
| BUTTERFLY CHOCOLAT      |     89 |
| CANYON STOCK            |     85 |
| CARIBBEAN LIBERTY       |     92 |
| CASABLANCA SUPER        |     85 |
| CHEAPER CLYDE           |     87 |
| CIRCUS YOUTH            |     90 |
| CLASH FREDDY            |     81 |
| CLUELESS BUCKET         |     95 |
| CONGENIALITY QUEST      |     87 |
| CORE SUIT               |     92 |
| DAISY MENAGERIE         |     84 |
| DARES PLUTO             |     89 |
| DARKNESS WAR            |     99 |
| DELIVERANCE MULHOLLAND  |    100 |
| DESPERATE TRAINSPOTTING |     81 |
| DETAILS PACKER          |     88 |
| DEVIL DESIRE            |     87 |
| DISTURBING SCARFACE     |     94 |
| DIVINE RESURRECTION     |    100 |
| DRUMS DYNAMITE          |     96 |
| EARLY HOME              |     96 |
| EARRING INSTINCT        |     98 |
| EARTH VISION            |     85 |
| EGYPT TENENBAUMS        |     85 |
| ENCOUNTERS CURTAIN      |     92 |
| ENDING CROWDS           |     85 |
| EXPENDABLE STALLION     |     97 |
| FATAL HAUNTED           |     91 |
| FEUD FROGMEN            |     98 |
| FIGHT JAWBREAKER        |     91 |
| FLAMINGOS CONNECTICUT   |     80 |
| FLATLINERS KILLER       |    100 |
| FORWARD TEMPLE          |     90 |
| FRENCH HOLIDAY          |     99 |
| FROST HEAD              |     82 |
| FUGITIVE MAGUIRE        |     83 |
| FULL FLATLINERS         |     94 |
| GANDHI KWAI             |     86 |
| GARDEN ISLAND           |     80 |
| GHOST GROUNDHOG         |     85 |
| GLEAMING JAWBREAKER     |     89 |
| GOLDFINGER SENSIBILITY  |     93 |
| GONE TROUBLE            |     84 |
.................................... */

---Peliculas con un rental_rate entre 1 y 3.
select title, rental_rate from film where rental_rate between 1 and 3;
/* +-----------------------------+-------------+
| title                       | rental_rate |
+-----------------------------+-------------+
| ADAPTATION HOLES            |        2.99 |
| AFFAIR PREJUDICE            |        2.99 |
| AFRICAN EGG                 |        2.99 |
| AGENT TRUMAN                |        2.99 |
| ALABAMA DEVIL               |        2.99 |
| ALIEN CENTER                |        2.99 |
| ALLEY EVOLUTION             |        2.99 |
| AMISTAD MIDSUMMER           |        2.99 |
| ANALYZE HOOSIERS            |        2.99 |
| ANGELS LIFE                 |        2.99 |
| ANTITRUST TOMATOES          |        2.99 |
| ANYTHING SAVANNAH           |        2.99 |
| APOLLO TEEN                 |        2.99 |
| ARACHNOPHOBIA ROLLERCOASTER |        2.99 |
| ARIZONA BANG                |        2.99 |
| ARTIST COLDBLOODED          |        2.99 |
| ATLANTIS CAUSE              |        2.99 |
| BADMAN DAWN                 |        2.99 |
| BAKED CLEOPATRA             |        2.99 |
| BALLOON HOMEWARD            |        2.99 |
| BANG KWAI                   |        2.99 |
| BARBARELLA STREETCAR        |        2.99 |
| BAREFOOT MANCHURIAN         |        2.99 |
| BASIC EASY                  |        2.99 |
| BEACH HEARTBREAKERS         |        2.99 |
| BEAR GRACELAND              |        2.99 |
| BED HIGHBALL                |        2.99 |
| BERETS AGENT                |        2.99 |
| BEVERLY OUTLAW              |        2.99 |
| BILL OTHERS                 |        2.99 |
| BINGO TALENTED              |        2.99 |
| BLACKOUT PRIVATE            |        2.99 |
| BLANKET BEVERLY             |        2.99 |
...............................................*/

---Películas con un titulo de más de 12 letras.
select title from film where length(title) >= 12;
/* +-----------------------------+
| title                       |
+-----------------------------+
| ACADEMY DINOSAUR            |
| ACE GOLDFINGER              |
| ADAPTATION HOLES            |
| AFFAIR PREJUDICE            |
| AGENT TRUMAN                |
| AIRPLANE SIERRA             |
| AIRPORT POLLOCK             |
| ALABAMA DEVIL               |
| ALADDIN CALENDAR            |
| ALAMO VIDEOTAPE             |
| ALASKA PHANTOM              |
| ALICE FANTASIA              |
| ALIEN CENTER                |
| ALLEY EVOLUTION             |
| ALTER VICTORY               |
| AMADEUS HOLY                |
| AMELIE HELLFIGHTERS         |
| AMERICAN CIRCUS             |
| AMISTAD MIDSUMMER           |
| ANACONDA CONFESSIONS        |
| ANALYZE HOOSIERS            |
| ANNIE IDENTITY              |
| ANONYMOUS HUMAN             |
| ANTITRUST TOMATOES          |
| ANYTHING SAVANNAH           |
| APACHE DIVINE               |
| APOCALYPSE FLAMINGOS        |
| ARABIA DOGMA                |
| ARACHNOPHOBIA ROLLERCOASTER |
| ARGONAUTS TOWN              |
| ARIZONA BANG                |
| ARK RIDGEMONT               |
| ARMAGEDDON LOST             |
| ARMY FLINTSTONES            |
| ARSENIC INDEPENDENCE        |
| ARTIST COLDBLOODED          |
| ATLANTIS CAUSE              |
| ATTACKS HATE                |
| ATTRACTION NEWTON           |
| BACKLASH UNDEFEATED         |
| BAKED CLEOPATRA             |
| BALLOON HOMEWARD            |
| BALLROOM MOCKINGBIRD        |
| BANGER PINOCCHIO            |
| BARBARELLA STREETCAR        |
| BAREFOOT MANCHURIAN         |
| BEACH HEARTBREAKERS         |
| BEAR GRACELAND              |
| BEAST HUNCHBACK             |
| BEAUTY GREASE               |
| BED HIGHBALL                |
| BEDAZZLED MARRIED           |
| BEETHOVEN EXORCIST          |
| BEHAVIOR RUNAWAY            |
| BENEATH RUSH                |
| BERETS AGENT                |
| BETRAYED REAR               |
| BEVERLY OUTLAW              |
| BIKINI BORROWERS            |
| BILKO ANONYMOUS             |
| BINGO TALENTED              |
| BIRCH ANTITRUST             |
| BIRD INDEPENDENCE           |
| BIRDCAGE CASPER             |
| BIRDS PERDITION             |
| BLACKOUT PRIVATE            |
| BLADE POLISH                |
| BLANKET BEVERLY             |
| BLINDNESS GUN               |
| BLOOD ARGONAUTS             |
| BLUES INSTINCT              |
| BOILED DARES                |
| BONNIE HOLOCAUST            |
| BOOGIE AMELIE               |
| BOONDOCK BALLROOM           |
| BORROWERS BEDAZZLED         |
| BOULEVARD MOB               |
| BOUND CHEAPER               |
| BOWFINGER GABLES            |
| BRANNIGAN SUNRISE           |
| BRAVEHEART HUMAN            |
................................. */

---Peliculas con un rating de PG o G.
select title from film where rating = 'PG' or rating = 'G';
/* +---------------------------+
| title                     |
+---------------------------+
| ACADEMY DINOSAUR          |
| ACE GOLDFINGER            |
| AFFAIR PREJUDICE          |
| AFRICAN EGG               |
| AGENT TRUMAN              |
| ALAMO VIDEOTAPE           |
| ALASKA PHANTOM            |
| ALI FOREVER               |
| AMADEUS HOLY              |
| AMISTAD MIDSUMMER         |
| ANGELS LIFE               |
| ANNIE IDENTITY            |
| ARIZONA BANG              |
| ARMAGEDDON LOST           |
| ARSENIC INDEPENDENCE      |
| ATLANTIS CAUSE            |
| AUTUMN CROW               |
| BAKED CLEOPATRA           |
| BALLROOM MOCKINGBIRD      |
| BARBARELLA STREETCAR      |
| BAREFOOT MANCHURIAN       |
| BEACH HEARTBREAKERS       |
| BEAUTY GREASE             |
| BEDAZZLED MARRIED         |
| BEHAVIOR RUNAWAY          |
| BILL OTHERS               |
| BIRCH ANTITRUST           |
| BIRD INDEPENDENCE         |
| BIRDS PERDITION           |
| BLACKOUT PRIVATE          |
| BLANKET BEVERLY           |
| BLOOD ARGONAUTS           |
| BLUES INSTINCT            |
| BOILED DARES              |
| BONNIE HOLOCAUST          |
| BORN SPINAL               |
| BORROWERS BEDAZZLED       |
............................. */

---Peliculas que no tengan un rating de NC-17.
select title from film where rating = 'PG' or rating = 'G';
/* +---------------------------+
| title                     |
+---------------------------+
| ACADEMY DINOSAUR          |
| ACE GOLDFINGER            |
| AFFAIR PREJUDICE          |
| AFRICAN EGG               |
| AGENT TRUMAN              |
| ALAMO VIDEOTAPE           |
| ALASKA PHANTOM            |
| ALI FOREVER               |
| AMADEUS HOLY              |
| AMISTAD MIDSUMMER         |
| ANGELS LIFE               |
| ANNIE IDENTITY            |
| ARIZONA BANG              |
| ARMAGEDDON LOST           |
| ARSENIC INDEPENDENCE      |
| ATLANTIS CAUSE            |
| AUTUMN CROW               |
| BAKED CLEOPATRA           |
| BALLROOM MOCKINGBIRD      |
| BARBARELLA STREETCAR      |
| BAREFOOT MANCHURIAN       |
| BEACH HEARTBREAKERS       |
| BEAUTY GREASE             |
| BEDAZZLED MARRIED         |
| BEHAVIOR RUNAWAY          |
| BILL OTHERS               |
| BIRCH ANTITRUST           |
.................................. */

---Peliculas con un rating PG y duracion de más de 120.
mysql> select title, rating, length from film where rating = 'PG' and length > 120;
/* +-----------------------+--------+--------+
| title                 | rating | length |
+-----------------------+--------+--------+
| AGENT TRUMAN          | PG     |    169 |
| ALASKA PHANTOM        | PG     |    136 |
| ALI FOREVER           | PG     |    150 |
| ARIZONA BANG          | PG     |    121 |
| ARSENIC INDEPENDENCE  | PG     |    137 |
| BIRCH ANTITRUST       | PG     |    162 |
| BORN SPINAL           | PG     |    179 |
| BRANNIGAN SUNRISE     | PG     |    121 |
| BRINGING HYSTERICAL   | PG     |    136 |
| BUCKET BROTHERHOOD    | PG     |    133 |
| CAROL TEXAS           | PG     |    151 |
| CENTER DINOSAUR       | PG     |    152 |
| CHICKEN HELLFIGHTERS  | PG     |    122 |
| CHILL LUCK            | PG     |    142 |
| COWBOY DOOM           | PG     |    146 |
| CRAZY HOME            | PG     |    136 |
| CYCLONE FAMILY        | PG     |    176 |
| DANGEROUS UPTOWN      | PG     |    121 |
| DISCIPLE MOTHER       | PG     |    141 |
| DREAM PICKUP          | PG     |    135 |
| DYING MAKER           | PG     |    168 |
| EVERYONE CRAFT        | PG     |    163 |
| FERRIS MOTHER         | PG     |    142 |
| FIREBALL PHILADELPHIA | PG     |    148 |
| FOOL MOCKINGBIRD      | PG     |    158 |
| GABLES METROPOLIS     | PG     |    161 |
| GLADIATOR WESTWARD    | PG     |    173 |
| GREEK EVERYONE        | PG     |    176 |
| GRIT CLOCKWORK        | PG     |    137 |
| HOLES BRANNIGAN       | PG     |    128 |
| HYSTERICAL GRAIL      | PG     |    150 |
| JEDI BENEATH          | PG     |    128 |
| KENTUCKIAN GIANT      | PG     |    169 |
| LIAISONS SWEET        | PG     |    140 |
| MAIDEN HOME           | PG     |    138 |
| MAJESTIC FLOATS       | PG     |    130 |
| MALLRATS UNITED       | PG     |    133 |
| MANCHURIAN CURTAIN    | PG     |    177 |
| MASSAGE IMAGE         | PG     |    161 |
| MIGHTY LUCK           | PG     |    122 |
| MONEY HAROLD          | PG     |    135 |
| MONSOON CAUSE         | PG     |    182 |
| MOTIONS DETAILS       | PG     |    166 |
| MOURNING PURPLE       | PG     |    146 |
| MULHOLLAND BEAST      | PG     |    157 |
| MURDER ANTITRUST      | PG     |    166 |
..........................................*/

---¿Cuantos actores hay?
select count(*) from actor;
/* +----------+
| count(*) |
+----------+
|      200 |
+----------+ */

---¿Cuántas ciudades tiene el country Spain?
select count(ci.city) from city as ci join country as co where co.country_id = ci.country_id and country = 'Spain';
/* +----------------+
| count(ci.city) |
+----------------+
|              5 |
+----------------+ */

---¿Cuántos countries hay que empiezan por a?
select country from country where country regexp '^A';
/* +----------------+
| country        |
+----------------+
| Afghanistan    |
| Algeria        |
| American Samoa |
| Angola         |
| Anguilla       |
| Argentina      |
| Armenia        |
| Australia      |
| Austria        |
| Azerbaijan     |
+----------------+ */

---Media de duración de peliculas con PG.
select avg(length) from film;
/* +-------------+
| avg(length) |
+-------------+
|    115.2720 |
+-------------+ */

---Suma de rental_rate de todas las peliculas.
select sum(rental_rate) from film;
/* +------------------+
| sum(rental_rate) |
+------------------+
|          2980.00 |
+------------------+ */

---Pelicula con mayor duración.
select title, length from film order by length desc LIMIT 1;
/* +---------------+--------+
| title         | length |
+---------------+--------+
| CHICAGO NORTH |    185 |
+---------------+--------+ */

---Película con menor duración.
select title, length from film order by length ASC LIMIT 1;
/* +--------------+--------+
| title        | length |
+--------------+--------+
| ALIEN CENTER |     46 |
+--------------+--------+ */

---Mostrar las ciudades del country Spain (multitabla).
select ci.city from city as ci join country as co where co.country_id = ci.country_id and country = 'Spain'
---Mostrar el nombre de la película y el nombre de los actores.
mysql> Select f.title, a.first_name from film as f join actor as a join film_actor as fa on f.film_id = fa.film_id and fa.actor_id = a.actor_id LIMIT 20;
/* +-----------------------+------------+
| title                 | first_name |
+-----------------------+------------+
| ACADEMY DINOSAUR      | PENELOPE   |
| ANACONDA CONFESSIONS  | PENELOPE   |
| ANGELS LIFE           | PENELOPE   |
| BULWORTH COMMANDMENTS | PENELOPE   |
| CHEAPER CLYDE         | PENELOPE   |
| COLOR PHILADELPHIA    | PENELOPE   |
| ELEPHANT TROJAN       | PENELOPE   |
| GLEAMING JAWBREAKER   | PENELOPE   |
| HUMAN GRAFFITI        | PENELOPE   |
| KING EVOLUTION        | PENELOPE   |
| LADY STAGE            | PENELOPE   |
| LANGUAGE COWBOY       | PENELOPE   |
| MULHOLLAND BEAST      | PENELOPE   |
| OKLAHOMA JUMANJI      | PENELOPE   |
| RULES HUMAN           | PENELOPE   |
| SPLASH GUMP           | PENELOPE   |
| VERTIGO NORTHWEST     | PENELOPE   |
| WESTWARD SEABISCUIT   | PENELOPE   |
| WIZARD COLDBLOODED    | PENELOPE   |
| ADAPTATION HOLES      | NICK       |
+-----------------------+------------+ */

---Mostrar el nombre de la película y el de sus categorías.
select f.title, c.name from film as f join film_category as fc join category as c on f.film_id = fc.film_id and fc.category_id = c.category_id LIMIT 20;
/* +---------------------+--------+
| title               | name   |
+---------------------+--------+
| AMADEUS HOLY        | Action |
| AMERICAN CIRCUS     | Action |
| ANTITRUST TOMATOES  | Action |
| ARK RIDGEMONT       | Action |
| BAREFOOT MANCHURIAN | Action |
| BERETS AGENT        | Action |
| BRIDE INTRIGUE      | Action |
| BULL SHAWSHANK      | Action |
| CADDYSHACK JEDI     | Action |
| CAMPUS REMEMBER     | Action |
| CASUALTIES ENCINO   | Action |
| CELEBRITY HORN      | Action |
| CLUELESS BUCKET     | Action |
| CROW GREASE         | Action |
| DANCES NONE         | Action |
| DARKO DORADO        | Action |
| DARN FORRESTER      | Action |
| DEVIL DESIRE        | Action |
| DRAGON SQUAD        | Action |
| DREAM PICKUP        | Action |
+---------------------+--------+ */

---Mostrar el country, la ciudad y dirección de cada miembro del staff.
select co.country, ci.city, ad.address, s.first_name from country as co join city as ci join address as ad join staff as s on co.country_id = ci.country_id and ci.city_id = ad.city_id and ad.address_id = s.address_id;
/* +-----------+------------+----------------------+------------+
| country   | city       | address              | first_name |
+-----------+------------+----------------------+------------+
| Canada    | Lethbridge | 23 Workhaven Lane    | Mike       |
| Australia | Woodridge  | 1411 Lillydale Drive | Jon        |
+-----------+------------+----------------------+------------+
*/

---Mostrar el country, la ciudad y dirección de cada customer.
select co.country, ad.address, ci.city, cu.first_name from customer as cu join address as ad join city as ci join country as co on cu.address_id = ad.address_id and ad.city_id = ci.city_id and ci.country_id = co.country_id LIMIT 15;
/* +----------------+-------------------------------+-----------------+------------+
| country        | address                       | city            | first_name |
+----------------+-------------------------------+-----------------+------------+
| Afghanistan    | 1168 Najafabad Parkway        | Kabul           | VERA       |
| Algeria        | 1924 Shimonoseki Drive        | Batna           | MARIO      |
| Algeria        | 1031 Daugavpils Parkway       | Béchar          | JUDY       |
| Algeria        | 757 Rustenburg Avenue         | Skikda          | JUNE       |
| American Samoa | 1892 Nabereznyje Telny Lane   | Tafuna          | ANTHONY    |
| Angola         | 486 Ondo Parkway              | Benguela        | CLAUDE     |
| Angola         | 368 Hunuco Boulevard          | Namibe          | MARTIN     |
| Anguilla       | 1368 Maracabo Boulevard       | South Hill      | BOBBY      |
| Argentina      | 1623 Kingstown Drive          | Almirante Brown | WILLIE     |
| Argentina      | 1229 Varanasi (Benares) Manor | Avellaneda      | JORDAN     |
| Argentina      | 1427 A Corua (La Corua) Place | Bahía Blanca    | JASON      |
| Argentina      | 96 Tafuna Way                 | Córdoba         | KIMBERLY   |
| Argentina      | 203 Tambaram Street           | Escobar         | MICHEAL    |
| Argentina      | 166 Jinchang Street           | Ezeiza          | DARRYL     |
| Argentina      | 1926 El Alto Avenue           | La Plata        | JULIA      |
+----------------+-------------------------------+-----------------+------------+ */

---Numero de películas de cada rating
select count(film_id), rating from film group by rating;
/* +----------------+--------+
| count(film_id) | rating |
+----------------+--------+
|            194 | PG     |
|            178 | G      |
|            210 | NC-17  |
|            223 | PG-13  |
|            195 | R      |
+----------------+--------+ */

---Cuantas películas ha realizado el actor ED CHASE.
select count(fi.title), a.first_name from actor as a join film_actor as fa join film as fi on
a.actor_id = fa.actor_id and fa.film_id = fi.film_id and a.first_name = "Ed" and last_name = "Chase";
/* +-----------------+------------+
| count(fi.title) | first_name |
+-----------------+------------+
|              22 | ED         |
+-----------------+------------+ */

---Media de duración de las películas cada categoría.
select avg(fi.length), ca.name from film as fi join film_category as fc join category as ca on
 fi.film_id = fc.film_id and fc.category_id = ca.category_id group by ca.name;
/* +----------------+-------------+
| avg(fi.length) | name        |
+----------------+-------------+
|       111.6094 | Action      |
|       111.0152 | Animation   |
|       109.8000 | Children    |
|       111.6667 | Classics    |
|       115.8276 | Comedy      |
|       108.7500 | Documentary |
|       120.8387 | Drama       |
|       114.7826 | Family      |
|       121.6986 | Foreign     |
|       127.8361 | Games       |
|       112.4821 | Horror      |
|       113.6471 | Music       |
|       111.1270 | New         |
|       108.1967 | Sci-Fi      |
|       128.2027 | Sports      |
|       113.3158 | Travel      |
+----------------+-------------+ */


--- Muestra el resultado de las vistas que se proporcionan:
select * from customer_list LIMIT 10;
/* +-----+------------------+-------------------------------+----------+--------------+-----------------+----------------+--------+-----+
| ID  | name             | address                       | zip code | phone        | city            | country        | notes  | SID |
+-----+------------------+-------------------------------+----------+--------------+-----------------+----------------+--------+-----+
| 218 | VERA MCCOY       | 1168 Najafabad Parkway        | 40301    | 886649065861 | Kabul           | Afghanistan    | active |   1 |
| 441 | MARIO CHEATHAM   | 1924 Shimonoseki Drive        | 52625    | 406784385440 | Batna           | Algeria        | active |   1 |
|  69 | JUDY GRAY        | 1031 Daugavpils Parkway       | 59025    | 107137400143 | Béchar          | Algeria        | active |   2 |
| 176 | JUNE CARROLL     | 757 Rustenburg Avenue         | 89668    | 506134035434 | Skikda          | Algeria        | active |   1 |
| 320 | ANTHONY SCHWAB   | 1892 Nabereznyje Telny Lane   | 28396    | 478229987054 | Tafuna          | American Samoa | active |   2 |
| 528 | CLAUDE HERZOG    | 486 Ondo Parkway              | 35202    | 105882218332 | Benguela        | Angola         | active |   1 |
| 383 | MARTIN BALES     | 368 Hunuco Boulevard          | 17165    | 106439158941 | Namibe          | Angola         | active |   1 |
| 381 | BOBBY BOUDREAU   | 1368 Maracabo Boulevard       | 32716    | 934352415130 | South Hill      | Anguilla       | active |   2 |
| 359 | WILLIE MARKHAM   | 1623 Kingstown Drive          | 91299    | 296394569728 | Almirante Brown | Argentina      | active |   2 |
| 560 | JORDAN ARCHULETA | 1229 Varanasi (Benares) Manor | 40195    | 817740355461 | Avellaneda      | Argentina      | active |   1 |
+-----+------------------+-------------------------------+----------+--------------+-----------------+----------------+--------+-----+ */

select * from film_list LIMIT 10;
/* +-----+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------+-------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------+
| FID | title            | description                                                                                                           | category    | price | length | rating | actors                                                                                                                                         |
+-----+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------+-------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------+
|   1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      | Documentary |  0.99 |     86 | PG     | CHRISTIAN GABLE, LUCILLE TRACY, SANDRA PECK, JOHNNY CAGE, MENA TEMPLE, WARREN NOLTE, OPRAH KILMER, ROCK DUKAKIS, MARY KEITEL, PENELOPE GUINESS |
|   2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  | Horror      |  4.99 |     48 | G      | CHRIS DEPP, SEAN GUINESS, MINNIE ZELLWEGER, BOB FAWCETT                                                                                        |
|   3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      | Documentary |  2.99 |     50 | NC-17  | NICK WAHLBERG, BOB FAWCETT, CAMERON STREEP, RAY JOHANSSON, JULIANNE DENCH                                                                      |
|   4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          | Horror      |  2.99 |    117 | G      | JODIE DEGENERES, SCARLETT DAMON, KENNETH PESCI, FAY WINSLET, OPRAH KILMER                                                                      |
|   5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico | Family      |  2.99 |    130 | G      | DUSTIN TAUTOU, THORA TEMPLE, MATTHEW CARREY, MATTHEW LEIGH, GARY PHOENIX                                                                       |
|   6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             | Foreign     |  2.99 |    169 | PG     | KIRSTEN PALTROW, SANDRA KILMER, JAYNE NEESON, WARREN NOLTE, MORGAN WILLIAMS, KENNETH HOFFMAN, REESE WEST                                       |
|   7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                     | Comedy      |  4.99 |     62 | PG-13  | RICHARD PENN, MICHAEL BOLGER, MENA HOPPER, OPRAH KILMER, JIM MOSTEL                                                                            |
|   8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                         | Horror      |  4.99 |     54 | R      | FAY KILMER, GENE WILLIS, SUSAN DAVIS, LUCILLE DEE                                                                                              |
|   9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   | Horror      |  2.99 |    114 | PG-13  | WARREN NOLTE, GRETA KEITEL, WILLIAM HACKMAN, MERYL ALLEN, CHRISTIAN GABLE, MENA TEMPLE, RIP WINSLET, ELVIS MARX, RIP CRAWFORD                  |
|  10 | ALADDIN CALENDAR | A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China                             | Sports      |  4.99 |     63 | NC-17  | ALEC WAYNE, JUDY DEAN, VAL BOLGER, RAY JOHANSSON, RENEE TRACY, JADA RYDER, GRETA MALDEN, ROCK DUKAKIS                                          |
+-----+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------+-------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------+
 */

--- Crea 5 vistas sobre la BBDD con 3 o más tablas

---Películas con su idioma y categoría
create view film_category_language AS 
select fi.title, la.name as idioma, ca.name as categoria 
from 
language as la join film as fi join film_category as fc join category as ca on la.language_id =
fi.language_id and fi.film_id = fc.film_id and fc.category_id = ca.category_id LIMIT 15;

select * from film_category_language;
/* +---------------------+---------+-----------+
| title               | idioma  | categoria |
+---------------------+---------+-----------+
| AMADEUS HOLY        | English | Action    |
| AMERICAN CIRCUS     | English | Action    |
| ANTITRUST TOMATOES  | English | Action    |
| ARK RIDGEMONT       | English | Action    |
| BAREFOOT MANCHURIAN | English | Action    |
| BERETS AGENT        | English | Action    |
| BRIDE INTRIGUE      | English | Action    |
| BULL SHAWSHANK      | English | Action    |
| CADDYSHACK JEDI     | English | Action    |
| CAMPUS REMEMBER     | English | Action    |
| CASUALTIES ENCINO   | English | Action    |
| CELEBRITY HORN      | English | Action    |
| CLUELESS BUCKET     | English | Action    |
| CROW GREASE         | English | Action    |
| DANCES NONE         | English | Action    |
+---------------------+---------+-----------+ */

--- Cantiad pagada que han usado 10 clientes ALEATORIOS:
CREATE VIEW paid_amount_client as 
select cu.first_name, re.rental_id, pa.amount 
from 
customer as cu join rental as re join payment as pa 
on cu.customer_id = re.customer_id and pa.customer_id = cu.customer_id 
order by rand() LIMIT 10;

select * from paid_amount_client;
/* +------------+-----------+--------+
| first_name | rental_id | amount |
+------------+-----------+--------+
| MARTHA     |      4300 |   5.99 |
| JASON      |      9104 |   8.99 |
| JAMES      |      3074 |   1.99 |
| KAREN      |     13096 |   0.99 |
| DAVE       |     11255 |   5.99 |
| VERONICA   |      2035 |   5.99 |
| KAREN      |      2952 |   0.99 |
| NEIL       |      8273 |   3.99 |
| THELMA     |      2253 |   2.99 |
| ARTHUR     |      8505 |   3.99 |
+------------+-----------+--------+
 */

--- Ciudad, país y dirección donde viven 10 clientes aleatorios que han comprado en la tienda con ID 1
CREATE VIEW customer_info_1store AS
select co.country, ci.city, ad.address, cu.first_name, cu.last_name
from 
country as co join city as ci join address as ad join customer as cu join store as s 
on s.store_id = cu.store_id and cu.address_id = ad.address_id 
and ad.city_id = ci.city_id and ci.country_id = co.country_id 
and s.store_id = 1 order by rand() LIMIT 10;

select * from customer_info_1store;
/* +----------------------+------------------+--------------------------+------------+------------+
| country              | city             | address                  | first_name | last_name  |
+----------------------+------------------+--------------------------+------------+------------+
| Virgin Islands, U.S. | Charlotte Amalie | 264 Bhimavaram Manor     | NATHAN     | RUNYON     |
| Indonesia            | Surakarta        | 1947 Paarl Way           | JAY        | ROBB       |
| Chile                | Coquimbo         | 568 Dhule (Dhulia) Loop  | ANDRE      | RAPP       |
| Indonesia            | Gorontalo        | 1688 Nador Lane          | TARA       | RYAN       |
| India                | Jhansi           | 176 Mandaluyong Place    | AMY        | LOPEZ      |
| Bulgaria             | Ruse             | 191 Jos Azueta Parkway   | TYRONE     | ASHER      |
| China                | Tongliao         | 105 Dzerzinsk Manor      | LEROY      | BUSTAMANTE |
| India                | Karnal           | 1884 Shikarpur Avenue    | NAOMI      | JENNINGS   |
| Brazil               | Rio Claro        | 1206 Dos Quebradas Place | DENISE     | KELLY      |
| India                | Nagaon           | 1963 Moscow Place        | ALICIA     | MILLS      |
+----------------------+------------------+--------------------------+------------+------------+ */

--- 10 películas con su descripción de forma aleatoria:
CREATE VIEW film_descrip AS
select fi.title, ft.description from 
film as fi join inventory as i join film_text as ft 
on ft.film_id = i.film_id and i.film_id = fi.film_id 
order by rand() LIMIT 10;

select * from film_descrip;
/* +-------------------+--------------------------------------------------------------------------------------------------------------------+
| title             | description                                                                                                        |
+-------------------+--------------------------------------------------------------------------------------------------------------------+
| CHAMBER ITALIAN   | A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria                                |
| HONEY TIES        | A Taut Story of a Waitress And a Crocodile who must Outrace a Lumberjack in A Shark Tank                           |
| MIDNIGHT WESTWARD | A Taut Reflection of a Husband And a A Shark who must Redeem a Pastry Chef in A Monastery                          |
| QUEST MUSSOLINI   | A Fateful Drama of a Husband And a Sumo Wrestler who must Battle a Pastry Chef in A Baloon Factory                 |
| KISS GLORY        | A Lacklusture Reflection of a Girl And a Husband who must Find a Robot in The Canadian Rockies                     |
| DAISY MENAGERIE   | A Fast-Paced Saga of a Pastry Chef And a Monkey who must Sink a Composer in Ancient India                          |
| VIRGIN DAISY      | A Awe-Inspiring Documentary of a Robot And a Mad Scientist who must Reach a Database Administrator in A Shark Tank |
| MIXED DOORS       | A Taut Drama of a Womanizer And a Lumberjack who must Succumb a Pioneer in Ancient India                           |
| DOUBLE WRATH      | A Thoughtful Yarn of a Womanizer And a Dog who must Challenge a Madman in The Gulf of Mexico                       |
| LADY STAGE        | A Beautiful Character Study of a Woman And a Man who must Pursue a Explorer in A U-Boat                            |
+-------------------+--------------------------------------------------------------------------------------------------------------------+ */

--- A la anterior consulta añade los actores y sus identificadores:
CREATE VIEW film_actor_desc AS
select fi.title, ft.description, a.first_name, a.last_name, a.actor_id 
from film as fi join inventory as i join film_text as ft join actor as a join film_actor as fa on ft.film_id = i.film_id and
i.film_id = fi.film_id and a.actor_id = fa.actor_id and fa.film_id = fi.film_id  order by rand() LIMIT 10;

select * from film_actor_desc;
/* +---------------------+-------------------------------------------------------------------------------------------------------+-------------+--------------+----------+
| title               | description                                                                                           | first_name  | last_name    | actor_id |
+---------------------+-------------------------------------------------------------------------------------------------------+-------------+--------------+----------+
| WORKING MICROCOSMOS | A Stunning Epistle of a Dentist And a Dog who must Kill a Madman in Ancient China                     | LUCILLE     | DEE          |      138 |
| PELICAN COMFORTS    | A Epic Documentary of a Boy And a Monkey who must Pursue a Astronaut in Berlin                        | WHOOPI      | HURT         |      140 |
| MERMAID INSECTS     | A Lacklusture Drama of a Waitress And a Husband who must Fight a Husband in California                | GEOFFREY    | HESTON       |      151 |
| ALI FOREVER         | A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies | CHRISTOPHER | BERRY        |       91 |
| STORM HAPPINESS     | A Insightful Drama of a Feminist And a A Shark who must Vanquish a Boat in A Shark Tank               | OLYMPIA     | PFEIFFER     |      171 |
| PULP BEVERLY        | A Unbelieveable Display of a Dog And a Crocodile who must Outrace a Man in Nigeria                    | ANGELA      | WITHERSPOON  |      144 |
| KISS GLORY          | A Lacklusture Reflection of a Girl And a Husband who must Find a Robot in The Canadian Rockies        | JULIA       | MCQUEEN      |       27 |
| CONEHEADS SMOOCHY   | A Touching Story of a Womanizer And a Composer who must Pursue a Husband in Nigeria                   | JOHNNY      | LOLLOBRIGIDA |        5 |
| HOPE TOOTSIE        | A Amazing Documentary of a Student And a Sumo Wrestler who must Outgun a A Shark in A Shark Tank      | JULIA       | FAWCETT      |      199 |
| PICKUP DRIVING      | A Touching Documentary of a Husband And a Boat who must Meet a Pastry Chef in A Baloon Factory        | MINNIE      | ZELLWEGER    |       85 |
+---------------------+-------------------------------------------------------------------------------------------------------+-------------+--------------+----------+ */
