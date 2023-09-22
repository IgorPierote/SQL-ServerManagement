use funcionarios
--Usando T-SQL

--criando variável

declare @total decimal(10,2)

--atribui dados fixo para variável
set @total = 1234.99

--atribuir um subselect para variável
set @total = (select sum(func_salario) from funcionarios)
print 'Total de salários dos funcionários:' +
		cast(@total as varchar(15))
if @total <13000 begin
	print 'Seus funcionários são explorados'
	end
	else begin
	print 'São funcionários ainda são explorados'
	end

if exists (select func_nome from funcionarios
			where func_nome = 'maria')
		print 'a funcionária maria foi encontrada'
		else
		print'a funcionaria maria não foi encontrada'
declare @contador int =1

while @contador <=10 begin
	print 'contador --->' + cast (@contador as varchar(2))
	----Ou outra forma de converter
	print concat('Contador', @contador)
	----acrescentar o contador
	set @contador =1
end
print 'Fim'


select  f.func_nome, case f.setor_id 
								when 1 then 'Setor 1'
								when 2 then 'Setor 2'
								when 3 then 'Setor 3'
								else 'Sem setor'
								end as campo
from funcionarios f

--searched case
select  f.func_nome, case 
								when f.setor_id >= 1 and f.setor_id<=3
									then 'Setor conhecido'
								when  f.setor_id >= 4 and f.setor_id<=20 
								then 'Setor não conhecido'
								else 'Sem setor'
							end as campo
from funcionarios f

--Exibir o salário do funcionário com aumento, dependendo do setor
--se setor =1-10%, setor=2-15%,se setor=3 -20%

select  f.func_nome,f.func_salario antigo,
f.func_salario * case setor_id
								when 1 then 1.10
								when  2 then 1.15
								when 3 then 1.2
								else 1.0
							end as campo
from funcionarios f
--------------------------------------------
select  f.func_nome,f.func_salario antigo,
f.func_salario * case
								when func_salario>=0 and func_salario<=500 then 'Assalariado'
								when func_salario>=0 and func_salario<=500 then 'Salario padrão'
								when func_salario>=0 and func_salario<=500 then 'Cargo de confiança'
								else 'Salario negativo!?!?!?!'
							end as Situação
from funcionarios f
