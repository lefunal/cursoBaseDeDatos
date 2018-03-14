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

/*Agregar una facultad con id 1 y nombre Ingenieria*/
INSERT INTO facultad(id_facultad, nombre)
VALUES (1, 'Ingenieria');

/*Agregar la facultad ingenieria y medicina*/
INSERT INTO facultad(id_facultad, nombre)
VALUES (1, 'Ingenieria'), (2, 'medicina');


/*Agregar usando una consulta*/

CREATE TABLE facultad2 (
	id_facultad INT(10) AUTO_INCREMENT,
    nombre VARCHAR(50),
    CONSTRAINT pk PRIMARY KEY (id_facultad)
);
/*Agregar las facultades de facultad a facultad2*/
INSERT INTO facultad2(id_facultad, nombre)
  SELECT id_facultad, nombre
  FROM facultad;

DROP TABLE facultad2;



