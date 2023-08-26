--USANDO T-SQL

USE funcionarios

--Criando V�riavel

DECLARE @total DECIMAL(10,2)

--Atribuir dados para variavel

SET  @total = 1234.99

--Atribuir um subselect para uma variavel

SET @total = (SELECT SUM(func_salario) FROM funcionarios)

--Exibir dados

PRINT 'Total do Sal�rio dos Funcionarios: ' +
	CAST(@total AS VARCHAR (15))

IF @total < 130000 BEGIN
	PRINT 'Seus funcionarios est�o economicos'
END
ELSE BEGIN
	PRINT 'Voc� tem muito gasto com seus funcion�rios'
END

IF EXISTS (SELECT func_nome FROM funcionarios
			WHERE func_nome = 'maria')
	PRINT 'A funcionaria Maria foi encontrada'
ELSE
	PRINT 'A funcionaria Maria n�o existe'