USE NorthWind

--1)
SELECT empregado.FirstName empregado, supervisor.FirstName supervisor
FROM Employees empregado
LEFT JOIN Employees supervisor
	ON supervisor.EmployeeID = empregado.ReportsTo

SELECT empregado.FirstName empregado, 
	(SELECT supervisor.Firstname
		FROM Employees supervisor
		WHERE supervisor.EmployeeID = empregado.ReportsTo)
	FROM Employees empregado

--2)
SELECT p.ProductName, od.OrderID, od.Quantity
FROM Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
ORDER BY p.ProductName 


SELECT od.OrderID, od.Quantity,
	(SELECT p.ProductName
		FROM Products p
		WHERE p.ProductID = od.ProductID
		) ProductName
FROM [Order Details] od
ORDER BY ProductName 


--3)
SELECT s.ContactName, COUNT(p.ProductID) qtd
FROM Suppliers s
LEFT JOIN Products p on s.SupplierID =  p.SupplierID
GROUP BY s.ContactName

SELECT s.ContactName,
	(SELECT COUNT(p.ProductID)
		FROM Products p
		where s.SupplierID = p.ProductID) qtd
FROM Suppliers s
ORDER BY ContactName

--4)
SELECT s.ContactName, COUNT(p.ProductID) qtd
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.ContactName
HAVING  COUNT(p.ProductID) > 2

SELECT s.ContactName,
	(SELECT COUNT(p.ProductID)
		FROM Products p
		where s.SupplierID = p.ProductID) qtd
FROM Suppliers s
WHERE (SELECT COUNT(p.ProductID)
		FROM Products p
		where s.SupplierID = p.ProductID) > 2
ORDER BY ContactName

--5) Traga o nome do territorio eo nome da regiao
--com join
SELECT t.TerritoryDescription, r.RegionDescription
FROM Territories t
INNER JOIN Region r ON t.RegionID = r.RegionID

--SUBSELECT
SELECT t.TerritoryDescription,
	(SELECT r.RegionDescription
		FROM Region r
		WHERE t.RegionID = r.RegionID)
FROM Territories t

--6 Exiba o nome de todos os funcionarios que a descrição do territorio desse funcuionario que começa com a letra w

-- COM JOIN
SELECT e.FirstName
FROM Employees e
INNER JOIN EmployeeTerritories et
	ON e.EmployeeID = et.EmployeeID
INNER JOIN Territories t
	ON t.TerritoryID = et.TerritoryID
WHERE t.TerritoryDescription LIKE 'w%'

-- SUB SELECT
 SELECT(SELECT(SELECT e.FirstName
				FROM Employees e
				WHERE e.EmployeeID = et.EmployeeID)
		FROM EmployeeTerritories et
		WHERE et TerritoryID = t.TerritoryID
		)
FROM Territories t
WHERE t.TerritoryDescription




