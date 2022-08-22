--Atividade aula 7
--Questão 1 - Construir uma consulta que apresente o nome dos municípios que tiverem área reflorestada maior que 200.000 ha.
select distinct municipio from municipios m 
inner join florestas f on m.id_municipio = f.id_municipio and f.area_ha > 200000

-- comando professor: 
select distinct municipio
from florestas f 
left join municipios m using (id_municipio)
where area_ha > 200000
-------------------------------------------------------------------------------------------------

--Questão 2 - Construir uma consulta que apresente o nome dos municípios e a sigla dos estados que tiverem área reflorestada maior que 150.000 ha.
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

-- Questão 3 - Construir uma consulta que apresente o nome dos municípios, região e país que não estão presentes na tabela florestas.
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
-- Questão 4 - Construir uma consulta que apresente nomes dos municípios e as espécies que tiverem área reflorestada maior que 30.000 ha no estado da Bahia.
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
-- Questão 5 - Construir uma view e uma view materializada com as informações da tabela original, depois comparar os tempos de execução das consultas.






