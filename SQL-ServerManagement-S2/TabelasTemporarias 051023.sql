--Uso de tabelas temporárias
--Criando uma tabela local
USE funcionarios

-- Usando # se cria uma tabela temporária baseada na sessão
-- A tabela temporária funciona como qualquer outra tabela podendo receber inserts etc.

CREATE TABLE #minhaTabela (
	cod INT PRIMARY KEY IDENTITY(1, 1),
	nome VARCHAR(50)
)

select * from #minhaTabela

--Criando uma tabela temporária GLOBAL
-- A tabela temporária GLOBAL funciona como qualquer outra tabela podendo receber inserts etc.
-- Ela fica disponível enquanto a sessão onde ela foi criada estiver aberta, enquanto estiver
-- Disponivel ficara disponivel para qualquer outra sessão.
CREATE TABLE ##Tab_Global (
	placa VARCHAR(10) PRIMARY KEY,
	modelo VARCHAR(100)
)

-------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE sp_lista_Func_aumento AS
BEGIN

	--Cria uma tabela temporaria apartir de funcionários
	SELECT * INTO #tabTemp FROM funcionarios

	UPDATE #tabTemp SET func_salario *= 1.10

	--Devolve os dados simulados

	SELECT * FROM #tabTemp
END

--Listado a tabela de funcionários com 10% de aumento
EXEC sp_lista_Func_aumento