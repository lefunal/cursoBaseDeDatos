CREATE TABLE seleccion(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50),
    grupo VARCHAR(1),
    goles INT,
	PRIMARY KEY (id)
);

CREATE TABLE jugador(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(50),
    fecha_nacimiento DATE,
    altura INT,
    peso INT,
    goles INT,
    id_seleccion INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_seleccion) REFERENCES seleccion(id)
    
);

/* Datos de prueba */

INSERT INTO seleccion (id, nombre, grupo, goles) VALUES (1, 'Colombia', 'H', '2');
INSERT INTO seleccion (id, nombre, grupo, goles) VALUES (2, 'Brasil', 'E', '3');
INSERT INTO seleccion (id, nombre, grupo, goles) VALUES (3, 'Argentina', 'D', '5');

INSERT INTO jugador (nombre, fecha_nacimiento, altura, peso, goles, id_seleccion) 
VALUES ('J1', '1995-06-15', 180, 80, 4, 1);
INSERT INTO jugador (nombre, fecha_nacimiento, altura, peso, goles, id_seleccion) 
VALUES ('J2', '1996-06-15', 170, 70, 3, 1);
INSERT INTO jugador (nombre, fecha_nacimiento, altura, peso, goles, id_seleccion) 
VALUES ('J3', '1997-06-15', 160, 75, 2, 1);


INSERT INTO jugador (nombre, fecha_nacimiento, altura, peso, goles, id_seleccion) 
VALUES ('J20', '1997-06-15', 185, 75, 2, 2);


/*-------------------------------------------
  1. Hacer un Procedimiento Almacenado que dado el nombre de una selección ponga el numero de goles de la selección en 0 y los goles de sus jugadores también en 0;
*/


DELIMITER $$

CREATE PROCEDURE poner_goles_seleccion_en_cero(IN nombre_seleccion VARCHAR(50))
BEGIN

	DECLARE id_seleccion INT;
    SELECT id INTO id_seleccion
    FROM seleccion
    WHERE nombre = nombre_seleccion;
    
    UPDATE seleccion
    SET goles = 0
    WHERE seleccion.id = id_seleccion;
    
    UPDATE jugador
    SET goles = 0
    WHERE jugador.id_seleccion = id_seleccion;
	
END$$

DELIMITER ;

/* Para probar */
CALL poner_goles_seleccion_en_cero('Colombia');
DROP PROCEDURE poner_goles_seleccion_en_cero;



/*-------------------------------------------
  2. Hacer un trigger para que cada vez que se actualice la información de un jugador guarde la información sobre esta modificación en otra tabla. En particular cuando se hizo, que acción se realizó (INSERT, UPDATE o DELETE) y sobre que jugador. 
   */

/* Se crea una nueva tabla para guardar la infromacion de los cambios */
CREATE TABLE historial_jugador(
    id INT AUTO_INCREMENT,
    id_jugador INT,
    accion VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);


DELIMITER $$

CREATE TRIGGER tr_jugador AFTER UPDATE ON jugador
FOR EACH ROW BEGIN

	/* Se puede agregar mas informacion si se desea */
  INSERT INTO historial_jugador(id_jugador, accion) 
  VALUES (NEW.id, 'UPDATE');

END$$

DELIMITER ;

/* Para probar */
UPDATE jugador
SET nombre = 'J1 nuevo'
WHERE id = 1;

DROP TRIGGER tr_jugador;


/*-------------------------------------------
 3. Hacer un trigger para que cada vez que se modifique una selección se guarde cuando se hizo la modificación y los valores antiguos y nuevos de la selección.   
 */

/* Se crea una nueva tabla para guardar la infromacion de los cambios */
CREATE TABLE historial_seleccion(
    id INT AUTO_INCREMENT,
    id_seleccion INT,
    nombre_antiguo VARCHAR(50),
	nombre_nuevo VARCHAR(50),
    grupo_antiguo VARCHAR(1),
    grupo_nuevo VARCHAR(1),
    goles_antiguo INT,
    goles_nuevo INT,
    
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);


DELIMITER $$

CREATE TRIGGER tr_seleccion AFTER UPDATE ON seleccion
FOR EACH ROW BEGIN

  INSERT INTO historial_seleccion(id_seleccion, 
	nombre_antiguo, 
    nombre_nuevo, 
	grupo_antiguo, 
    grupo_nuevo,
	goles_antiguo, 
    goles_nuevo) 
  VALUES (NEW.id, 
	OLD.nombre, 
    NEW.nombre,
    OLD.grupo,
    NEW.grupo,
    OLD.goles,
    NEW.goles);

END$$

DELIMITER ;

/* Para probar */
UPDATE seleccion
SET nombre = 'nombre nuevo', grupo = 'Z', goles = 100
WHERE id = 1;

DROP TRIGGER tr_seleccion;


/*-------------------------------------------
 4. Se quiere que cada vez que se actualice el numero de goles de un jugador se actualice el numero de goles de su selección correspondiente. Hacer un trigger para hacer esa funcionalidad.
 */

DELIMITER $$

CREATE TRIGGER tr_seleccion_actualizar_goles AFTER UPDATE ON jugador
FOR EACH ROW BEGIN

	DECLARE goles_seleccion INT;

	SELECT SUM(goles) INTO goles_seleccion
    FROM jugador
    WHERE jugador.id_seleccion = NEW.id_seleccion;
    
    UPDATE seleccion
    SET goles = goles_seleccion
    WHERE seleccion.id = NEW.id_seleccion;

END$$

DELIMITER ;

/* Para probar */
UPDATE jugador
SET goles = 7
WHERE id = 2;

DROP TRIGGER tr_seleccion_actualizar_goles;

/*-------------------------------------------
 5. Si se borra un equipo se quiere que también se borren los jugadores de ese equipo (seria semejante a ON DELETE CASCADE https://dev.mysql.com/doc/refman/8.0/en/create-table- foreign-keys.html). Hacer un trigger que haga eso.
 */

DELIMITER $$

CREATE TRIGGER tr_seleccion_eliminar BEFORE DELETE ON seleccion
FOR EACH ROW BEGIN
    DELETE FROM jugador
    WHERE jugador.id_seleccion = OLD.id;

END$$

DELIMITER ;

/* Para probar */
DELETE FROM seleccion
WHERE id = 2;

DROP TRIGGER tr_seleccion_eliminar;


