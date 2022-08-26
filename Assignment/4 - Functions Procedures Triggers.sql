-- CTTPSI21 pass: bd

/*
*
*	CTeSP: TPSI
*	2018/2019
*
*	Functions, Procedures, Triggers
*
*	Pedro dos Santos Alves	a21270246
*	Leandro Adão Fidalgo	a21270093
*
*/

-- A

create or replace trigger rest_num_cartoes
before insert
on jogador_sancao_disc
for each row
declare
    numAm number := 0;
    numVe number := 0;
    
begin
    declare
    begin
        select count(sd.id_sancao) into numAm
        from sancao_disc sd, jogador_sancao_disc jsd
        where sd.id_sancao = jsd.sancao_disc_id_sancao and jsd.jogador_id_jogador = :new.jogador_id_jogador and sd.cartao = 'Amarelo'
        group by sd.jogo_id_jogo;
    exception
        when no_data_found then
            numAm := 0;
    end;
    
    declare
    begin
        select count(sd.id_sancao) into numVe
        from sancao_disc sd, jogador_sancao_disc jsd
        where sd.id_sancao = jsd.sancao_disc_id_sancao and jsd.jogador_id_jogador = :new.jogador_id_jogador and sd.cartao = 'Vermelho'
        group by sd.jogo_id_jogo;
    exception
        when no_data_found then
            numVe := 0;    
    end;
    
    if (numAm >= 2) then
        update sancao_disc set cartao = 'Vermelho' where id_sancao = :new.sancao_disc_id_sancao;
    end if;
    
    if (numVe >= 1) then
        insert into avisos(mensagem) values ('O jogador ' || (select nome from jogador where id_jogador = :new.jogador_id_jogador) || ' já tem um cartão vermelho.');
        -- raise_application_error cancela o insert?
        -- isto vai dar erro quando for dar insert...? não pode ser null...
        :new.jogador_id_jogador := null;
    end if;
end;
/

create trigger nacionais_cinco
before insert
on jogador_equipa_estadio
for each row
declare
    numJogEst number := 0;
begin
    select count(jee.jogador_id_jogador) into numJogEst
    from jogador jog, jogador_equipa_estadio jee
    where jog.id_jogador = jee.jogador_id_jogador and jog.naturalidade <> 'Portugal' and jee.equipa_estadio_id_equipa = :new.equipa_estadio_id_equipa;
    
    if (numJogEst > 5) then
        insert into avisos(mensagem) values ('Não pode ter mais que 5 jogadores estrangeiros na equipa...');
        :new.jogador_id_jogador := null;
    end if;
end;
/

create trigger jog_mesma_equip
before insert
on jogador_equipa_estadio
for each row
declare
    jogExiste number := 0;
begin
    select count(jogador_id_jogador) into jogExiste
    from jogador_equipa_estadio
    where jogador_id_jogador = :new.jogador_id_jogador;
    
    if (jogExiste > 0) then
        insert into avisos(mensagem) values ('Jogador já existe...');
        :new.jogador_id_jogador := null;
    end if;
end;
/

create trigger staf_mesma_equip
before insert
on equipa_estadio_staff
for each row
declare
    StafExiste number := 0;
begin
    select count(staff_id_staff) into StafExiste
    from equipa_estadio_staff
    where staff_id_staff = :new.staff_id_staff;
    
    if (StafExiste > 0) then
        insert into avisos(mensagem) values ('Staff já existe...');
        :new.staff_id_staff := null;
    end if;
end;
/

-- B Ultimo jogo foi realizado em janeiro de 2018, resultado = 0
-- Avançado
-- 3 = 0
-- 30 = 27
-- 300 = 87
-- numero_golos já está a ser usado... renomeado para numero_golos_func

create or replace function numero_golos_func(pos varchar2) return number
is
    maquinadefazergols number := 0;
    dataFimEpo date;
begin
    if (LOWER(pos) <> 'avançado' and LOWER(pos) <> 'médio' and LOWER(pos) <> 'defesa' and LOWER(pos) <> 'guarda-redes') then
        raise_application_error(-20100, 'Código de posição ' || LOWER(pos) || ' inválido.');
    end if;
    
    select EPOCA.DATA_FIM into dataFimEpo
    from epoca
    where epoca.id_epoca = (select count(*) from epoca);

    select count(jj.jogador_id_jogador) into maquinadefazergols
    from jogador_jogo jj, jogo j, jogador jo
    where j.id_jogo = jj.jogo_id_jogo and jj.jogador_id_jogador = jo.id_jogador and
    (LOWER(jo.posicao) = LOWER(pos)) and (to_char(dataFimEpo, 'yyyymm') - to_char(j.data_jogo, 'yyyymm') <= '30');
    
    return maquinadefazergols;
end;
/

select numero_golos_func('avançado') from dual;
select numero_golos_func('guarda-redes') from dual;
select numero_golos_func('defesa') from dual;
select numero_golos_func('médio') from dual;

set serveroutput on;

declare
    var number := 0;
begin
select numero_golos_func('avbv') into var from dual;
exception
    when others then
        DBMS_OUTPUT.PUT_LINE('Cod: ' || SQLCODE || ' Message: ' || SQLERRM);
end;
/


-- C

create function numero_amarelos(nomeJog varchar2, dataInit date, dataFin date) return number
is
    soma number := 0;
    jogadorExiste number := 0;
    epo1 number := 1;
    epo2 number := 4;
    dataInitEpo date;
    dataFinEpo date;
begin
    select count(*) into jogadorExiste from jogador where nome = nomeJog;
    if (jogadorExiste = 0) then
        raise_application_error(-20101, 'Nome do jogador ' || nomeJog || ' inválido.');
    end if;
    
    select count(*) into epo2 from epoca;
    
    select data_inicio into dataInitEpo from epoca where id_epoca = epo1;
    select data_fim into dataFinEpo from epoca where id_epoca = epo2;
    
    if (dataInit > dataInitEpo) then
        raise_application_error(-20102, 'Data ' || to_char(dataInit, 'yyyy-mm-dd HH24:MI') || ' inválida.');
    end if;
    
    if (dataFin < dataFinEpo) then
        raise_application_error(-20102, 'Data ' || to_char(dataFin, 'yyyy-mm-dd HH24:MI') || ' inválida.');
    end if;
    
    select count(sd.ID_SANCAO) into soma
    from sancao_disc sd, jogador jg, jogo j, jogador_sancao_disc jsd, equipa_estadio ee
    where sd.ID_SANCAO = jsd.SANCAO_DISC_ID_SANCAO and jsd.jogador_id_jogador = jg.ID_JOGADOR and jg.NOME = nomeJog and sd.cartao = 'Amarelo' and
    sd.jogo_id_jogo = j.ID_JOGO and j.EQUIPA_ESTADIO_ID_EQUIPA = ee.ID_EQUIPA and j.DATA_JOGO > dataInit and j.DATA_JOGO < dataFin;
    
    return soma;
end;
/


-- D

create or replace trigger golos_marcados
after insert or update
on jogador_jogo
for each row
declare
    totalGols number := 0;
    minGols number := 0;
    top number := 0;
    jogETop number := 0;
    idJogAntigo number;
    
    nomeEquipa equipa_estadio.nome%type;
    nomeTreinador staff.nome%type;
    
    idEquipa number;
    idEquipD number;
    
    GR number;
    
    GRtotalGols number := 0;
    GRminGols number := 0;
    GRtop number := 0;
    GRjogETop number := 0;
    GRidJogAntigo number;
begin
    -- receber o total de golos que do jogador que marcou
    select j.golos into totalGols
    from jogador j
    where j.ID_JOGADOR = :new.JOGADOR_ID_JOGADOR;

    -- receber o minimo de golos que existe na tabela de melhor marcador
    select min(golos) into minGols
    from melhor_marc;
    
    -- receber id do jogador com min golos
    select jogador_id_jogador into idJogAntigo
    from melhor_marc
    where golos = minGols;

    -- quantos jogadores estão no top 5
    select count(*) into top
    from melhor_marc;
    
    -- se top 5 já está cheio
    if (top = 5) then
        select count(*) into jogETop
        from melhor_marc mm
        where mm.jogador_id_jogador = :new.JOGADOR_ID_JOGADOR;
    
        -- se jogador não está no top 5
        if (jogETop = 0) then
            if (totalGols > minGols) then
                update melhor_marc set jogador_id_jogador = :new.JOGADOR_ID_JOGADOR, golos = totalGols where jogador_id_jogador = idJogAntigo;
            end if;
        else
            -- se já estiver no top 5 coloca os golos certos
            update melhor_marc set golos = totalGols where jogador_id_jogador = :new.JOGADOR_ID_JOGADOR;
        end if;
    else
        insert into melhor_marc(jogador_id_jogador, golos) values(:new.JOGADOR_ID_JOGADOR, totalGols);
    end if;
    
    -- Id da equipa que marcou
    select ee.id_equipa into idEquipa
    from equipa_estadio ee, jogador_jogo jj, jogador_equipa_estadio jee
    where ee.ID_EQUIPA = jee.equipa_estadio_id_equipa and jj.jogador_id_jogador = jee.jogador_id_jogador and jj.jogador_id_jogador = :new.JOGADOR_ID_JOGADOR;
    
    select j.equipa_estadio_id_equipa into idEquipD
    from jogo j
    where j.id_jogo = :new.jogo_id_jogo;
    
    if (idEquipD = idEquipa) then
        select j.equipa_estadio_id_equipa1 into idEquipD
        from jogo j
        where j.id_jogo = :new.jogo_id_jogo;
    end if;
    
    select jee.jogador_id_jogador into GR
    from jogador_equipa_estadio jee, jogador jog
    where jee.equipa_estadio_id_equipa = idEquipD and jee.jogador_id_jogador = jog.id_jogador and LOWER(jog.posicao) = 'guarda-redes';
    
    -- receber o total de golos sufridos
    select j.golos_suf into GRtotalGols
    from jogador j
    where j.ID_JOGADOR = GR;
    
    -- receber o minimo de golos que existe na tabela de GR_mais_GS
    select min(golos) into GRminGols
    from gr_mais_gs;
    
    -- receber id do jogador com min golos_suf
    select jogador_id_jogador into idJogAntigo
    from gr_mais_gs
    where golos = GRminGols;
    
    -- quantos jogadores estão no top 5
    select count(*) into GRtop
    from gr_mais_gs;
    
    -- se top 5 já está cheio
    if (top = 5) then
        select count(*) into GRjogETop
        from gr_mais_gs
        where jogador_id_jogador = GR;
    
        -- se jogador não está no top 5
        if (GRjogETop = 0) then
            if (GRtotalGols > GRminGols) then
                update gr_mais_gs set jogador_id_jogador = GR, golos = GRtotalGols where jogador_id_jogador = GRidJogAntigo;
            end if;
        else
            -- se já estiver no top 5 coloca os golos certos
            update gr_mais_gs set golos = GRtotalGols where jogador_id_jogador = GR;
        end if;
    else
        insert into gr_mais_gs(jogador_id_jogador, golos) values(GR, GRtotalGols);
    end if;
    
    -- Nome da equipa que marcou
    select ee.nome into nomeEquipa
    from equipa_estadio ee
    where ee.ID_EQUIPA = idEquipa;
    
    -- treinador da equipa que marcou
    select STAFF.NOME into nomeTreinador
    from equipa_estadio_staff ees, staff
    where idEquipa = ees.EQUIPA_ESTADIO_ID_EQUIPA and ees.staff_id_staff = staff.id_staff;
    
    insert into avisos(mensagem) values ('Parabéns à equipa ' || nomeEquipa || ' e ao treinador: ' || nomeTreinador || '.');
end;
/


-- E

create function ultimo_jogo(nomeEquip varchar2) return date
is
    equipExiste number := 0;
    idEquip equipa_estadio.id_equipa%type;
    dataJogo jogo.data_jogo%type;
begin
    select count(id_equipa) into equipExiste
    from equipa_estadio
    where nome = nomeEquip;
    
    if (equipExiste = 0) then
        raise_application_error(-20106, 'Nome/ID ' || nomeEquip || ' de equipa inválido.');
    end if;

    select id_equipa into idEquip
    from equipa_estadio
    where nome = nomeEquip;
    
    select d into dataJogo
    from (
        select data_jogo d
        from jogo
        where equipa_estadio_id_equipa1 = idEquip and res_casa > res_fora
        order by data_jogo desc)
    where ROWNUM = 1;
    
    return dataJogo;
end;
/

-- F

create or replace function primeira_substituição(idJogo number, idJogador number) return number
is
    coJogo number := 0;
    coJoga number := 0;
    numMins number := 0;
begin
    select count(jogo_id_jogo) into coJogo
    from substituicoes
    where jogo_id_jogo = idJogo;
    
    if (coJogo = 0) then
        raise_application_error(-20110, 'Não existem jogos.');
    end if;
    
    select count(jogador_id_jogador1) into coJoga
    from substituicoes
    where jogador_id_jogador1 = idJogador;
    
    if (coJoga = 0) then
        raise_application_error(-20109, 'Não existem substituições.');
    end if;
    
    select min(s.minuto_sub) into numMins
    from substituicoes s, jogo j
    where s.jogo_id_jogo = idJogo and s.jogador_id_jogador1 = idJogador and j.id_jogo = s.jogo_id_jogo;
    
    return numMins;
end;
/

-- G

create trigger cartoes
after insert
on jogador_sancao_disc
for each row
declare
    corcartao sancao_disc.cartao%type;
    
    nomeJog jogador.nome%type;
    nomeEqui equipa_estadio.nome%type;
begin
    select cartao into corcartao
    from sancao_disc
    where id_sancao = :new.sancao_disc_id_sancao;
    
    if (corcartao <> null and corcartao = 'Vermelho') then
        select nome into nomeJog
        from jogador
        where id_jogador = :new.jogador_id_jogador;
        
        select ee.nome into nomeEqui
        from equipa_estadio ee, jogador_equipa_estadio jee
        where ee.id_equipa = jee.equipa_estadio_id_equipa and jee.jogador_id_jogador = :new.jogador_id_jogador;
        
        insert into avisos(mensagem) values ('O jogador ' || nomeJog || ', da equipa ' || nomeEqui || ', estará suspenso durante dois jogos.');
    end if;
end;
/

-- H

create or replace function clubes_cidade(cidade varchar2) return varchar2
is
    cidade_existe number := 0;

    numAv number := 0;
    numMe number := 0;
    numDe number := 0;
    numGr number := 0;
begin
    select count(id_equipa) into cidade_existe
    from equipa_estadio
    where LOWER(estadio_localizacao) = LOWER(cidade);

    if (cidade_existe = 0) then
        raise_application_error(-20104, 'Nome ' || cidade || ' de Concelho inválido.');
    end if;

    select count(j.id_jogador) into numAv
    from jogador j, equipa_estadio ee, jogador_equipa_estadio jee
    where j.id_jogador = jee.jogador_id_jogador and jee.equipa_estadio_id_equipa = ee.id_equipa and
    LOWER(ee.estadio_localizacao) = LOWER(cidade) and j.naturalidade = 'Portugal' and j.posicao = 'Avançado';
    
    select count(j.id_jogador) into numMe
    from jogador j, equipa_estadio ee, jogador_equipa_estadio jee
    where j.id_jogador = jee.jogador_id_jogador and jee.equipa_estadio_id_equipa = ee.id_equipa and
    LOWER(ee.estadio_localizacao) = LOWER(cidade) and j.naturalidade = 'Portugal' and j.posicao = 'Médio';

    select count(j.id_jogador) into numDe
    from jogador j, equipa_estadio ee, jogador_equipa_estadio jee
    where j.id_jogador = jee.jogador_id_jogador and jee.equipa_estadio_id_equipa = ee.id_equipa and
    LOWER(ee.estadio_localizacao) = LOWER(cidade) and j.naturalidade = 'Portugal' and j.posicao = 'Defesa';

    select count(j.id_jogador) into numGr
    from jogador j, equipa_estadio ee, jogador_equipa_estadio jee
    where j.id_jogador = jee.jogador_id_jogador and jee.equipa_estadio_id_equipa = ee.id_equipa and
    LOWER(ee.estadio_localizacao) = LOWER(cidade) and j.naturalidade = 'Portugal' and j.posicao = 'Guarda-Redes';

    if (numAv > numMe) then
        if (numAv > numDe) then
            if (numAv > numGr) then
                return 'Avançado';
            else
                return 'Guarda-Redes';
            end if;
        else
            if (numDe > numGr) then
                return 'Defesa';
            else
                return 'Guarda-Redes';
            end if;
        end if;
    else
        if (numMe > numDe) then
            if (numMe > numGr) then
                return 'Médio';
            else
                return 'Guarda-Redes';
            end if;
        else
            if (numDe > numGr) then
                return 'Defesa';
            else
                return 'Guarda-Redes';
            end if;
        end if;
    end if;
end;
/

-- I

drop table aux;
/

create table aux(
    -- Posição...
    pos number,
    -- 0 = Melhor
    -- 1 = Pior
    mp number,
    -- id da equipa
    id_equipa number,
    primary key(id_equipa)
);
/

ALTER TABLE aux ADD CONSTRAINT aux_fk FOREIGN KEY (id_equipa) REFERENCES equipa_estadio(id_equipa);
/

create or replace procedure epoca_desportiva(idEpoca number)
is
    cursor melhores is select * from liga_equipa_estadio where liga_id_liga in (select id_liga from liga where epoca_id_epoca = idEpoca) order by pontos desc;
    cursor piores is select * from liga_equipa_estadio where liga_id_liga in (select id_liga from liga where epoca_id_epoca = idEpoca) order by pontos asc;
    
    x number := 0;
begin
    for c1 in melhores
    loop
        insert into aux(pos, mp, id_equipa) values(x, 0, c1.equipa_estadio_id_equipa);
        x := x + 1;
        exit when (x = 3);
    end loop;
    
    x := 0;
    
    for c2 in piores
    loop
        insert into aux(pos, mp, id_equipa) values(x, 1, c2.equipa_estadio_id_equipa);
        x := x + 1;
        exit when (x = 3);
    end loop;
end;
/

-- J

create or replace function idade(idade number, datInit date, datFin date) return number
is
    numGols number := 0;
    auxGols number := 0;
    cursor c1 is select * from jogador where idade = TRUNC(MONTHS_BETWEEN(SYSDATE, data_nasc))/12;
begin
    if (idade < 18 or idade > 100) then
        raise_application_error(-20105, 'Idade inválida');
    end if;
    
    if (datInit > sysdate or datInit > datFin) then
        raise_application_error(-20102, 'Data ' || to_char(datInit, 'dd-mm-yyyy') || ' inválida');
    end if;
    
    if (datFin > sysdate) then
        raise_application_error(-20102, 'Data ' || to_char(datFin, 'dd-mm-yyyy') || ' inválida');
    end if;

    for jo in c1
    loop
        select count(jj.jogador_id_jogador) into auxGols
        from jogador_jogo jj, jogo j
        where j.id_jogo = jj.jogo_id_jogo and jj.jogador_id_jogador = jo.id_jogador and j.data_jogo < datFin and j.data_jogo > datInit;
    
        numGols := numGols + auxGols;
    end loop;
    
    return numGols;
end;
/

-- K

create procedure alertas_treinador(idStaff number)
is
    idEquipa equipa_estadio.id_equipa%type;
    numJ number := 0;
    numV number := 0;
    numD number := 0;
    numGols number := 0;
    nomStaff staff.nome%type;
begin
    select nome into nomStaff
    from staff
    where id_staff = idStaff;

    select equipa_estadio_id_equipa into idEquipa
    from equipa_estadio_staff
    where staff_id_staff = idStaff;
    
    select numvitorias into numV
    from liga_equipa_estadio
    where equipa_estadio_id_equipa = idEquipa;
    
    select numderrotas into numD
    from liga_equipa_estadio
    where equipa_estadio_id_equipa = idEquipa;
    
    select numempates into numJ
    from liga_equipa_estadio
    where equipa_estadio_id_equipa = idEquipa;
    
    -- numJ tem num de empates... + Vitorias + derrotas = total jogos...
    numJ := numJ + numV + numD;

    select count(jj.jogo_id_jogo) into numGols
    from jogador_jogo jj, jogador_equipa_estadio jee
    where jee.jogador_id_jogador = jj.jogador_id_jogador and jee.equipa_estadio_id_equipa = idEquipa;

    insert into avisos(mensagem) values ('Treinador: ' || nomStaff || ' Número de jogos: ' || numJ || ' Número de vitórias: ' || numV || ' Número de derrotas: ' || numD || ' Número de golos: ' || numGols);
exception
    when others then
        raise_application_error(SQLCODE, SQLERRM);
end;
/

-- L -- NOPE


-- M

create or replace function tempo_medio_venda(idEquipa number) return number
is
    EquipEx number := 0;
    
    media number := 0;
    cont number := 0;
    
    cursor c1 is select nvl(min(jj.minuto_marc), 0) mini, j.id_jogo jogi
    from jogo j, jogador_jogo jj, jogador_equipa_estadio jee
    where j.id_jogo = jj.JOGO_ID_JOGO and jj.jogador_id_jogador = jee.jogador_id_jogador and
    j.equipa_estadio_id_equipa = idEquipa and jee.equipa_estadio_id_equipa = idEquipa
    group by j.id_jogo;
begin
    select count(*) into EquipEx
    from equipa_estadio
    where id_equipa = idEquipa;

    if (EquipEx = 0) then
        raise_application_error(-20106, 'Nome/ID ' || idEquipa || ' de equipa inválido.');
    end if;

    for jog in c1
    loop
        declare
            testvar sancao_disc.cartao%type;
        begin
            select cartao into testvar
            from sancao_disc
            where jogo_id_jogo = jog.jogi;

            if (testvar <> 'Vermelho') then
                media := media + jog.mini;
                cont := cont + 1;
            end if;

        exception
            when no_data_found then
            -- não existe sançães neste jogo...
                media := media + jog.mini;
                cont := cont + 1;
        end;
    end loop;

    return media / cont;
end;
/

-- N -- Procedimento para chamar o trigger add_golos_jog

create procedure add_golo(idJogador number, idJogo number, minuto number)
is

begin
    declare
        tesvar number;
    begin
        select id_jogador into tesvar
        from jogador
        where idJogador = id_jogador;
    exception
        when no_data_found then
            raise_application_error(-20113, 'ID ' || idJogador || ' do jogador inválido.');
    end;

    declare
        tesvar number;
    begin
        select id_jogo into tesvar
        from jogo
        where id_jogo = idJogo;
    exception
        when no_data_found then
            raise_application_error(-20110, 'Não existem jogos.');
    end;

    if (minuto < 0 or minuto > 200) then
        raise_application_error(-20112, 'Minutos inválidos.');
    end if;

    insert into jogador_jogo values(idJogador, idJogo, minuto);
end;
/

-- O -- NOPE


-- P -- Trigger para atualizar o numero de golos e numero de golos sufridos dos jogadores

create or replace trigger add_golos_jog
before insert
on jogador_jogo
for each row
declare

    EquipGol number;
    EquipD number;

    GR number;

begin
    select jee.equipa_estadio_id_equipa into EquipGol
    from jogador_equipa_estadio jee
    where jee.jogador_id_jogador = :new.jogador_id_jogador;

    select j.equipa_estadio_id_equipa1 into EquipD
    from jogo j
    where j.id_jogo = :new.jogo_id_jogo;

    if (EquipD = EquipGol) then
        select j.equipa_estadio_id_equipa into EquipD
        from jogo j
        where j.id_jogo = :new.jogo_id_jogo;
    end if;

    update jogador set golos = golos + 1 where :new.jogador_id_jogador = id_jogador;

    select jee.jogador_id_jogador into GR
    from jogador_equipa_estadio jee, jogador jog
    where jee.equipa_estadio_id_equipa = EquipD and jee.jogador_id_jogador = jog.id_jogador and LOWER(jog.posicao) = 'guarda-redes';

    update jogador set golos_suf = golos_suf + 1 where GR = id_jogador;
end;
/
