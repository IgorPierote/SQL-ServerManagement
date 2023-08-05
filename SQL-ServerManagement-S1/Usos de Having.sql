--Exiba a somatoria dos salarios dos funcionarios exibindo esse valor por ano de nascimento

USE funcionarios

SELECT YEAR(f.func_datanasc) ano, SUM(f.func_salario) 
FROM funcionarios AS f ORDER BY func_salario

--Listar todos os setores que não possuem funcionarios

SELECT * FROM setores S
LEFT JOIN funcionarios F ON S.setor_id = F.setor_id
WHERE F.func_id IS NULL

-- Uso da clausula having

SELECT f.setor_id, COUNT(f.func_id) qtd FROM funcionarios f
INNER JOIN setores s ON s.setor_id = f.setor_id GROUP BY f.setor_id HAVING COUNT(f.func_id) > 4 

-- Quais setores possuem mais que 4 funcionarios e que a soma dos salarios deles seja maior que 3000

SELECT f.setor_id, COUNT(f.func_id) qtd, SUM(f.func_salario) FROM funcionarios f
INNER JOIN setores s ON s.setor_id = f.setor_id GROUP BY f.setor_id 
HAVING COUNT(f.func_id) > 4 AND SUM(f.func_salario) > 3000