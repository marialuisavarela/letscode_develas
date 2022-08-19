
--comando que perdi na primeira parte
update alunos set dt_aluno = '2022-01-01' where dt_aluno is null






-- #### Comandos de seleção (SELECT) #### --
--Todas as colunas (carregar os dados da tabela novamente)
select * from alunos

-- Todsa as colunas com limitador de registros (LIMIT)
select * from alunos limit 2

-- Colunas específicas
select
	nm_aluno_pri,
	nm_aluno_ult,
	id_aluno
from alunos

-- Apelidos em colunas (AS)
select
	nm_aluno_pri as primeiro_nome,
	nm_aluno_ult as ultimo_nome,
	id_aluno as idade
from alunos

-- Cláusula where com IN
select
	nm_aluno_pri,
	nm_aluno_ult,
	id_aluno
from alunos
where id_aluno in (33,23,25)

-- Cláusula where com várias condições
select * from alunos 
where id_alunos in (33,23)
	and nm_aluno_ult = 'Matos'

-- Cláusula where com várias condições com o texto todo minúsculo
select * from alunos 
where id_alunos in (33,23)
	and lower(nm_aluno_ult) = 'Matos'
	
	--lower = minúsculo
	--upper = maiúsculo

-- Cláusula where com LIKE
select * from alunos
where nm_alunos_ult like '%Silva%'
-- - para um caractere
-- % para inúmeros caracteres

-- Cláusula where com ILIKE
select * from alunos
where nm_alunos_ult ilike '%Silva%'
--igual ao like, mas não é case-sensitive 

--Cláusula where com <, >, <=, >=
select *
from alunos
where dt_alunos >= '2022-06-01'

select *
from alunos
where dt_aluno > '2022-06-01'

select *
from alunos
where dt_alunos < '2022-06-01'

select *
from alunos
where dt_alunos <= '2022-06-01'

-- Cláusula WHERE com <=, >=, = incluindo nulos
select *
from alunos
where dt_alunos <= '2022-06-01'
	or dt_aluno is null

-- Cláusula where com between
	select * 
	from alunos
	where dt_aluno between '2022-06-01' and '2022-06-30'
	
-- #### Comando para apagar todos os registros da tabela (TRUNCATE) ### --
truncate table alunos_temp