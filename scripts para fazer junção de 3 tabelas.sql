use master
go


--Criar o banco de dados vendas --

create database vendas_carro
go

--Seleciona o banco de dados --

use vendas_carro
go

--Criar tabela tab_cupom--

create table tab_cupom_vendas (
id_cupom int identity(1,1000),
data_venda datetime,
valor float,
id_produto int,
id_cliente int
)

go

-- Insere registros/ Popular a tabela vendas --


DECLARE @numero INT;
SET @numero=0;
WHILE @numero< 10
BEGIN
INSERT tab_cupom_vendas ( data_venda,valor, id_produto, id_cliente)
VALUES ( dateadd(d,-1*@numero,getdate()), @numero * 10000, 10,1)
SET @numero = @numero + 1;
END
go

DECLARE @numero INT;
SET @numero=0;
WHILE @numero< 10
BEGIN
INSERT tab_cupom_vendas ( data_venda,valor, id_produto, id_cliente)
VALUES ( dateadd(d,-1*@numero,getdate()), @numero * 10000,20, 2)
SET @numero = @numero + 1;
END
go


DECLARE @numero INT;
SET @numero=0;
WHILE @numero< 10
BEGIN
INSERT tab_cupom_vendas ( data_venda,valor, id_produto,id_cliente)
VALUES ( dateadd(d,-1*@numero,getdate()), @numero * 10000, 30,3)
SET @numero = @numero + 1;
END
go

DECLARE @numero INT;
SET @numero=0;
WHILE @numero< 10
BEGIN
INSERT tab_cupom_vendas ( data_venda,valor, id_produto,id_cliente)
VALUES ( dateadd(d,-1*@numero,getdate()), @numero * 10000, 40,4)
SET @numero = @numero + 1;
END
go


DECLARE @numero INT;
SET @numero=0;
WHILE @numero< 10
BEGIN
INSERT tab_cupom_vendas ( data_venda,valor, id_produto,id_cliente)
VALUES ( dateadd(d,-1*@numero,getdate()), @numero * 10000, 50,5)
SET @numero = @numero + 1;
END

update tab_cupom_vendas set valor =4000
where valor =0


go

--Criar tabela produto--

create table tab_produto (
id_produto  int primary key,
produto_desc nvarchar(50)
)

go

--Populando tabela tab_produto --

insert into vendas_carro.dbo.tab_produto values (10,'GOL')
go

insert into vendas_carro.dbo.tab_produto values (20,'Fiesta')
go

insert into vendas_carro.dbo.tab_produto values (30,'Honda Fit')
go

insert into vendas_carro.dbo.tab_produto values (40,'POlo')
go

insert into vendas_carro.dbo.tab_produto values (50,'Logan')
go

--Criar a tabela cliente --

create table tab_cliente
( id_cliente int,
nome_cliente nvarchar(50)
)
go

--Popula a tabela cliente--

insert into vendas_carro.dbo.tab_cliente values (1,'Rafael Campos')
go

insert into vendas_carro.dbo.tab_cliente values (2,'Elisabete Pereira')
go

insert into vendas_carro.dbo.tab_cliente values (3,'Douglas Brito')
go

insert into vendas_carro.dbo.tab_cliente values (4,'Amanda Cristina')
go

insert into vendas_carro.dbo.tab_cliente values (5,'Otavio Pereira' )
go

--Junções com três tabelas--

--Esquema das três tabelas--
select top(5) * from vendas_carro.dbo.tab_cupom_vendas
go

select top(5) * from vendas_carro.dbo.tab_produto


select top(5) * from vendas_carro.dbo.tab_cliente
go

--Consulta com as junções de três tabelas--

select
cliente.nome_cliente,
prod.produto_desc,
format (cupom.data_venda,'dd-MM-yyyy HH:mm:SS') as Dt_VendaBR,
format(cupom.valor,'c','pt-br' ) as ValorRS

from vendas_carro.dbo.tab_cupom_vendas as cupom

inner join vendas_carro.dbo.tab_cliente as cliente
on cupom.id_cliente =cliente.id_cliente

inner join vendas_carro.dbo.tab_produto as prod
on prod.id_produto = cupom.id_produto

where prod.produto_desc='gol'
and cupom.data_venda between '25/06/2020 00:00:00' and '04/07/2020 23:59:59'
go









