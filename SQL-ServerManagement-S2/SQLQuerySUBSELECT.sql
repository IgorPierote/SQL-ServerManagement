USE NorthWind
/*

USANDO SUB CONSULTAS

1) Lsitar o numero do produto, sua descrição eo nome da sua categoria
*/

-- COM JOIN, buscando 1 campo de categoria

SELECT p.ProductID, p.ProductName,
		c.categoryName
FROM Products p
INNER JOIN Categories c
		ON p.CategoryID = c.CategoryID

--COM SUB SELECT
/*
-Todo sub-select deve estar entre parenteses
-Tabela externa Select principal, tabela interna a que está entre parenteses
-Para cada registro da tabela externa ele lê todos os registros da tabela interna (isto no sub-select)
*/
SELECT p.ProductID, p.ProductName,
		(SELECT c.categoryName FROM Categories c
			WHERE p.CategoryID = c.CategoryID) NomeCategoria
FROM Products p

--------------------------------------------------------------------------------

-- COM JOIN, buscando 2 campo de categoria

SELECT p.ProductID, p.ProductName,
		c.categoryName, c.Description
FROM Products p
INNER JOIN Categories c
		ON p.CategoryID = c.CategoryID

--COM SUB SELECT buscando 2 campo de categoria

SELECT p.ProductID, p.ProductName,
		(SELECT c.categoryName FROM Categories c
			WHERE p.CategoryID = c.CategoryID) NomeCategoria,
		(SELECT c.Description FROM Categories c
			WHERE p.CategoryID = c.CategoryID) Descricao
FROM Products p

-------------------------------------------------------------------------------------------

--Retornando quantidade de produtos por categoria

-- COM JOIN
SELECT c.CategoryName, COUNT(p.ProductID) qtd
FROM Categories c
LEFT JOIN Products p
	ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName

--COM SUBSELECT
SELECT c.CategoryName,
	(SELECT COUNT(*) FROM Products p
		WHERE p.CategoryID = c.CategoryID) qtd
FROM Categories c

--------------------------------------------------------------------------------------------------

--USANDO SUBSELECT PARA RESTRIÇÃO 
--Listar todas as categorias que possuem mais que 10 produtos

-- COM JOIN
SELECT c.CategoryName, COUNT(p.ProductID) qtd
FROM Categories c
LEFT JOIN Products p
	ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(p.ProductID) > 10

--COM SUBSELECT
SELECT c.CategoryName,
	(SELECT COUNT(*) FROM Products p
		WHERE p.CategoryID = c.CategoryID) qtd
FROM Categories c
	WHERE (SELECT COUNT(*) FROM Products p
				WHERE p.CategoryID = c.CategoryID) > 10
