/* https://dev.mysql.com/doc/refman/5.7/en/create-index.html */

/* Crear un indice sobre un solo atributo */
/* Nombre: i_estudiante_edad, en la tabla estudiatne sobre el atributo edad  */
CREATE INDEX i_estudiante_edad ON estudiante (edad);

/* Eliminar indice */
ALTER TABLE estudiante DROP INDEX i_estudiante_edad;




/* Crear un indice sobre 2 atributo (podrian ser mas) */
/* Nombre: i_estudiante_edad_nombre, en la tabla estudiatne sobre el atributos edad y nombre  */
CREATE INDEX i_estudiante_edad_nombre ON estudiante (edad, nombre);

/* Eliminar indice */
ALTER TABLE estudiante DROP INDEX i_estudiante_edad_nombre;






