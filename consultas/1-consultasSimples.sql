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

*/

/* Todos los estudiantes */
SELECT * FROM estudiante;

/* => 
+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      1 | Juan   |   19 |           2 |
|      2 | Daniel |   22 |           2 |
|      3 | Maria  |   22 |           3 |
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+ 
 */



/* Solo los nombres y edades de los estudiantes */
SELECT nombre, edad FROM estudiante;

/* => 
+--------+------+
| nombre | edad |
+--------+------+
| Juan   |   19 |
| Daniel |   22 |
| Maria  |   22 |
| Jose   |   20 |
+--------+------+
*/


/* Los estudiantes con edad de 22 */
SELECT * FROM estudiante
WHERE edad = 22;
/* => 
+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      2 | Daniel |   22 |           2 |
|      3 | Maria  |   22 |           3 |
+--------+--------+------+-------------+

*/

/* Los estudiantes con una edad diferente a 22 */
SELECT * FROM estudiante
WHERE NOT edad = 22;

/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      1 | Juan   |   19 |           2 |
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+
*/


/* Los estudiantes con nombre 'Juan' */
SELECT * FROM estudiante
WHERE nombre = 'Juan';

SELECT * FROM estudiante
WHERE nombre LIKE 'Juan';
/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      1 | Juan   |   19 |           2 |
+--------+--------+------+-------------+
*/

/* Los estudiantes con un nombre que comienza por 'J' */
SELECT * FROM estudiante
WHERE nombre LIKE 'J%';

/* =>
+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      1 | Juan   |   19 |           2 |
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+
*/


/* Los estudiantes con un nombres que tengan una 'i' */
SELECT * FROM estudiante
WHERE nombre LIKE '%i%';

/* =>
 +--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      2 | Daniel |   22 |           2 |
|      3 | Maria  |   22 |           3 |
+--------+--------+------+-------------+
 */

/* Los estudiantes con un nombres que sea 'Mari' seguido de algun otro caracter (Maria, Mario)*/
SELECT * FROM estudiante
WHERE nombre LIKE 'Mari_';

/* =>
+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      3 | Maria  |   22 |           3 |
+--------+--------+------+-------------+
*/

/*--------------------------------------------
Para ver más operadores de Strings mirar:
https://dev.mysql.com/doc/refman/5.7/en/string-functions.html#function_char-length
https://dev.mysql.com/doc/refman/5.7/en/string-comparison-functions.html#operator_like
----------------------------------------------*/


/* Los estudiantes con un codigo mayor a 2 y una edad menor a 22*/
SELECT * FROM estudiante
WHERE codigo > 2 AND edad < 22;

/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+
*/

/* Los estudiantes con un codigo mayor a 2 o una edad menor a 22*/
SELECT * FROM estudiante
WHERE codigo > 2 OR edad < 22;

/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      1 | Juan   |   19 |           2 |
|      3 | Maria  |   22 |           3 |
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+
*/

/* Los estudiantes pero con los atributos en ingles*/
SELECT codigo as code, nombre as name, edad as age, id_facultad FROM estudiante;
/* =>

+------+--------+------+-------------+
| code | name   | age  | id_facultad |
+------+--------+------+-------------+
|    1 | Juan   |   19 |           2 |
|    2 | Daniel |   22 |           2 |
|    3 | Maria  |   22 |           3 |
|    4 | Jose   |   20 |           4 |
+------+--------+------+-------------+
*/


/* Las edades de los estudiantes sin duplicados*/
SELECT DISTINCT edad FROM estudiante;
/* =>

+------+
| edad |
+------+
|   19 |
|   22 |
|   20 |
+------+
*/


