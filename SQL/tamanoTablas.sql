/* Los metadatos de las tablas se guardan en information_schema.tables */

/* Para encontrar el tamano de las tablas del esquema(base de datos) 'peliculas' se puede usar la siguiente consulta*/
SELECT table_schema, table_name , data_length as data_length_in_bytes, index_length as index_length_in_bytes
FROM information_schema.tables 
WHERE table_schema = 'peliculas';

/* En MySQL Workbench se puede buscar la misma informacion haciendo click en la infromacion de la base de datos*/

