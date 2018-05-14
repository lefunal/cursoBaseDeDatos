/* https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html */


/* Variables de session, validas durante la conexion a la base de datos */
/* https://dev.mysql.com/doc/refman/8.0/en/user-variables.html */

SET @mi_variable = 1;
SET @mi_variable = @mi_variable + 1;
SELECT @mi_variable;



/* Imprimir un valor constante */

DELIMITER $$

CREATE PROCEDURE imprimir_constante()
BEGIN
	SELECT 5;
END$$

DELIMITER ;

/* Llamar procedimiento */

CALL imprimir_constante();

/*Eliminar*/
DROP PROCEDURE imprimir_constante;

/*-------------------------------------------*/
/* Imprimir el numero de estudiantes */

DELIMITER $$

CREATE PROCEDURE numero_estudiantes(OUT numero INT)
BEGIN
	SELECT COUNT(*) INTO numero 
    FROM estudiante;
END$$

DELIMITER ;

/* Llamar procedimiento */

CALL numero_estudiantes(@a);
SELECT @a;

/*-------------------------------------------*/
/* Imprimir el numero de estudiantes cuyo nombre comienza por una letra*/

DELIMITER $$

CREATE PROCEDURE numero_estudiantes_por_nombre(IN letra VARCHAR(1), OUT numero INT)
BEGIN
	SELECT COUNT(*) INTO numero 
    FROM estudiante
    WHERE estudiante.nombre LIKE CONCAT(letra, '%') ;
END$$

DELIMITER ;

/* Llamar procedimiento */

CALL numero_estudiantes_por_nombre('J', @a);
SELECT @a;


/*-------------------------------------------*/
/* Imprimir el numero de estudiantes cuyo nombre comienza por una letra*/

DELIMITER $$

CREATE PROCEDURE incrementar(INOUT contador INT)
BEGIN
  SET contador = contador + 1;	
END$$

DELIMITER ;

/* Llamar procedimiento */

SET @contador = 1;
CALL incrementar(@contador);
SELECT @contador;


/*-------------------------------------------*/
/* Edad y codigo del estudiante con mayor edad */

DELIMITER $$

CREATE PROCEDURE estudiante_mayor_edad(OUT nombre VARCHAR(40), OUT edad INT)
BEGIN
    
    /* Variables */
    DECLARE estudiante_mayor_nombre VARCHAR(40);
    DECLARE estudiante_mayor_edad INT;

	SELECT estudiante.nombre, estudiante.edad INTO estudiante_mayor_nombre, estudiante_mayor_edad
    FROM estudiante
    ORDER BY estudiante.edad DESC
    LIMIT 1;

    SET nombre = estudiante_mayor_nombre;
    SET edad = estudiante_mayor_edad;    

END$$

DELIMITER ;

CALL estudiante_mayor_edad(@nom, @edad);
SELECT @nom, @edad;


/*-------------------------------------------*/
/* Funcion que concatena dos strings */
DELIMITER $$

CREATE FUNCTION concatenar(s1 VARCHAR(50), s2 VARCHAR(50)) RETURNS VARCHAR(200)
BEGIN
  RETURN CONCAT(s1, s2);
END$$

DELIMITER ;


SET @s1s2 = concatenar('Hola', ' Mundo');
SELECT @s1s2;
SELECT concatenar('Hola', ' Mundo2');


/*-------------------------------------------*/
/* Insertar profesor con reglas */

DELIMITER $$

CREATE PROCEDURE insertarProfesor(IN cedula INT, IN nombre VARCHAR(50), IN salario INT)
BEGIN  
  
  IF salario < 1000 THEN
    INSERT INTO profesor (cedula, nombre, salario) VALUES (cedula, nombre, 1000);
  ELSEIF salario < 2000 THEN
    INSERT INTO profesor (cedula, nombre, salario) VALUES (cedula, nombre, salario);
  ELSE
    INSERT INTO profesor (cedula, nombre, salario) VALUES (cedula, nombre, 3000);
  END IF;

END$$

DELIMITER ;

CALL insertarProfesor(2222, 'Pedro', 3500);


/*-------------------------------------------*/
/* Sumar los numeros de 1 a 5 */

DELIMITER $$

CREATE FUNCTION suma() RETURNS INT
BEGIN
  DECLARE sumaAcumulada INT DEFAULT 0;
  DECLARE n INT DEFAULT 1;
  
  WHILE n <= 5 DO
    SET sumaAcumulada = sumaAcumulada + n;
    SET n = n + 1;
  END WHILE;

  RETURN sumaAcumulada;

END$$

DELIMITER ;

SELECT suma();

