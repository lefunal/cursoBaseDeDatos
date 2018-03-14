/*
Para este taller vamos a usar la herramienta RelaX, que se puede encontrar en:
https://dbis-uibk.github.io/relax/
Usando el Dataset: Database Systems The Complete Book - Exercise 2.4.1
 */

/*1. Retorna todos los productos del maker A.*/
SELECT * 
FROM Product
WHERE Product.maker = 'A';


/*2. Retorna todos los productos del type pc.*/
SELECT * 
FROM Product
WHERE Product.type = 'pc';

/*3. Retorna todos los productos con un type que comienza por la letra p.*/
SELECT * 
FROM Product
WHERE Product.type LIKE 'p%';

/*4. Retorna solo el maker y el model del maker A.*/
SELECT Product.maker, Product.model 
FROM Product
WHERE Product.maker = 'A';

/*5. Retorna todos los productos pero con las columnas retornadas con nombres en español*/
SELECT Product.maker as fabricante, Product.model as modelo, Product.type as tipo
FROM Product;

/*6. Retorna todos los tipos de productos sin duplicados*/
SELECT DISTINCT *
FROM Product;

/*7. Retorna todas las posibles combinaciones entre productos y PCs*/
SELECT *
FROM Product, PC;

/*8. Retorna todas los PCs con sus fabricantes respectivos*/
SELECT *
FROM Product, PC
WHERE Product.model = PC.model;

SELECT *
FROM Product JOIN PC ON (Product.model = PC.model);

/*9. Retorna todos los productos y si es un PC entonces también los atributos del PC respectivo.*/
SELECT *
FROM PC RIGHT OUTER JOIN Product ON (Product.model = PC.model);

/* En relax outer parece que debe estar en minusculas*/
SELECT *
FROM Product LEFT OUTER JOIN PC ON (Product.model = PC.model);

/*10. Retorna el modelo y precio de todos los productos*/
(
	SELECT Product.model, PC.price
	FROM Product JOIN PC ON (Product.model = PC.model)
)
UNION
(
	SELECT Product.model, Laptop.price
	FROM Product JOIN Laptop ON (Product.model = Laptop.model)
)
UNION
(
	SELECT Product.model, Printer.price
	FROM Product JOIN Printer ON (Product.model = Printer.model)
);

/*11. Retornar todos los laptops y PCs con un precio mayor a 900*/
/*Se uso -1 como un screen indefinido pero otra opcion mejor ubiera sido NULL*/
(
    SELECT PC.model, PC.speed, PC.ram, PC.hd, PC.price, -1 AS screen
	FROM PC
	WHERE price > 900
)
UNION (
	SELECT *
	FROM Laptop
);
