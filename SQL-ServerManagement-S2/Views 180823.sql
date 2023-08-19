USE NorthWind

/*
	View � uma instru��o que retorna dados e � salva no banco de dados com um nome, ou seja, passa a ser um 
objeto do banco de dados. Quando uma view � executada, esta retorna um conjunto de dados no formato de uma 
tabela. Uma view pode retornar dados de uma ou mais tabelas.

As principais vantagens na utiliza��o de views s�o:
	1 - Ocultar a complexidade do acesso a dados, criando uma view que consolida o acesso a v�rias tabelas;
	2 - Simplificar a atribui��o de permiss�es, uma vez que uma view pode ser pressionada de forma mais simples 
		do que se fossem pressionadas todas as tabelas que a constituem. 
	3 - Facilitar o desenvolvimento e manuten��o de aplica��es, dado que se alguma tabela sofrer alguma 
		altera��o, a aplica��o ter� que ser modificada, o que pode ser evitado caso seja utilizada uma view.

As principais limita��es na utiliza��es de view s�o:
	1 - Somente podemos utilizar uma view no banco de dados atual, embora este possa acessar dados de 
		tabelas de outros bancos de dados ou at� mesmo de outros servidores.
	2 - Uma view pode ter, no m�ximo, 10234 colunas.
	3 - O usu�rio que est� criando a view deve, obviamente, ter acesso a todas as colunas inclu�das na view.
	4 - Podemos aninhar view, isto �, uma view pode referenciar outra, at� um n�vel de 32 views aninhadas.

	OBS: As create view est�o aparecendo como erradas mas est�o sendo executadas corretamente
*/

--Sele��o por colunas

CREATE OR ALTER VIEW vw_produtos_tot_estoque AS
	SELECT p.ProductID, p.ProductName,
			p.UnitPrice * p.UnitsInStock AS financeiro 
	FROM Products p

-- Chamada por colunas 
SELECT* FROM vw_produtos_tot_estoque

--Select por registros
CREATE OR ALTER VIEW  vw_estoque_baixo AS
	SELECT * FROM Products
	WHERE UnitsInStock = 0

--Executando
SELECT * FROM vw_estoque_baixo

--Ligando tabelas de dentro da view
CREATE OR ALTER VIEW vw_produto_fornecedor AS
	SELECT s.*, p.ProductID, p.ProductName, p.QuantityPerUnit,
				p.CategoryID, p.UnitsInStock
	FROM Products p 
	INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID

--Chamada
SELECT * FROM vw_produto_fornecedor

--Fazendo joins com as views
SELECT vw.ProductName, vw.CompanyName, c.CategoryName
FROM vw_produto_fornecedor vw
INNER JOIN Categories c ON vw.CategoryID = c.CategoryID

--Transformando o select acima em uma view
CREATE OR ALTER VIEW vw_total_nomes AS
	SELECT vw.ProductName, vw.CompanyName, c.CategoryName
	FROM vw_produto_fornecedor vw
	INNER JOIN Categories c ON vw.CategoryID = c.CategoryID	

--Chamada
SELECT * FROM vw_total_nomes

-------------------------------------------------------------------------------------------------------------------------------------
--recompilando views, caso seja alterado a estrutura de alguma tabela
SP_REFRESHVIEW vw_total_nomes

--como exibir as dependencias da tabela
SELECT * FROM sys.sql_expression_dependencies
WHERE referenced_id = OBJECT_ID('Products');
GO
--Ou clica na tabela com bot�o direito e exibir dependencias