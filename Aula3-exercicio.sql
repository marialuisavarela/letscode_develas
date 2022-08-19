/******AULA 3*******/
-- Questão 1: criar duas bases de dados no postgres com os nomes de LETSCODE E LETSCODE_DEL
create database letscode;
create database letscode_del;

-- Questão 2: alterar o nome da base de dados no postgres de LETSCODE para TURMA847
alter database letscode rename to turma847;

-- Questão 3: Deletar a base de dados no postgres com o nome de LETSC0DE_DEL
drop database if exists letscode_del;

-- Questão 4: criar uma tabela na base de dados TURMA847 com o nome de ALUNOS e conlunas conforme imagem abaixo (slide)
create table alunos (
	id			integer,
	matricula	integer,
	nome		varchar(60),
	estado		varchar(2),
	formacao	varchar(50)
)

-- Questão 5: alterar o nome da coluna ESTADO para UF na tabela ALUNOS, na base de dados TURMA847
alter table alunos rename column estado to uf;

-- Questão 6: incluir as colunas EMAIL e TELEFONE na tabela ALUNOS, na base de dados TURMA847
alter table alunos add column email varchar(30);
alter table alunos add column telefone varchar(11)
--alter table alunos add column varchar(30), add column telefone varchar(11)

-- Questão 7: alterar o tipo de dados da coluna EMAIL para VARCHAR com limite a 100 caracteres
alter table alunos alter column email type varchar(100);

-- Questão 8: remover a coluna ID na tabela ALUNOS, na base de dados TURMA847
alter table alunos drop column id

-- Questão 9: remover a tabela ALUNOS, na base de dados TURMA847
drop table alunos --drop table if exists alunos

-- Questão 10: qual a melhor coluna para ser a chave primária na tabela ALUNOS, a coluna ID ou a coluna MATRICULA? Justifique e defina a coluna escolhida como chave primária da tabela
--ID, padronização do sistema
--Matricula, exclusão do id, mais fácil identidicação do aluno (ganho como negócio)
create table alunos (
	id			integer,
	matricula	integer,
	nome		varchar(60),
	estado		varchar(2),
	formacao	varchar(50)
	primary key (id)
)
/*se a tabela tivesse criada, o comando podia ser:
 * alter table aluno
 * 		add constraint id_key
 * 			primary key (id)
 */