/* Transacciones */

/* Transaccion se insertan 2 nuevos estudiantes */
START TRANSACTION;

INSERT INTO estudiante(nombre, edad)
VALUES ('Marco', 23);

INSERT INTO estudiante(nombre, edad)
VALUES ('Mateo', 23);

COMMIT;


/* Transaccion que se aborta, no se inserta nada */

START TRANSACTION;

INSERT INTO estudiante(nombre, edad)
VALUES ('Marco', 23);

INSERT INTO estudiante(nombre, edad)
VALUES ('Mateo', 23);

ROLLBACK;


/* Savepoints */

/* Solo se insertan las estudiantes Camila y Zara*/
START TRANSACTION;

INSERT INTO estudiante(nombre, edad)
VALUES ('Camila', 20);

SAVEPOINT punto1;

INSERT INTO estudiante(nombre, edad)
VALUES ('Mateo', 23);

ROLLBACK TO SAVEPOINT punto1;

INSERT INTO estudiante(nombre, edad)
VALUES ('Zara', 20);

COMMIT;


/* ----------------------------------------
 Niveles de aislamiento 
 ------------------------------------------*/
/* https://dev.mysql.com/doc/refman/5.7/en/innodb-transaction-isolation-levels.html */
/* Por defecto es REPEATABLE READ*/

/* Definir el nivel de aislamiento antes de comenzar la transaccion */
/* Es decir correr uno de los siguiente 4 comandos y luego START TRANSACTION */
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
/* Pueden leer filas fantasmas */
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
/* La lectura de la misma fila puede cambiar */
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
/*Puede leer datos de una transacción que no haya terminado*/
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;


START TRANSACTION;

INSERT INTO estudiante(nombre, edad)
VALUES ('Marco', 23);

INSERT INTO estudiante(nombre, edad)
VALUES ('Mateo', 23);

COMMIT;







