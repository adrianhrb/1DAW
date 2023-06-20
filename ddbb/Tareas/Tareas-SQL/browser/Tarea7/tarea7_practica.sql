CREATE table pelicula(
	Pcodigo int PRIMARY KEY,
	Pnombre TEXT,
	calificacionedad INT
);

CREATE TABLE sala(
	Scodigo int PRIMARY KEY,
	Snombre text,
	codigo_peli int REFERENCES pelicula(id)
);

