/* Los profesores con nombre Jhon o Liz */
SELECT * 
FROM profesor
WHERE profesor.nombre IN ('Jhon', 'Liz'); 


/* Los profesores que pertenezcan a una facutlad que comience por O */
SELECT * 
FROM profesor
WHERE profesor.id_facultad IN (
  SELECT id_facultad
  FROM facultad
  WHERE facultad.nombre LIKE 'O%'
); 

/* Todos los profesores que tengan un mayor salario que algun profesor */
SELECT *
FROM profesor
WHERE profesor.salario > SOME (
  SELECT p.salario
  FROM profesor as p
);

/* Los profesores que tengan un salario mayor o igual que todos los profesores de la facultad con id = 1 */
SELECT *
FROM profesor
WHERE profesor.salario >= ALL (
  SELECT p.salario
  FROM profesor as p
  WHERE profesor.id_facultad = 1
);

/* Los profesores en donde existe una facultad donde id_facultad es la misma que su id_facultad */
SELECT *
FROM profesor
WHERE EXISTS (
  SELECT * 
  FROM facultad
  WHERE profesor.id_facultad = facultad.id_facultad
);


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



