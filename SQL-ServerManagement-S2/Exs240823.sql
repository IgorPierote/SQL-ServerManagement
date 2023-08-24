USE Locadora

SELECT * FROM Midias

--1) Crie uma view chamada vw_nuncaLocados, que exiba
--o nome, codigo dos filmes e genero que nunca foram alugados


CREATE OR ALTER VIEW vw_nuncaLocados AS
	SELECT  M.CodMidia, M.DescMidia, G.codGenero
	FROM Midias M
	LEFT JOIN ItensLocacao I ON M.CodMidia = I.CodMidia
	LEFT JOIN Genero G ON G.Codgenero = M.codGenero
	WHERE I.CodLocacao IS NULL
	 
SELECT * FROM vw_nuncaLocados


--2) Crie uma view chamada vw_ClienteSemLocacao, que exiba
--o nome e codigo dos clientes que nunca fizeram uma locação

CREATE OR ALTER VIEW vw_ClienteSemLocacao AS
	SELECT C.Cliente, C.CodCli 
	FROM Cliente C
	LEFT JOIN Locacao L ON C.CodCli = L.CodCli
	WHERE L.CodLocacao IS NULL

SELECT * FROM vw_ClienteSemLocacao

--3) Crie uma view chamada vw_Top5, que exiba
--o nome e codigo dos 5 filmes mais alugados

CREATE OR ALTER VIEW vw_Top5 AS
	SELECT TOP 5  M.CodMidia, M.DescMidia, COUNT(*) qtd
	FROM Midias M
	INNER JOIN ItensLocacao I ON M.CodMidia = I.CodMidia
	GROUP BY  M.DescMidia, M.CodMidia
	ORDER BY qtd DESC


SELECT * FROM vw_Top5

--4) Crie uma view chamada vw_LocacaoTOP, que exiba o 
--nome dos clientes de maneira distinta que fizeram locações de algum dos filmes Top5 (use a view do ex_3)

CREATE OR ALTER VIEW vw_LocacaoTOP AS
	SELECT C.Cliente,
		(SELECT TOP 5  M.CodMidia, M.DescMidia, COUNT(*) qtd
			FROM Midias M
			INNER JOIN ItensLocacao I ON M.CodMidia = I.CodMidia
			GROUP BY  M.DescMidia, M.CodMidia) maisVendidos
	FROM CLIENTE C
	INNER JOIN Locacao L ON L.CodCli = C.CodCli
	INNER JOIN ItensLocacao I ON L.CodLocacao = I.CodLocacao

	

--5) Crie uma view chamada vw_genero, que exiba o 
--codigo e descrição do genero de todos os filmes que nunca
--foram locados (use view do ex_1)

--6) Cria uma view chamada vw_ClienteTOP, que exiba
--os 5 nomes de clientes com codigo, que fizeram o maior
--numero de locações