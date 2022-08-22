-- Aula 7

create database snif

-- ##### JOINS ##### --
-- criando tabela_a e tabela_b

create table public.tabela_a(
	id_aluno integer,
	nm_aluno varchar(60),
	id_uf integer
)

create table public.tabela_b(
	id_uf integer,
	nm_uf varchar(2)
)

-- inserindo dados nas tabelas
insert into tabela_a values
	(1, 'Joana', 1),
	(2, 'Priscila', 9),
	(3, 'José', 3),
	(4, 'Maria', 4),
	(5, 'Paula', 8),
	(6, 'Paulo', 8);
	
insert into tabela_b values
	(1,'BA'),
	(2,'CE'),
	(3,'SP'),
	(4,'PE'),
	(5,'RJ'),
	(6,'SC');

select * from tabela_a;
select * from tabela_b;

-- left join tabela_a com tabela_b
select * from tabela_a 
left join tabela_b on tabela_a.id_uf = tabela_b.id_uf
order by tabela_a.id_aluno

-- right join tabela_a com tabela_b
select * from tabela_a
right join tabela_b on tabela_a.id_uf = tabela_b.id_uf
order by tabela_b.id_uf

-- inner join tabela_a com tabela_b
select * from tabela_a
inner join tabela_b on tabela_a.id_uf = tabela_b.id_uf

-- full join tabela_a com tabela_b
select * from tabela_a 
full join tabela_b on tabela_a.id_uf = tabela_b.id_uf
order by id_aluno, tabela_b.id_uf

-- transformando a coluna do join em apenas uma, com USING
select * from tabela_a 
inner join tabela_b using (id_uf)

-- filtrando o join
select * from tabela_a 
inner join tabela_b on tabela_a.id_uf = tabela_b.id_uf 
and id_aluno in (1,3)

-- ##### UNIONS ##### --
-- criando tabela_c
create table tabela_c (
	id_aluno integer,
	nm_aluno varchar(20),
	id_uf integer
)

insert into tabela_c values
	(1, 'Joana', 1),
	(7, 'Gustavo', 1),
	(8, 'Giovana', 3)
	
select * from tabela_c

--union tabela_a com tabela_c (registros únicos)
select * from tabela_a
union
select * from tabela_c 
order by id_aluno

-- union all (todos os registros) tabela_a com tabela_c
select * from tabela_a
union all
select * from tabela_c 
order by id_aluno

-- intersect tabela_a com tabela_c
select * from tabela_a
intersect
select * from tabela_c 

-- except tabela_a com tabela_c e tabela_c com tabela_a (a ordem das tabelas faz diferença)
select * from tabela_a
except
select * from tabela_c 

select * from tabela_c
except
select * from tabela_a 

-- ##### VIEWS ##### --
--criando uma view
create view vw_tabela_ab as (
	select * from tabela_a
	inner join tabela_b using (id_uf)
	)

-- consultando view
select * from vw_tabela_ab 

--criando uma view materializada (cria de fato uma view no banco de dados)
create materialized view vwm_tabela_ab as (
	select * from tabela_a
	inner join tabela_b using (id_uf)
	)

--consultando uma view materializada
select * from vwm_tabela_ab 

--atualizando dados
insert into tabela_b values
	(7, 'MG'),
	(8, 'ES')

--consultando view atualizada
select * from vw_tabela_ab --atualiza pq ela faz novamente

select * from vwm_tabela_ab --essa daqui tá salva no banco e foi feita antes do update
	