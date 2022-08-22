--Atividade aula 7
--Quest�o 1 - Construir uma consulta que apresente o nome dos munic�pios que tiverem �rea reflorestada maior que 200.000 ha.
select distinct municipio from municipios m 
inner join florestas f on m.id_municipio = f.id_municipio and f.area_ha > 200000

-- comando professor: 
select distinct municipio
from florestas f 
left join municipios m using (id_municipio)
where area_ha > 200000
-------------------------------------------------------------------------------------------------

--Quest�o 2 - Construir uma consulta que apresente o nome dos munic�pios e a sigla dos estados que tiverem �rea reflorestada maior que 150.000 ha.
create materialized  view mvw_municipioEstado as (
	select id_municipio , municipio, estado_sigla from municipios m
	left join estados e  on e.id_estado = m.id_estado
)

--drop materialized  view mvw_municipioEstado

select * from mvw_municipioEstado

select distinct municipio, estado_sigla from mvw_municipioestado mm
inner join florestas f on mm.id_municipio = f.id_municipio and f.area_ha > 150000

-- comando professor:
select distinct 
	municipio,
	estado_sigla
from florestas f 
inner join municipios m using (id_municipio)
inner join estados e using (id_estado)
where area_ha > 150000

-------------------------------------------------------------------------------------------------

-- Quest�o 3 - Construir uma consulta que apresente o nome dos munic�pios, regi�o e pa�s que n�o est�o presentes na tabela florestas.
select municipio from florestas f 
right join municipios m on f.id_municipio = m.id_municipio 
where f.id_municipio is null 


-- comando professor:
select municipio, regiao, pais
from florestas f 
right join municipios m using (id_municipio)
inner join regioes r using (id_regiao)
inner join paises p using (id_pais)
where f.id_municipio is null

-------------------------------------------------------------------------------------------------
-- Quest�o 4 - Construir uma consulta que apresente nomes dos munic�pios e as esp�cies que tiverem �rea reflorestada maior que 30.000 ha no estado da Bahia.
select distinct municipio, especie
from florestas f
inner join municipios m using (id_municipio)
inner join especies e using (id_especie)
where area_ha > 30000 and id_estado in (3)

-- comando professor:
select distinct 
	municipio,
	especie
from florestas f 
inner join municipios m using (id_municipio)
inner join estados e2 using (id_estado)
inner join especies e using (id_especie)
where area_ha > 30000 and estado_sigla = 'BA'

-------------------------------------------------------------------------------------------------
-- Quest�o 5 - Construir uma view e uma view materializada com as informa��es da tabela original, depois comparar os tempos de execu��o das consultas.






