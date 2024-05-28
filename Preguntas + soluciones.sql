-- 1.¿Cuáles son los detalles de todos los coches vendidos en el año 2023?
SELECT c.*
FROM sales s
JOIN cars c
ON s.car_id = c.car_id
WHERE YEAR(s.purchase_date) = 2023;

-- 2.¿Cuál es la cantidad total de autos vendidos por cada vendedor?
SELECT s.salesman_id AS idVendedor, sp.name AS Nombre, COUNT(S.sale_id) AS CantidadVendida_$
FROM sales s
JOIN salespersons sp
ON s.salesman_id = sp.salesman_id
JOIN cars c
ON s.car_id = c.car_id
GROUP BY s.salesman_id;

-- 3.¿Cuál es el ingreso total generado por cada tipo de automóvil? Utilice la columna cost_$
SELECT CONCAT(c.make," ", c.type, " ",c.style) AS Automóvil, sum(c.cost_$) AS IngresoTotal_$
FROM cars c
JOIN sales s
ON c.car_id = s.car_id
GROUP BY c.car_id
ORDER BY IngresoTotal_$ DESC;

-- 4.Muestre el detalle de los autos vendidos en el año 2022 por el vendedor Tom Lee
SELECT c.* 
FROM sales s
JOIN salespersons sp
ON s.salesman_id = sp.salesman_id
JOIN cars c
ON s.car_id = c.car_id
WHERE sp.name = "Tom Lee" AND YEAR(s.purchase_date) = 2022;

-- 5.¿Cuál es el nombre y ciudad del vendedor que vendió la mayor cantidad de autos en el año 2023?
SELECT sp.name AS Nombre, sp.city Ciudad, COUNT(s.sale_id) AS CantidadAutosVendidos2023
FROM sales s
JOIN salespersons sp
ON s.salesman_id = sp.salesman_id
JOIN cars c
ON s.car_id = c.car_id
WHERE YEAR(s.purchase_date) = 2023
GROUP BY s.salesman_id
ORDER BY CantidadAutosVendidos2023 DESC
LIMIT 1;

-- 6.¿Cuál es el nombre y la edad del vendedor que generó mayores ingresos en el año 2022?
SELECT sp.name AS Nombre, sp.age Edad, SUM(c.cost_$) AS Ingresos_$
FROM sales s
JOIN salespersons sp
ON s.salesman_id = sp.salesman_id
JOIN cars c
ON s.car_id = c.car_id
WHERE YEAR(s.purchase_date) = 2022
GROUP BY s.salesman_id
ORDER BY Ingresos_$ DESC
LIMIT 1;