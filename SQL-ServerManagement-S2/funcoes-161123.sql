USE funcionarios

--Uso de fun��es ESCALARES

CREATE FUNCTION dbo.AplicaAumento
(	--Parametros
	@principal DECIMAL(10,2),
	@porcentagem DECIMAL(10,2)
)
RETURNS DECIMAL(10,2) --Vai retornar um valor decimal
AS
BEGIN
	--	Coloca aqui o c�digo para a fun��o
	DECLARE @resultado DECIMAL(10,2)
	SET @resultado = @principal + (@principal + @porcentagem / 100)

	--devolve o resultado
	RETURN @resultado --Tem que ser comp�tivel com o returns
END

--Chamada
SELECT dbo.AplicaAumento(1000, 10) AS resultado
--Chamando fun��o junto � tabela
SELECT f.func_nome, f.func_salario Original,
		dbo.AplicaAumento(f.func_salario, 15) Novo
FROM funcionarios f

--Chamando fun��o na clausula where

SELECT * FROM funcionarios
WHERE dbo.AplicaAumento(func_salario, 15) > 5000


--------------------------------------------------------------------

--Fun��es que retornam Tabela
--1 Forma (Dentro da fun��o s� pode existir um comando select)
CREATE FUNCTION dbo.Intervalo
(
	@menorValor DECIMAL(10,2),
	@maiorValor DECIMAL(10,2)
)
RETURNS TABLE
AS 
RETURN
(
	SELECT * FROM funcionarios
	WHERE func_salario BETWEEN @menorValor AND @maiorValor
)

--Chamado
SELECT * FROM dbo.Intervalo(1000, 2000)

--Com join
SELECT t.func_nome, t.func_salario, s.setor_nome
FROM dbo.Intervalo(1000, 2000) t
INNER JOIN setores s ON s.setor_id = t.setor

