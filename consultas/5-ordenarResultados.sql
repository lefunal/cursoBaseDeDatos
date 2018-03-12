/* Los profesores ordenados por salario*/
SELECT * 
FROM profesor
ORDER BY profesor.salario;

/* Los profesores ordenados descendentemente por salario y luego ascendentemente por nombre*/
SELECT * 
FROM profesor
ORDER BY profesor.salario DESC, nombre ASC;

/* Los dos profesores con mayor salario */
SELECT * 
FROM profesor
ORDER BY profesor.salario;
LIMIT 2;

/* De los profesores con mayor salario escoger los primeros 3 comenzando desde el puesto 2*/
SELECT * 
FROM profesor
LIMIT 2,3;



