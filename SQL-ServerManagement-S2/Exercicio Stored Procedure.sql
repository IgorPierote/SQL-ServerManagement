/*
1)	Utilizando o banco de ve�culos, crie uma stored procedure 
chamada sp_ex_1 que receba como par�metro um c�digo de UF 
qualquer, e devolva em uma tabela a m�dia dos rendimentos 
das pessoas agrupadas por estado civil desta UF.
*/
create or alter procedure sp_ex_1 (@uf varchar(2)) as
begin
	select a.cod_estado_civil, avg(a.rendimento) rend
	from tb_clientes a
	where a.cod_uf = @uf
	group by a.cod_estado_civil
end

--chamada 
exec sp_ex_1 'SP'

/*
2)	Crie uma SP que permita a inclus�o dos dados para uma 
marca, na tabela de marcas. Receba como par�metros todos os 
dados da tabela.
*/
create or alter procedure sp_ex_2 (@cod_marca int, @desc_marca varchar(50)) as 
begin	
	set nocount on
	insert into tb_marcas values (@cod_marca, @desc_marca)
	if @@ERROR > 0
		return -1 --deu problema
	else
		return 0 -- tudo OK
	set nocount off
end

--chamada
declare @ret int
exec @ret = sp_ex_2 192, 'GWM'
if @ret = 0
	print 'Inclus�o OK'
else
	print 'Erro na Inclus�o'


/*
3)	Baseada na sp criada no exerc�cio 2, fa�a uma altera��o 
para que o c�digo da marca seja gerado automaticamente dentro 
de sua SP
*/
create or alter procedure sp_ex_3 (@desc_marca varchar(50)) as 
begin	
	--descobre qual o pr�ximo codigo da marca
	declare @cod_marca int = (select isnull(max(cod_marca), 0) + 1 
							  from tb_marcas)

	set nocount on
	insert into tb_marcas values (@cod_marca, @desc_marca)
	if @@ERROR > 0
		return -1 --deu problema
	else
		return 0 -- tudo OK
	set nocount off
end

--chamada
declare @ret int
exec @ret = sp_ex_3 'Lexus'
if @ret = 0
	print 'Inclus�o OK'
else
	print 'Erro na Inclus�o'

	
/*
4)	Crie uma sp que receba como par�metro a marca de um ve�culo, 
e devolva, tamb�m atrav�s de par�metros a quantidade de ve�culos 
que essa marca possui, bem como a quantidade distinta de UF que 
os ve�culos dessa marca possuem.
*/
create or alter proc sp_ex_04
(
    @marca nvarchar(50),
    @qtdeVeiculos int out,
    @qtdeUfs int out
) as
begin
    declare @codMarca int = (select m.cod_marca 
						     from tb_marcas m 
							 where m.desc_marca=@marca)

    if @codMarca is null
    begin
        set @qtdeVeiculos = 0
        set @qtdeUfs = 0
		print 'Marca solicitada n�o existe!!!'
        return
    end

    set @qtdeVeiculos = (select count(*) from tb_alienacao a 
						 where a.cod_marca=@codMarca)

    set @qtdeUfs = (select count(distinct a.cod_uf_placa) 
					from tb_alienacao a 
					where a.cod_marca=@codMarca)
	--ou
	select @qtdeUfs = count(distinct a.cod_uf_placa),
		   @qtdeVeiculos = count(*)
					from tb_alienacao a 
					where a.cod_marca=@codMarca
	return
end
go --executa at� aqui

--chamada
declare @qtdVeic int
declare @qtdUF int

exec sp_ex_04 'VOLKSWAGEN', @qtdVeic out, @qtdUF output

print 'Total de Veiculos da Marca: ' + cast(@qtdVeic as varchar(5))
print 'Total de UFs da Marca: ' + cast(@qtdUF as varchar(5))

/*
5)	Crie uma SP de inclus�o para a tabela de clientes, nela voc� 
ter� que receber todos os dados do cliente. Para que a inclus�o 
possa ocorrer voc� dever� verificar se os dados de estado civil 
e UF existem nas tabelas fortes de estado civil e UF. Caso algum 
problema ocorra uma mensagem dever� ser emitida e a opera��o 
abortada.
*/
alter procedure sp_ex_5 (@cod_cli int, @nome varchar(50), 
						  @dt_nascimento smalldatetime,
						  @tipo_pessoa varchar(1),
						  @cod_estado_civil varchar(1),
						  @rendimento decimal(10,2),
						  @cod_uf varchar(2)) as 
begin
	if not exists (select cod_uf from tb_estados 
				   where @cod_uf = cod_uf) begin
		print 'Codigo da UF n�o existe'
		return -1
	end

	if not exists (select cod_estado_civil from tb_estado_civil 
				   where @cod_estado_civil = cod_estado_civil) begin
		print 'Codigo da Estado Civil n�o existe'
		return -1
	end

	insert into tb_clientes values (@cod_cli, @nome, @dt_nascimento,
									@tipo_pessoa, @cod_estado_civil,
									@rendimento, @cod_uf)
    print 'Cliente inclu�do com sucesso!!!'
	return 0 --sem erros
end
go

--chamada
set dateformat dmy
exec sp_ex_5 20124, 'Andr� da Silva', '10/12/1990', 
					'J', 'C', 1500, 'RJ'
--ou

select * from tb_estado_civil
exec sp_ex_5 @cod_cli = 20125, @nome='Andr� da Silva', 
		    @dt_nascimento = '10/12/1990', @tipo_pessoa = 'F', 
			@cod_estado_civil = 'C', @rendimento =  1500, @cod_uf='SP'

select * from tb_estado_civil