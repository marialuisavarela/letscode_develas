
--comando que perdi na primeira parte
update alunos set dt_aluno = '2022-01-01' where dt_aluno is null






-- #### Comandos de sele��o (SELECT) #### --
--Todas as colunas (carregar os dados da tabela novamente)
select * from alunos

-- Todsa as colunas com limitador de registros (LIMIT)
select * from alunos limit 2

-- Colunas espec�ficas
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

-- Cl�usula where com IN
select
	nm_aluno_pri,
	nm_aluno_ult,
	id_aluno
from alunos
where id_aluno in (33,23,25)

-- Cl�usula where com v�rias condi��es
select * from alunos 
where id_alunos in (33,23)
	and nm_aluno_ult = 'Matos'

-- Cl�usula where com v�rias condi��es com o texto todo min�sculo
select * from alunos 
where id_alunos in (33,23)
	and lower(nm_aluno_ult) = 'Matos'
	
	--lower = min�sculo
	--upper = mai�sculo

-- Cl�usula where com LIKE
select * from alunos
where nm_alunos_ult like '%Silva%'
-- - para um caractere
-- % para in�meros caracteres

-- Cl�usula where com ILIKE
select * from alunos
where nm_alunos_ult ilike '%Silva%'
--igual ao like, mas n�o � case-sensitive 

--Cl�usula where com <, >, <=, >=
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

-- Cl�usula WHERE com <=, >=, = incluindo nulos
select *
from alunos
where dt_alunos <= '2022-06-01'
	or dt_aluno is null

-- Cl�usula where com between
	select * 
	from alunos
	where dt_aluno between '2022-06-01' and '2022-06-30'
	
-- #### Comando para apagar todos os registros da tabela (TRUNCATE) ### --
truncate table alunos_temp