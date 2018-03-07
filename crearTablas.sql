/*

  Tabla facultad

  id_facultad  |    nombre
  -----------------------------------------------
  10                Ingenieria
  11                Medicina
  12                Arte
  13                Odontologia
  14                Ciencias Humanas
  ...

  Tabla estudiante

  codigo  |   nombre    |   edad  |   id_facultad
  -------------------------------------------------
  1           Juan          19        2
  2           Daniel        22        2
  3           Maria         22        3
  4           Jose          20        4
  ...

*/



/*Desabilitar FKs*/
SET foreign_key_checks = 0;


DROP TABLE IF EXISTS facultad;

CREATE TABLE facultad (
	id_facultad INT(10) AUTO_INCREMENT,
    nombre VARCHAR(50),
    CONSTRAINT pk PRIMARY KEY (id_facultad)
);

INSERT INTO facultad(id_facultad, nombre)
VALUES (1, 'Ingenieria');

INSERT INTO facultad(id_facultad, nombre)
VALUES (2, 'Medicina');

INSERT INTO facultad(id_facultad, nombre)
VALUES (3, 'Arte');

INSERT INTO facultad(id_facultad, nombre)
VALUES (4, 'Odontologia');

INSERT INTO facultad(id_facultad, nombre)
VALUES (5, 'Ciencias Humanas');


DROP TABLE IF EXISTS estudiante;

CREATE TABLE estudiante (
	codigo INT(10) AUTO_INCREMENT,
    nombre VARCHAR(50),
    edad INT(10),
	id_facultad INT(10),
    
    CONSTRAINT pk PRIMARY KEY (codigo),
    CONSTRAINT fk_facultad FOREIGN KEY (id_facultad) REFERENCES facultad(id_facultad)
);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Juan', 19, 2);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Daniel', 22, 2);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Maria', 22, 3);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Jose', 20, 4);



/*Habilitar FKs*/
SET foreign_key_checks = 1;





