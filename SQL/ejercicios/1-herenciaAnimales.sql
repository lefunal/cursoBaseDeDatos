/*
	Solucion herencia
	animal_acuatico hereda de animal
    animal_terrestre hereda de animal
*/

/*------------------------------------
   Una sola tabla
-------------------------------------*/
CREATE TABLE animal (
	codigo INT(10),
    edad VARCHAR (1),
    genero VARCHAR (1),
    aguaDulce VARCHAR (1),
    domestico VARCHAR (1),
    CONSTRAINT pk PRIMARY KEY (codigo)
);

/*--------------------------------------
  Una tabla por sublcase
  -------------------------------------*/
CREATE TABLE animal_acuatico (
	codigo INT(10),
    edad VARCHAR (1),
    genero VARCHAR (1),
    aguaDulce VARCHAR (1),
    CONSTRAINT pk PRIMARY KEY (codigo)
);


CREATE TABLE animal_terrestre (
	codigo INT(10),
    edad VARCHAR (1),
    genero VARCHAR (1),
    domestico VARCHAR (1),
    CONSTRAINT pk PRIMARY KEY (codigo)
);

/* ------------------------------------------
  Una tabla por entidad
 ---------------------------------------------*/
CREATE TABLE animal (
	codigo INT(10),
    edad VARCHAR (1),
    genero VARCHAR (1),
    CONSTRAINT pk PRIMARY KEY (codigo)
);

CREATE TABLE animal_acuatico (
	codigo INT(10),
    aguaDulce VARCHAR (1),
    CONSTRAINT pk PRIMARY KEY (codigo),
    CONSTRAINT fk_aa_a FOREIGN KEY (codigo) REFERENCES animal(codigo)
);

CREATE TABLE animal_terrestre (
	codigo INT(10),
    domestico VARCHAR (1),
    CONSTRAINT pk PRIMARY KEY (codigo),
    CONSTRAINT fk_at_a FOREIGN KEY (codigo) REFERENCES animal(codigo)
);

