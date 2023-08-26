--USANDO T-SQL

USE funcionarios

--Criando Váriavel

DECLARE @total DECIMAL(10,2)

--Atribuir dados para variavel

SET  @total = 1234.99

--Atribuir um subselect para uma variavel

SET @total = (SELECT SUM(func_salario) FROM funcionarios)

--Exibir dados

PRINT 'Total do Salário dos Funcionarios: ' +
	CAST(@total AS VARCHAR (15))

IF @total < 130000 BEGIN
	PRINT 'Seus funcionarios estão economicos'
END
ELSE BEGIN
	PRINT 'Você tem muito gasto com seus funcionários'
END

IF EXISTS (SELECT func_nome FROM funcionarios
			WHERE func_nome = 'maria')
	PRINT 'A funcionaria Maria foi encontrada'
ELSE
	PRINT 'A funcionaria Maria não existe'