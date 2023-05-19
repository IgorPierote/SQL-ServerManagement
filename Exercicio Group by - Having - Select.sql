/*
use banco locadora
Lista de exercicios sobre Group By e Having
Utilizando o banco de dados de Locadora faça:
1) exiba a quantidade de filmes que cada genero possui
2) Exiba os genero que possuem mais do que 4 filmes cadastrados
para ele
3) Exiba a somatoria dos valores unitarios das midias 
seperados por genero
4) Mostre quantas locacoes cada cliente fez
5) Mostre quantas locacoes foram feitas em cada mes
6) Qual o valor total gasto com locacoes que cada cliente
possui
7) Mostre somente as locacoes que possuem mais do que 3 filmes
cada uma
8) Qual a quantidade de filmes foram alugados por mes e
quantas locacoes cada mes possui
9) 
*/


--1) exiba a quantidade de filmes que cada genero possui
select codGenero, count(*) as qtd
from midias
group by codGenero


--2) Exiba os generos que possuem mais do que 4 filmes cadastrados
--para ele
select codGenero, count(*) as qtd
from midias
group by codGenero
having count(*) > 4

--3) Exiba a somatoria dos valores unitarios das midias 
--seperados por genero

select sum(ValorUnit) somatoria, codGenero
from midias
group by codGenero

--4) Mostre quantas locacoes cada cliente fez
select count(*) as qtd, CodCli
from Locacao
group by CodCli

--5) MOstre quantas locacoes foram feitas em cada mes
select count(*) as qtd, month(DataLoc) mes
from Locacao
group by month(DataLoc)
order by month(DataLoc)

--6) Qual o valor total gasto com locacoes que cada cliente
--possui
select sum(ValorTotalLoc) gasto, CodCli
from Locacao
group by CodCli


--7) Mostre somente as locacoes que possuem mais do que 3 filmes
--cada uma
select CodLocacao, count(*) qtd
from ItensLocacao
group by CodLocacao
having count(*) > 3

-- 8)  Qual a quantidade de filmes foram alugados por mes e
--quantas locacoes cada mes possui
select MONTH(itl.DataDev) mes, count(*) qtdMes, 
	   count(distinct itl.CodLocacao) totLocacao,
	   count(itl.CodLocacao) totLocacaoSemDISTINCT
from ItensLocacao itl
group by MONTH(itl.DataDev)

select * from ItensLocacao where month(DataDev) = 10
order by codlocacao

select distinct codlocacao, month(DataDev), DataDev
from ItensLocacao where month(DataDev) = 10
order by codlocacao



