/* El numero de profesores*/
SELECT COUNT(*) 
FROM profesor;

/* =>
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
*/

/* El salario promedio de los profesores */
SELECT AVG(profesor.salario) 
FROM profesor;

/* El minimo salario */
SELECT MIN(profesor.salario) 
FROM profesor;

/* El maximo salario */
SELECT MAX(profesor.salario) 
FROM profesor;

/* La suma de todos los salarios */
SELECT SUM(profesor.salario) 
FROM profesor;


/* La suma de los salarios agrupados por id_facultad */
SELECT id_facultad, SUM(profesor.salario) 
FROM profesor
GROUP BY id_facultad;


/* La suma de los salarios agrupados por id_facultad donde
 esa suma es mayor a 2000*/
SELECT id_facultad, SUM(profesor.salario) 
FROM profesor
GROUP BY id_facultad
HAVING SUM(profesor.salario) > 2000;




