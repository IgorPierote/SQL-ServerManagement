USE  NorthWind

-- Revisão

--1) Liste o numero da ordem, sua data de criaçâo eo nome de cliente

SELECT o.OrderID, o.OrderDate, c.ContactName
FROM Orders o, Customers c

--2) Liste o nome de todos os empregados que moram no terrirtorio "Providence"

--3) Quantos empregados resaidem em cada cidade

SELECT count(*) Qtd, City
FROM Employees
GROUP BY City

--4) Exiba o nome do cliente (custumer) ea quantidade de pedidos (orders) que cada um possui. 
--Faça isso ordenado pela quantidade decrescente

--Toda tabela da direita é aquela que está na frente do FROM e a da direita é a da frente do join.
--INNER JOIN Traz todos que estão interligados entre as duas tabelas
--LEFT JOIN tras todos que estão na tabela da esquerda independete de ter na tabela direita.
--RIGHT JOIN tras todos que estão na tabela da direita independe deles estarem também na esquerda.

SELECT C.ContactName, COUNT(*) qtd 
FROM Customers C
LEFT JOIN Orders O
	ON(O.CustomerID = C.CustomerID)
GROUP BY C.ContactName
ORDER BY qtd desc

--5) Liste o nome de todos os produtos que NUNCA foram vendidos

SELECT * FROM [Order Details]

SELECT ProductName 
FROM Products P
LEFT JOIN [Order Details] O
	ON(P.ProductID = O.ProductID)
WHERE O.OrderID IS NULL