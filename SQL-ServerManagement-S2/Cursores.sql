--Listar todos os funcionários que possuem a letra 'D' no nome

-- variáveis que serão utilizadas pelo cursor
declare @func_nome varchar(50)
-- declaração do cursor
declare cursor_teste cursor for
 select func_nome from funcionarios where func_nome like '%d%'
-- abertura do cursor
open cursor_teste
-- vai para o primeiro registro e preenche as variáveis correspondentes 
FETCH NEXT FROM cursor_teste 
INTO @func_nome
while @@fetch_Status = 0 -- enquanto houver registros, faça
Begin
 -- imprime os dados das variáveis
 print 'Nome: ' + @func_nome 
 -- vai para o próximo registro e preenche as variáveis correspondentes 
 FETCH NEXT FROM cursor_teste 
 INTO @func_nome
end
close cursor_Teste -- fecha o cursor
deallocate cursor_teste -- desaloca o cursor da memória

---------------------------------------------------------------------------
--Listar alguns dados dos funcionarios

--Variáveis utilizadas pelo cursor
declare @func_nome varchar(50)
declare @func_id INT
DECLARE @func_salario DECIMAL(10,2)

-- declaração do cursor
declare cursor_teste cursor scroll for
 select func_nome, func_salario,func_id
 from funcionarios 

-- abertura do cursor
open cursor_teste

--Vai para o ultimo registro e preenche as váriaveis correspondetes
FETCH LAST FROM cursor_teste
	INTO @func_nome, @func_salario, @func_id

WHILE @@FETCH_STATUS = 0 -- Enquanto ouver registros,
BEGIN
	--Imprime os dados das variáveis
	PRINT CONCAT(@func_id, ' - ', @func_nome, ' - ', @func_salario)

	--Vai para o próximo registro e preenche as variáveis correspondete
	FETCH PRIOR FROM cursor_teste
		INTO @func_nome, @func_salario, @func_id
END

--Fecha o cursor
CLOSE cursor_teste
DEALLOCATE cursor_teste