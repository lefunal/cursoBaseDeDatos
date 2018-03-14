/* 
 4.	¿Cuáles son las películas con actores cuyo tomatometer promedio sea mayor a 80%?
 */

/* Solucion usando Joins*/
SELECT * 
FROM pelicula, actor, (
	SELECT actor2.nombre, AVG(actor2.tomatometer)
	FROM actor as actor2
	GROUP BY actor2.nombre
	HAVING AVG(actor2.tomatometer) > 0.8
) AS actoresConBuenosPomedios
WHERE actoresConBuenosPomedios.nombre = actor.nombre AND 
actor.tituloPelicula = pelicula.tituloPelicula ;

/* Solucion usando IN */
SELECT * 
FROM pelicula, actor
WHERE pelicula.tituloPelicula = actor.tituloPelicula 
AND 
actor.nombre IN (
	SELECT actor2.nombre
	FROM actor as actor2
	GROUP BY actor2.nombre
	HAVING AVG(actor2.tomatometer) > 0.8
);
