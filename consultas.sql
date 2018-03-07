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

/* Los estudiantes con un nombres que sea 'Mari' seguido de alguna otra letra  (Maria, Mario)*/
SELECT * FROM estudiante
WHERE nombre LIKE 'Mari_';

/* =>
+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      3 | Maria  |   22 |           3 |
+--------+--------+------+-------------+
*/

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
SELECT * FROM estudiante JOIN facultad 
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


/* Los estudiantes que son mayores de 19 junto con los estudiantes mayores de 21 */
(
  SELECT * FROM estudiante
  WHERE edad > 19
) UNION
(
  SELECT * FROM estudiante
  WHERE edad > 21
);


/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      2 | Daniel |   22 |           2 |
|      3 | Maria  |   22 |           3 |
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+
*/

/* Los estudiantes que son mayores de 19 y mayores de 21 */
/*NO FUNCIONA en MySQL*/
(
  SELECT * FROM estudiante
  WHERE edad > 19
) INTERSECT
(
  SELECT * FROM estudiante
  WHERE edad > 21
);

/*Se puede remplazar por*/

SELECT eMayorA19.codigo, eMayorA19.nombre, eMayorA19.edad, eMayorA19.id_facultad FROM
(
  SELECT * FROM estudiante
  WHERE edad > 19
) as eMayorA19
WHERE eMayorA19.codigo IN (
  SELECT codigo FROM estudiante as e2
  WHERE e2.edad > 21
);

/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      2 | Daniel |   22 |           2 |
|      3 | Maria  |   22 |           3 |
+--------+--------+------+-------------+
*/


/* Los estudiantes que son mayores de 19 pero no mayores a 21 */
/*NO FUNCIONA en MySQL*/
(
  SELECT * FROM estudiante
  WHERE edad > 19
) EXCEPT
(
  SELECT * FROM estudiante
  WHERE edad > 21
);

/*Se puede remplazar por*/

SELECT eMayorA19.codigo, eMayorA19.nombre, eMayorA19.edad, eMayorA19.id_facultad FROM
(
  SELECT * FROM estudiante
  WHERE edad > 19
) as eMayorA19
WHERE eMayorA19.codigo NOT IN (
  SELECT codigo FROM estudiante as e2
  WHERE e2.edad > 21
);

/* =>

+--------+--------+------+-------------+
| codigo | nombre | edad | id_facultad |
+--------+--------+------+-------------+
|      4 | Jose   |   20 |           4 |
+--------+--------+------+-------------+


*/
