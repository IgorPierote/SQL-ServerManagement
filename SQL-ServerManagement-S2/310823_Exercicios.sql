--Exercicio TSQL
--1)Crie um conjunto de comandos que exiba a tabuada de um numero qualquer ex:
/*
5*1=5
5*2=10
...
5*10=50
*/

declare @x int
declare @count int 

set @x=5
set @count=1

while @count<11 
begin
   print concat(@x,'*',@count,'=',cast((@x*@count) as varchar(2)))
   set @count+=1
end
