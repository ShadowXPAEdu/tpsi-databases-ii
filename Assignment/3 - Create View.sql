-- CTTPSI21 pass: bd

/*
*
*	CTeSP: TPSI
*	2018/2019
*
*	Create View
*
*	Pedro dos Santos Alves	a21270246
*	Leandro Adão Fidalgo	a21270093
*
*/


-- Vista A que no que respeita às equipas, apresente:
-- A equipa que ganhou o penúltimo campeonato;
-- A equipa que teve mais cartões amarelos (jogadores e treinadores) nesta época;
-- A equipa que sofreu mais golos, em casa, no ultimo mês.

create view VISTA_A as (
	select x.NOM as "Ganharam penúltimo campeonato", yz.NOMY as "Mais cartões amarelos", z.NOM as "Sofreu mais golos"
    from
        (select ee.nome NOM
        from equipa_estadio ee, equipa_estadio_liga eel, epoca e, liga l
        where ee.liga_id_liga = l.id_liga and e.id_epoca = l.epoca_id_epoca and ee.id_equipa = eel.equipa_estadio_id_equipa and
        (to_char(eel.DATAV, 'YYYY') = to_char(sysdate, 'YYYY') - 2) and l.NOME = 'Primeira Divisão'
        ) x, (
            select YY.NOM NOMY
            from (
                select ee.nome NOM, max(y.co + z.co)
                from (
                    select distinct ee.ID_EQUIPA, count(ee.ID_EQUIPA) co
                    from equipa_estadio ee, staff_sancao_disc ssd, staff s, equipa_estadio_staff ees
                    where ee.ID_EQUIPA = ees.EQUIPA_ESTADIO_ID_EQUIPA and ees.STAFF_ID_STAFF = s.ID_STAFF and ssd.STAFF_ID_STAFF = s.ID_STAFF
                    group by ee.ID_EQUIPA
                    ) y, (
                    select distinct ee.ID_EQUIPA, count(ee.ID_EQUIPA) co
                    from equipa_estadio ee, jogador_sancao_disc jsd, jogador p, jogador_equipa_estadio jee
                    where ee.ID_EQUIPA = jee.EQUIPA_ESTADIO_ID_EQUIPA and jee.JOGADOR_ID_JOGADOR = p.ID_JOGADOR and jsd.JOGADOR_ID_JOGADOR = p.ID_JOGADOR
                    group by ee.ID_EQUIPA
                    ) z, equipa_estadio ee
                where y.ID_EQUIPA = z.ID_EQUIPA and ee.id_equipa = z.id_equipa and (ROWNUM = 1)
                group by ee.nome
                order by max(y.co + z.co) desc) YY
        ) yz, (
            select zz.nom
            from (
                select ee.nome nom, max(x.soma) som
                from equipa_estadio ee, (
                    select j.EQUIPA_ESTADIO_ID_EQUIPA equip, sum(j.RES_FORA) soma
                    from jogo j
                    group by j.EQUIPA_ESTADIO_ID_EQUIPA
                    ) x
                where ee.ID_EQUIPA = x.equip
                group by ee.nome
                order by som desc) ZZ
            where rownum = 1
        ) z
);


-- Vista B que mostre, quantos jogos foram realizados por equipas com treinadores de nacionalidade portuguesa, na presente época
-- SYSDATE dá 0
-- 2018 dá 72

create or replace view VISTA_B as (
    select count(j.ID_Jogo) as NumJogos
    from jogo j, staff s, epoca e, equipa_estadio ee, equipa_estadio_staff ees, liga l
    where ees.equipa_estadio_id_equipa = ee.id_equipa and ee.liga_id_liga = l.id_liga and l.epoca_id_epoca = e.id_epoca and
    s.id_staff = ees.staff_id_staff and (j.equipa_estadio_id_equipa = ee.id_equipa or j.equipa_estadio_id_equipa1 = ee.id_equipa) and
    s.tipo = 'Treinador' and to_char(e.DATA_FIM, 'YYYY') = '2018' and s.NACIONALIDADE = 'Portuguese'
);


-- Vista C que apresente a lista de jogadores portugueses que jogam em equipas da segunda divisão esta época e que nunca receberam uma sanção disciplinar
-- SYSDATE dá 0 resultados
-- 2018 dá 40 resultados

create or replace view VISTA_C as (
    select p.nome NOME
    from jogador p, EQUIPA_ESTADIO ee, liga l, epoca e, jogador_equipa_estadio jee
    where jee.equipa_estadio_id_equipa = ee.id_equipa and jee.jogador_id_jogador = p.id_jogador and ee.liga_id_liga = l.id_liga and
    l.epoca_id_epoca = e.id_epoca and
    (select count(jsdd.jogador_id_jogador) from jogador_sancao_disc jsdd where jsdd.jogador_id_jogador = p.id_jogador) = 0 and
    (to_char(e.Data_Fim, 'YYYY') = '2018') and 
    l.NOME = 'Segunda Divisão' and p.nacionalidade = 'Portuguese'
);


-- Vista D lista de jogadores, que jogam na posição "extremo", que no último mês marcaram pelo menos dois golos
-- SYSDATE dá 0 resultados
-- 2018 dá 19 resultados

create or replace view VISTA_D as (
    select distinct p.nome
    from jogador p, jogo j, jogador_jogo pj
    where p.ID_JOGADOR = pj.JOGADOR_ID_JOGADOR and pj.JOGO_ID_JOGO = j.ID_JOGO and
    p.POSICAO = 'Avançado' and (select count(jogador_jogo.jogador_id_jogador) from jogador_jogo, jogador where p.id_jogador = jogador.id_jogador and jogador_jogo.jogador_id_jogador = p.id_jogador and jogador_jogo.jogador_id_jogador = jogador.id_jogador
    group by jogador_jogo.jogador_id_jogador) >= 2 and ('2018' - to_char(j.Data_Jogo, 'YYYYMM') <= 1)
);


-- Vista E que apresente o numero total de golos marcados por equipas de Lisboa e do Porto na ultima época
-- 2018

create view VISTA_E as (
    select count(j.jogador_id_jogador) NUMGOLS
    from jogador_jogo j, epoca e, equipa_estadio ee, jogador p, liga l, jogador_equipa_estadio jee
    where j.JOGADOR_ID_JOGADOR = p.id_jogador and jee.JOGADOR_ID_JOGADOR = p.id_jogador and jee.EQUIPA_ESTADIO_ID_EQUIPA = ee.id_equipa and ee.LIGA_ID_LIGA = l.id_liga and
    l.EPOCA_ID_EPOCA = e.id_epoca and ((to_char(e.Data_Fim, 'YYYY') = to_char(SYSDATE, 'YYYY') - 1)) and
    (ee.ESTADIO_LOCALIZACAO = 'Lisboa' or ee.ESTADIO_LOCALIZACAO = 'Porto')
);


-- Vista F que apresente o clube e os nomes dos jogadores que receberam cartões vermelhos nos últimos três meses. Considere apenas os jogadores a jogar na posição "guarda-redes" (apresente o resultado por ordem alfabética)

create view VISTA_F as (
    select Jogador JOGADOR,
    Equipa EQUIPA from
        (select distinct (p.nome) Jogador, (ee.nome) Equipa
        from jogador p, equipa_estadio ee, jogador_sancao_disc jsd, sancao_disc sd, jogador_equipa_estadio jee
        where p.ID_JOGADOR = jsd.JOGADOR_ID_JOGADOR and jsd.SANCAO_DISC_ID_SANCAO = sd.ID_SANCAO and jee.EQUIPA_ESTADIO_ID_EQUIPA = ee.ID_EQUIPA and
        jee.JOGADOR_ID_JOGADOR = p.ID_JOGADOR and p.POSICAO = 'Guarda-Redes' and sd.CARTAO = 'Vermelho' and ((select to_char(data_jogo, 'YYYYMM') from jogo where sd.jogo_id_jogo = jogo.id_jogo) <= '3')
        order by p.nome, ee.nome)
);


-- Vista G que apresente os quatros melhores goleadores, fora de casa, das ultimas duas épocas

create view VISTA_G as (
    select co as Jogador
    from (
        select distinct p.nome co,  count(jj.jogador_id_jogador)
        from jogador p, jogador_jogo jj, equipa_estadio ee, liga l, epoca e, jogador_equipa_estadio jee
        where jj.jogador_id_jogador = p.id_jogador and jee.EQUIPA_ESTADIO_ID_EQUIPA = ee.id_equipa and jee.JOGADOR_ID_JOGADOR = p.id_jogador and
        ee.LIGA_ID_LIGA = l.id_liga and l.EPOCA_ID_EPOCA = e.id_epoca and (to_char(e.Data_Fim, 'YYYY') = to_char(SYSDATE, 'YYYY') - '1' or to_char(e.Data_Fim, 'YYYY') = to_char(SYSDATE, 'YYYY') - '2')
        group by p.nome
        order by count(jj.jogador_id_jogador) desc) x
    where (ROWNUM <= 4)
);


-- Vista H que obtenha uma lista de treinadores que tenham ganho mais do que três jogos consecutivos e menos do que duas derrotas no campeonato. Ordene por ordem descente pelo número de vitorias.

create view VISTA_H as (
    select x.nom NOME
    from (
        select s.nome nom
        from staff s, equipa_estadio ee, liga_equipa_estadio lee, liga l, equipa_estadio_staff ees
        where s.ID_STAFF = ees.staff_id_staff and ees.EQUIPA_ESTADIO_ID_EQUIPA = ee.id_equipa and
        ee.id_equipa = lee.equipa_estadio_id_equipa and l.id_liga = lee.liga_id_liga and lee.numvitoriascons > 3 and
        lee.NUMDERROTAS < 2  and s.tipo like '%Treinador%'
        order by lee.numvitorias desc) x
);


-- Vista I
/*
create view VISTA_I as (
  -- Impossivel com esta estrutura de dados
);
*/


-- Vista J que para todos os jogos da ultima jornada, apresente uma listagem com o nome do estádio onde se realizou o jogo, nome do treinador, resultado final, quantidadede golos sofridos e marcados.
-- Ordene descendentemente pelo nome da equipa

create view VISTA_J as (
    select * from (
        select distinct ee.estadio_nome as "Nome Estadio", s.nome as Treinador, 'Resultado: ' || j.res_casa || ' - ' || j.res_fora as Resultado, j.res_casa as "Golos Marcados", j.res_fora as "Golos Sufridos"
        from equipa_estadio ee, jogo j, staff s, equipa_estadio_staff ees
        where j.EQUIPA_ESTADIO_ID_EQUIPA = ee.ID_EQUIPA and ees.STAFF_ID_STAFF = s.ID_STAFF and ees.EQUIPA_ESTADIO_ID_EQUIPA = ee.ID_EQUIPA and
        s.TIPO = 'Treinador' and j.jornada = (select max(jogo.jornada) from jogo)
        order by ee.estadio_nome desc)
);


-- Vista K
/*
create view VISTA_K as (
  -- Impossivel com esta estrutura de dados
);
*/


-- Vista L que, para cada clube, apresente a lista de resultados por jogo. Apenas considere jogos com mais de 4 golos (totais). Ordene descendentemente pelo número de golos. "realizados entre as 17:00 e 23:00"

create view VISTA_L as (
    select * from (
        select j.RES_CASA || ' - ' || j.res_fora as "Resultado", ee.NOME as "Nome da Equipa"
        from jogo j, equipa_estadio ee
        where (j.EQUIPA_ESTADIO_ID_EQUIPA = ee.ID_EQUIPA or j.EQUIPA_ESTADIO_ID_EQUIPA1 = ee.ID_EQUIPA) and (j.res_casa + j.res_fora) > 4 and (to_char(j.data_jogo, 'HH24MI') >= '1700' and to_char(j.data_jogo, 'HH24MI') <= '2300') order by (j.res_casa + j.res_fora) desc)
);


-- Vista M Número de patrocinadores de uma equipa ordenados descendentemente por número de patrocinadores.....
-- Com os novos dados todos apresentam 1 no numero de patrocinadores....

create view VISTA_M as (
    select x.NomeEquipa, x.NumPatrocinadores
    from (
        select ee.nome NomeEquipa, count(pa.id_patrocinador) NumPatrocinadores
        from equipa_estadio ee, patrocinador_equipa_estadio pee, patrocinador pa
        where ee.id_equipa = pee.equipa_estadio_id_equipa and pee.patrocinador_id_patrocinador = pa.id_patrocinador
        group by ee.nome
        order by NumPatrocinadores desc) x
);


-- Vista N Guarda-Redes com golos mais sufridos e melhor marcadores de cada liga de cada epoca.........
-- basicamente um top 5 dos melhores marcadores e guarda-redes com mais golos sufridos.....

create view VISTA_N as (
    select *
    from (
        select "Guarda-Redes e Marcadores"
        from (
            select ' *** Melhor Marcador: "' || x.nome || '"' as "Guarda-Redes e Marcadores"
            from (
                select p.nome
                from jogador p, melhor_marc mm
                where p.id_jogador = mm.JOGADOR_ID_JOGADOR
                order by mm.golos desc
                ) x
            union
            select ' *** Guarda-Redes com mais golos sufridos: "' || y.nome || '"'
            from (
                select p.nome
                from jogador p, GR_Mais_GS gmg
                where p.id_jogador = gmg.jogador_id_jogador
                order by gmg.golos desc
                ) y
            )
            order by "Guarda-Redes e Marcadores" asc)
);


select * from vista_a;
select * from vista_b;
select * from vista_c;
select * from vista_d;
select * from vista_e;
select * from vista_f;
select * from vista_g;
select * from vista_h;
select * from vista_j;
select * from vista_l;
select * from vista_m;
select * from vista_n;
