USE NorthWind

SELECT * FROM Products

/*BETWEEN*/
SELECT * FROM Products 
WHERE UnitsInStock BETWEEN 20 AND 50

 --======================================================================================

/* AS / Apelido */
 SELECT ProductName AS Produtos, CategoryID AS Categoria  FROM Products  

 /* OR */
 SELECT  ProductName AS Produtos, CategoryID AS Categoria  FROM Products p
 WHERE p.CategoryID IN (2,6,8)

  --======================================================================================

 /* NOT BETWEEN */
 SELECT * FROM Products p 
 WHERE p.UnitPrice NOT BETWEEN 30 AND 90 ORDER BY UnitsInStock

  --======================================================================================


 USE funcionarios

 /* Uso de LIKE */
-- Todos os funcionarios que começam com B
 SELECT * FROM funcionarios WHERE func_nome LIKE 'b%'
-- Todos os funcionarios que terminam com O
 SELECT * FROM funcionarios WHERE func_nome LIKE '%o'
-- Todos os funcionarios que possuem IR em qualquer lugar
 SELECT * FROM funcionarios WHERE func_nome LIKE '%ir%'
-- Todos os funcionarios quea segunda letra for A
 SELECT * FROM funcionarios WHERE func_nome LIKE '_a%'

 --======================================================================================

-- Uso do DISTINCT
-- Listar distintamente todos os setores que possuem funcionarios
 SELECT DISTINCT setor_id FROM funcionarios

  --======================================================================================

-- Uso do TOP

-- Mostrar o top 5 primeiros funcionarios
	
SELECT TOP 5 * FROM funcionarios

-- Mostrar o top 3 funcionarios mais novos 

SELECT TOP 3 * FROM funcionarios ORDER BY func_dataNasc DESC

-- Mostrar o top 7 funcionarios que ganham mais

SELECT TOP 7 * FROM funcionarios ORDER BY func_salario DESC

--Mostra os 5 funcionarios mais novos que nasceram depois de 1980
SELECT TOP 5 * FROM funcionarios WHERE YEAR(func_dataNasc) > 1980 ORDER BY func_dataNasc DESC