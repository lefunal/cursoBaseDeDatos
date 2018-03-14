/*Subirle el sueldo un 10% a todos los profesores*/
UPDATE profesor
SET salario = salario*1.1;

/*Subirle el sueldo un 10% a todos los profesores que tengan un salario menor a 2000*/
UPDATE profesor
SET salario = salario*1.1
WHERE salario < 2000;

/*
  Subirle el sueldo un 10% a todos los profesores que tengan un salario menor a 2000,
  Sugirle en 5% si esta entre 2000 y 3000
  y bajarle un 5% de lo contrario
  */
UPDATE profesor
SET salario = CASE
  WHEN salario < 2000 THEN salario*1.1
  WHEN salario < 3000 THEN salario*1.05
  ELSE salario*0.95
END;

/* A todos los profesores subirles el salario por el numero de estudiantes*/
UPDATE profesor p
SET salario = p.salario + (
  SELECT COUNT(*)
  FROM estudiante
);

