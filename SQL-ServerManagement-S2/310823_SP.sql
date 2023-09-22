--Uso de SP
create or alter procedure Retorna_funcionarios as select * from funcionarios

--chamando a SP
exec Retorna_funcionarios