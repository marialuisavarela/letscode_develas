
--Aula 4 - Consulta simples e manipula��o de dados nas tabelas (CRUD)

-- Criando uma sequ�ncia para c�digo do aluno
create sequence seq_cod_alunos start 10001
--dentro de public > sequences

-- criando uma tabela de alunos
create table alunos (
	cod_aluno		integer default nextval('seq_cod_alunos'),
	nm_aluno_pri	varchar(100),
	nm_aluno_ult	varchar(100),
	id_aluno		integer,
	dt_aluno		date
)

-- verificando a tabela de alunos
select * from alunos

select * from alunos_temp

-- #### Comando de inclus�o de dados em tabelas (INSERT) #### --
-- Inserindo um �nico registro
insert into alunos values (1001, 'Tiago', 'Dias', 33, '2022-06-01')

-- Inserindo um registro especificando as colunas
insert into alunos (cod_aluno, nm_aluno_pri, nm_aluno_ult) values (1002, 'Joana', 'Silva')

-- Inserindo v�rios registros
insert into alunos values
	(1003,'Paloma','Abreu',23,'2022-05-01'),
	(1004, 'Paula','Matos',33,'2022-02-01'),
	(1005,'Jos�','Silva',55,'2022-06-03')
	
-- Inserindo registros com valores default
	insert into alunos (nm_aluno_pri, nm_aluno_ult, id_aluno, dt_aluno) values ('J�ssica', 'Costa', 35, '2022-06-04')
	
	insert into alunos (nm_aluno_pri, nm_aluno_ult, id_aluno, dt_aluno) values ('Jo�o', 'Santos', 21, '2022-06-05')
	
	insert into alunos values (10003, 'Pedro', 'Brito', 26, '2022-08-17')
	
	insert into alunos (nm_aluno_pri, nm_aluno_ult, id_aluno, dt_aluno) values ('Edicezar', 'Ed', 40, '2022-08-16')
	
-- Inserindo registros a partir de uma outra consulta
	insert into alunos_temp select * from alunos
	
-- ### Comando de atualiza��o de dados em tabelas (UPDATE) #### --
-- Atualizando dados sem where
	update alunos set id_aluno = 25

-- Atualizando dados com where
	update alunos set id_aluno = 33 where cod_aluno = 1001
	-- where [coluna] is null 
	
-- Atualizando v�rias colunas
	update alunos set id_aluno = 26, dt_aluno = '2022-08-17' where cod_aluno = 1002
	
-- Atualizando v�rias colunas com outra sintaxe e exibindo a atualiza��o
	update alunos set (id_aluno, dt_aluno) = (27, '2022-08-17') where dt_aluno = '2022-05-01'
	returning cod_aluno, id_aluno, dt_aluno 

-- #### Comando de dele��o de dados em tabelas (DELETE) #### --
-- Exclus�o sem where
	delete from alunos
	
	insert into alunos select * from alunos_temp 
	
-- Exclus�o com where
	delete from alunos where nm_aluno_pri = 'Joana'
	
--Exibindo registros exclu�dos
	delete from alunos where nm_aluno_ult = 'Abreu'
	returning * 
	
--brincado	
	select * from alunos
	
	update alunos set dt_aluno = null where nm_aluno_ult = 'Silva'
	
	-- #### Comandos de consulta simples como SELECT #### --
	-- Todas as colunas
	select * from alunos
	
	-- Colunas espec�ficas
	select nm_aluno_pri, id_aluno from alunos
	
	