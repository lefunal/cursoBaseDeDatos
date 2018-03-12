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


  Tabla profesor

  cedula  |   nombre    |   salario  |   id_facultad
  -------------------------------------------------
  111         Jhon          2000        4
  222         Pedro         3000        1
  333         Elena         2500        1
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
	CONSTRAINT fk_e_f FOREIGN KEY (id_facultad) REFERENCES facultad(id_facultad)
);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Juan', 19, 2);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Daniel', 22, 2);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Maria', 22, 3);

INSERT INTO estudiante(nombre, edad, id_facultad)
VALUES ('Jose', 20, 4);


DROP TABLE IF EXISTS profesor;

CREATE TABLE profesor (
	cedula INT(10),
	nombre VARCHAR(50),
    salario DECIMAL(10,2),
    id_facultad INT(10),
    
    CONSTRAINT pk PRIMARY KEY (cedula),
	CONSTRAINT fk_p_f FOREIGN KEY (id_facultad) REFERENCES facultad(id_facultad)
);

INSERT INTO profesor(cedula, nombre, salario, id_facultad)
VALUES (111, 'Jhon', 2000, 4);

INSERT INTO profesor(cedula, nombre, salario, id_facultad)
VALUES (222, 'Pedro', 3000, 1);

INSERT INTO profesor(cedula, nombre, salario, id_facultad)
VALUES (333, 'Elena', 2500, 1);


/*Habilitar FKs*/
SET foreign_key_checks = 1;




