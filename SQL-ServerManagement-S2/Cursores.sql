--Listar todos os funcion�rios que possuem a letra 'D' no nome

-- vari�veis que ser�o utilizadas pelo cursor
declare @func_nome varchar(50)
-- declara��o do cursor
declare cursor_teste cursor for
 select func_nome from funcionarios where func_nome like '%d%'
-- abertura do cursor
open cursor_teste
-- vai para o primeiro registro e preenche as vari�veis correspondentes 
FETCH NEXT FROM cursor_teste 
INTO @func_nome
while @@fetch_Status = 0 -- enquanto houver registros, fa�a
Begin
 -- imprime os dados das vari�veis
 print 'Nome: ' + @func_nome 
 -- vai para o pr�ximo registro e preenche as vari�veis correspondentes 
 FETCH NEXT FROM cursor_teste 
 INTO @func_nome
end
close cursor_Teste -- fecha o cursor
deallocate cursor_teste -- desaloca o cursor da mem�ria

---------------------------------------------------------------------------
--Listar alguns dados dos funcionarios

--Vari�veis utilizadas pelo cursor
declare @func_nome varchar(50)
declare @func_id INT
DECLARE @func_salario DECIMAL(10,2)

-- declara��o do cursor
declare cursor_teste cursor scroll for
 select func_nome, func_salario,func_id
 from funcionarios 

-- abertura do cursor
open cursor_teste

--Vai para o ultimo registro e preenche as v�riaveis correspondetes
FETCH LAST FROM cursor_teste
	INTO @func_nome, @func_salario, @func_id

WHILE @@FETCH_STATUS = 0 -- Enquanto ouver registros,
BEGIN
	--Imprime os dados das vari�veis
	PRINT CONCAT(@func_id, ' - ', @func_nome, ' - ', @func_salario)

	--Vai para o pr�ximo registro e preenche as vari�veis correspondete
	FETCH PRIOR FROM cursor_teste
		INTO @func_nome, @func_salario, @func_id
END

--Fecha o cursor
CLOSE cursor_teste
DEALLOCATE cursor_teste