use funcionarios
--Continuação de stored procedures

/*
Itens:
1: Retorno de inteiro da SP
2: Geração de identificadores (PK) nas SP de inserção
*/

--Exemplo Item 1: 
CREATE PROCEDURE sp_insereSetor_3(
					@codigo INT,
					@descricao VARCHAR(50))
AS
BEGIN
	IF NOT EXISTS(SELECT setor_id FROM setores WHERE setor_id = @codigo)
	BEGIN
		INSERT INTO  setores (setor_id, setor_nome)
			VALUES (@codigo,@descricao)
		RETURN 1 --Gravado com sucesso
	END
	ELSE
		RETURN 0 --Erro ao gravar! registro existe.
END

--Chamada

DECLARE @ret INT
EXEC @ret = sp_insereSetor_3 10,'Carpintaria'
IF @ret = 1 
	PRINT 'Setor gravado com sucesso'
ELSE
	PRINT 'Ocorreu erro na gravação'

--Inserindo um setor que nuemra automáticamente

CREATE OR ALTER PROCEDURE sp_insereSetorAutomatico(@descricao VARCHAR(50))
AS
BEGIN
	--Descobre o próximo código livre
	DECLARE @proximo INT = (SELECT ISNULL(MAX(setor_id), 0) FROM setores) +1
	INSERT INTO setores ( setor_id, setor_nome)
		VALUES (@proximo, @descricao)
	IF @@ERROR = 0
		RETURN 1 --Gravado com sucesso
	ELSE
		RETURN 0 --Erro ao gravar! registro existe.
END

DECLARE @num INT = NULL
PRINT ISNULL (@num,0) +1
PRINT @num + 1

SELECT ISNULL (MAX(setor_id),0) + 1 FROM setores	
	where setor_nome = ''

--Chamada
DECLARE @ret INT
EXEC @ret = sp_insereSetorAutomatico 'Decapagem'
IF @ret = 1
	PRINT 'Setor gravado com sucesso'
ELSE
	PRINT 'Ocorreu erro na gravação'


-- Criando uma tavela com campo autonumerado
CREATE TABLE setores_auto (
	--Numeração começa com 1 e incrementa de 1 em 1
	setor_id INT IDENTITY (1,1) PRIMARY KEY,
	setor_nome VARCHAR(50)
)

INSERT INTO setores_auto (setor_nome)
				VALUES('Compras') --ok


--Criando uma SP que insere dados na tabela com autonumeração
CREATE OR ALTER PROCEDURE sp_incluiAuto (
			@descricao VARCHAR(50),
			@codigoGerado INT OUTPUT) AS
BEGIN
	INSERT INTO setores_auto (setor_nome)
				VALUES (@descricao)
			--Descobre quem foi inserido
			SET @codigoGerado = @@IDENTITY
END

--Chamada
DECLARE @codigo INT
EXEC sp_incluiAuto 'Carpintária', @codigo OUT
PRINT CONCAT('Codigo gerado: ', @codigo)

SELECT * FROM setores_auto