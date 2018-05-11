
/* todas las combinaciones de estudiante y facultad */
SELECT * FROM estudiante, facultad;

/* =>

+--------+--------+------+-------------+-------------+------------------+
| codigo | nombre | edad | id_facultad | id_facultad | nombre           |
+--------+--------+------+-------------+-------------+------------------+
|      1 | Juan   |   19 |           2 |           1 | Ingenieria       |
|      2 | Daniel |   22 |           2 |           1 | Ingenieria       |
|      3 | Maria  |   22 |           3 |           1 | Ingenieria       |
|      4 | Jose   |   20 |           4 |           1 | Ingenieria       |
|      1 | Juan   |   19 |           2 |           2 | Medicina         |
|      2 | Daniel |   22 |           2 |           2 | Medicina         |
|      3 | Maria  |   22 |           3 |           2 | Medicina         |
|      4 | Jose   |   20 |           4 |           2 | Medicina         |
|      1 | Juan   |   19 |           2 |           3 | Arte             |
|      2 | Daniel |   22 |           2 |           3 | Arte             |
|      3 | Maria  |   22 |           3 |           3 | Arte             |
|      4 | Jose   |   20 |           4 |           3 | Arte             |
|      1 | Juan   |   19 |           2 |           4 | Odontologia      |
|      2 | Daniel |   22 |           2 |           4 | Odontologia      |
|      3 | Maria  |   22 |           3 |           4 | Odontologia      |
|      4 | Jose   |   20 |           4 |           4 | Odontologia      |
|      1 | Juan   |   19 |           2 |           5 | Ciencias Humanas |
|      2 | Daniel |   22 |           2 |           5 | Ciencias Humanas |
|      3 | Maria  |   22 |           3 |           5 | Ciencias Humanas |
|      4 | Jose   |   20 |           4 |           5 | Ciencias Humanas |
+--------+--------+------+-------------+-------------+------------------+
*/

/* los estudiantes con sus facultades respectivas */
SELECT * FROM estudiante, facultad 
WHERE estudiante.id_facultad = facultad.id_facultad;


SELECT * FROM 
estudiante JOIN facultad ON (estudiante.id_facultad = facultad.id_facultad);

/* =>
+--------+--------+------+-------------+-------------+-------------+
| codigo | nombre | edad | id_facultad | id_facultad | nombre      |
+--------+--------+------+-------------+-------------+-------------+
|      1 | Juan   |   19 |           2 |           2 | Medicina    |
|      2 | Daniel |   22 |           2 |           2 | Medicina    |
|      3 | Maria  |   22 |           3 |           3 | Arte        |
|      4 | Jose   |   20 |           4 |           4 | Odontologia |
+--------+--------+------+-------------+-------------+-------------+
*/

/* NATURAL JOIN une a las tablas uniando donde las columnas tienene el mismo nombre,
  en este caso nombre y id_facultad 
  seria equivalente a las sentecia anterior si id_facultad fuera la unica columna con el mismo nombre
 */ 
SELECT * FROM 
estudiante NATURAL JOIN facultad;

/* =>
Empty set (0.00 sec)
*/

/* las facultades con sus estudiantes respectivos, si los tienen */
SELECT * FROM 
facultad LEFT OUTER JOIN estudiante ON (estudiante.id_facultad = facultad.id_facultad);

SELECT * FROM 
estudiante RIGHT OUTER JOIN facultad ON (estudiante.id_facultad = facultad.id_facultad);


/* => 

+-------------+------------------+--------+--------+------+-------------+
| id_facultad | nombre           | codigo | nombre | edad | id_facultad |
+-------------+------------------+--------+--------+------+-------------+
|           2 | Medicina         |      1 | Juan   |   19 |           2 |
|           2 | Medicina         |      2 | Daniel |   22 |           2 |
|           3 | Arte             |      3 | Maria  |   22 |           3 |
|           4 | Odontologia      |      4 | Jose   |   20 |           4 |
|           1 | Ingenieria       |   NULL | NULL   | NULL |        NULL |
|           5 | Ciencias Humanas |   NULL | NULL   | NULL |        NULL |
+-------------+------------------+--------+--------+------+-------------+
*/

/* las facultades con sus estudiantes respectivos, si los tienen y tambien los estudiantes con 
 sus facultades respectivas si las tienen */

/*IMPORTANTE!!! MYSQL no soporta esta instruccion:*/
SELECT * FROM 
facultad FULL OUTER JOIN estudiante ON (estudiante.id_facultad = facultad.id_facultad);
/* => 

+-------------+------------------+--------+--------+------+-------------+
| id_facultad | nombre           | codigo | nombre | edad | id_facultad |
+-------------+------------------+--------+--------+------+-------------+
|           2 | Medicina         |      1 | Juan   |   19 |           2 |
|           2 | Medicina         |      2 | Daniel |   22 |           2 |
|           3 | Arte             |      3 | Maria  |   22 |           3 |
|           4 | Odontologia      |      4 | Jose   |   20 |           4 |
|           1 | Ingenieria       |   NULL | NULL   | NULL |        NULL |
|           5 | Ciencias Humanas |   NULL | NULL   | NULL |        NULL |
+-------------+------------------+--------+--------+------+-------------+
*/



