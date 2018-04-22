/* https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html */

/*Mostrar los Triggers*/
SHOW TRIGGERS;


/*
 Creat una tabla como historial, solo para ejemplo
 */
CREATE TABLE facultad_historial (
    id INT AUTO_INCREMENT,
	id_facultad INT(10),
    accion VARCHAR(40),    
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

/* Agregar en facultad_historial despues de que se agregue en facultad */

DELIMITER $$

CREATE TRIGGER tr_historial_facultad AFTER INSERT ON facultad
FOR EACH ROW BEGIN
  DECLARE id INT;
  SET id = NEW.id_facultad;

  INSERT INTO facultad_historial(id_facultad, accion) 
  VALUES (id, 'INSERT');

END$$

DELIMITER ;

INSERT INTO facultad(nombre)
VALUES ('Nueva facultad');

DROP TRIGGER tr_historial_facultad;

/* Agregar en facultad_historial antes de que se elimine en facultad */

DELIMITER $$

CREATE TRIGGER tr_historial_facultad_del BEFORE DELETE ON facultad
FOR EACH ROW BEGIN
  DECLARE id INT;
  SET id = OLD.id_facultad;

  INSERT INTO facultad_historial(id_facultad, accion) 
  VALUES (id, 'DELETE');

END$$

DELIMITER ;

DELETE FROM facultad
WHERE id_facultad = 8;

DROP TRIGGER tr_historial_facultad_del;


/* Agregar en facultad_historial antes de que se actualice en facultad */

DELIMITER $$

CREATE TRIGGER tr_historial_facultad_up AFTER UPDATE ON facultad
FOR EACH ROW BEGIN
  DECLARE id INT;
  DECLARE nombreAnterior VARCHAR(50);
  DECLARE nombreSiguiente VARCHAR(50);

  SET id = OLD.id_facultad;
  SET nombreAnterior = OLD.nombre;
  SET nombreSiguiente = NEW.nombre;
  

  INSERT INTO facultad_historial(id_facultad, accion) 
  VALUES (id, CONCAT('UPDATE ', nombreAnterior, ' => ', nombreSiguiente));

END$$

DELIMITER ;

UPDATE facultad 
SET nombre ='Otro nombre'
WHERE id_facultad = 8;

DROP TRIGGER tr_historial_facultad_up;



/* Errores, terminan las transacciones, causan un rollback */

DELIMITER $$

CREATE TRIGGER tr_error AFTER UPDATE ON facultad
FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Error', MYSQL_ERRNO = 1000;
END$$

DELIMITER ;

START TRANSACTION; 

UPDATE facultad 
SET nombre ='OTRO valor'
WHERE id_facultad = 1;

COMMIT;
DROP TRIGGER tr_error;


