/* Taller 4 */

/* Se quieren crear una base de datos para guardar información de canciones. */

/*
  1. Las canciones se identifican por el álbum y el nombre de la canción. Una canción tiene una duración que no puede ser nula, una fecha en que se compuso, un genero que puede tomar uno de los siguientes valores: ‘rock’,‘pop’, ‘hip hop’ y ‘jazz’.
 */

CREATE TABLE cancion (
  album VARCHAR(40),
  nombre VARCHAR(40),
  duracion INT(11) NOT NULL,
  fecha_composicion DATE,
  genero VARCHAR(40),
  PRIMARY KEY (album, nombre),
  CHECK (genero IN ('rock','pop', 'hip hop', 'jazz'))
);

/*
  2. A las canciones se les pueden dar reconocimientos (mejor canción pop, etc.). Estos reconocimientos se identifican por un id. Además tienen un nombre único y el tiempo en el que fueron otorgados.
 */

CREATE TABLE reconocimiento (
  id INT(11),
  nombre VARCHAR(40) UNIQUE,
  cancion_album VARCHAR(40),
  cancion_nombre VARCHAR(40),
  momento_otorgado DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (cancion_album, cancion_nombre) REFERENCES cancion(album, nombre)
);

/*
 3. Se quiere crear una vista que tenga todas las canciones  ́rock ́ que se compusieron después del 2010.
 */

CREATE VIEW canciones_rock_despues_de_2010 AS
SELECT * 
FROM cancion 
WHERE cancion.fecha_composicion >= DATE('2010-12-31'); 


/*
 4. Se quiere crear una vista con todos los reconocimientos que se otorgaron en los últimos 100 dias. Debe contener la información del genero de la canción.
 */

CREATE VIEW reconocimientos_ultimos_100_dias AS
SELECT 
reconocimiento.nombre AS reconocimiento,
cancion.album, 
cancion.nombre AS cancion,
cancion.genero
FROM cancion JOIN reconocimiento ON (cancion.album = reconocimiento.cancion_album AND cancion.nombre = reconocimiento.cancion_nombre)
WHERE reconocimiento.momento_otorgado >= NOW() - INTERVAL 100 DAY; 

/*
 5. Se quiere crear un usuario con el nombre “Maria” que pueda consultar la vista del punto 4 y que pueda consultar e insertar en la tabla del punto 1.
 */

CREATE USER 'Maria'@'localhost' IDENTIFIED BY 'new_password' PASSWORD EXPIRE;

GRANT SELECT ON reconocimientos_ultimos_100_dias TO 'Maria'@'localhost';
GRANT SELECT ON cancion TO 'Maria'@'localhost';
GRANT INSERT ON cancion TO 'Maria'@'localhost';

