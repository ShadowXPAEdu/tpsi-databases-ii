-- CTTPSI21 pass: bd

/*
*
*	CTeSP: TPSI
*	2018/2019
*
*	Insert Data
*
*	Pedro dos Santos Alves	a21270246
*	Leandro Adão Fidalgo	a21270093
*
*/


-- Tabela Epoca

insert into epoca (id_epoca, nome, data_inicio, data_fim) values (1, '2014/2015', to_date('2014-05-16', 'yyyy-mm-dd'), to_date('2015-05-16', 'yyyy-mm-dd'));
insert into epoca (id_epoca, nome, data_inicio, data_fim) values (2, '2015/2016', to_date('2015-04-14', 'yyyy-mm-dd'), to_date('2016-04-14', 'yyyy-mm-dd'));
insert into epoca (id_epoca, nome, data_inicio, data_fim) values (3, '2016/2017', to_date('2016-11-15', 'yyyy-mm-dd'), to_date('2017-11-15', 'yyyy-mm-dd'));
insert into epoca (id_epoca, nome, data_inicio, data_fim) values (4, '2017/2018', to_date('2017-11-10', 'yyyy-mm-dd'), to_date('2018-11-10', 'yyyy-mm-dd'));


-- Tabela Liga

insert into liga (id_liga, nome, epoca_id_epoca) values (1, 'Primeira Divisão', 1);
insert into liga (id_liga, nome, epoca_id_epoca) values (2, 'Primeira Divisão', 2);
insert into liga (id_liga, nome, epoca_id_epoca) values (3, 'Primeira Divisão', 3);
insert into liga (id_liga, nome, epoca_id_epoca) values (4, 'Primeira Divisão', 4);
insert into liga (id_liga, nome, epoca_id_epoca) values (5, 'Segunda Divisão', 1);
insert into liga (id_liga, nome, epoca_id_epoca) values (6, 'Segunda Divisão', 2);
insert into liga (id_liga, nome, epoca_id_epoca) values (7, 'Segunda Divisão', 3);
insert into liga (id_liga, nome, epoca_id_epoca) values (8, 'Segunda Divisão', 4);


-- Tabela Patrocinador

insert into patrocinador (id_patrocinador, nome) values (1, 'Adidas');
insert into patrocinador (id_patrocinador, nome) values (2, 'Macron');
insert into patrocinador (id_patrocinador, nome) values (3, 'Lacatoni');
insert into patrocinador (id_patrocinador, nome) values (4, 'New Balance');


-- Tabela Equipa_Estadio

insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (1, 'Benfica', to_date('1904-02-28', 'yyyy-mm-dd'), 'Adidas', 'Glorioso', 'Estádio da Luz', 64642, 'Lisboa', 4);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (2, 'Sporting', to_date('1906-07-01', 'yyyy-mm-dd'), 'Macron', 'Leões', 'Estádio José Alvalade', 50095, 'Lisboa', 4);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (3, 'Académica', to_date('1887-11-03', 'yyyy-mm-dd'), 'Lacatoni', 'Estudantes', 'Estádio Cidade de Coimbra', 29622, 'Coimbra', 4);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (4, 'Porto', to_date('1893-09-28', 'yyyy-mm-dd'), 'New Balance', 'Dragões', 'Estádio do Dragão', 50035, 'Porto', 4);
--insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (5, 'Braga', to_date('1921-01-19', 'yyyy-mm-dd'), 'Lacatoni', 'Arsenalistas', 'Estádio Municipal de Braga', 30286, 'Braga', 4);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (6, 'Benfica B', to_date('1999-02-28', 'yyyy-mm-dd'), 'Adidas', null, 'Caixa Futebol Campus', 5000, 'Seixal', 8);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (7, 'Sporting B', to_date('2000-07-01', 'yyyy-mm-dd'), 'Macron', 'Leões', 'Estádio Aurélio Pereira', 1200, 'Lisboa', 8);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (8, 'Porto B', to_date('1999-09-28', 'yyyy-mm-dd'), 'New Balance', 'Dragões', 'Estádio Dr. Jorge Sampaio', 8272, 'Porto', 8);
insert into equipa_estadio (id_equipa, nome, fundacao, material_desportivo, alcunha, estadio_nome, estadio_capacidade, estadio_localizacao, liga_id_liga) values (9, 'Braga B', to_date('1998-01-19', 'yyyy-mm-dd'), 'Lacatoni', 'Arsenalistas', 'Estádio 1º de Maio', 30000, 'Braga', 8);


-- Tabela Staff

-- Benfica
insert into staff (id_staff, nacionalidade, nome, tipo) values (1, 'Portuguese', 'Rui Vitória', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (2, 'Portuguese', 'Luís Filipe Vieira', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (3, 'Portuguese', 'Minervino Pietra', 'Treinador Adjunto');
-- Sporting
insert into staff (id_staff, nacionalidade, nome, tipo) values (4, 'Dutch', 'Marcel Keizer', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (5, 'Portuguese', 'Frederico Varandas', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (6, 'Portuguese', 'Nélson Pereira', 'Treinador Adjunto');
-- Académica
insert into staff (id_staff, nacionalidade, nome, tipo) values (7, 'Portuguese', 'João Alves', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (8, 'Portuguese', 'Pedro Dias Roxo', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (9, 'Portuguese', 'Tó Sá', 'Treinador Adjunto');
-- Porto
insert into staff (id_staff, nacionalidade, nome, tipo) values (10, 'Portuguese', 'Sérgio Conceição', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (11, 'Portuguese', 'Jorge Costa', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (12, 'French', 'Siramana Dembélé', 'Treinador Adjunto');
-- Braga
--insert into staff (id_staff, nacionalidade, nome, tipo) values (13, 'Portuguese', 'Abel Ferreira', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (14, 'Portuguese', 'Manuel Machado', 'Presidente');
--insert into staff (id_staff, nacionalidade, nome, tipo) values (15, 'Portuguese', 'Carlos Martinho', 'Treinador Adjunto');
-- Benfica B
insert into staff (id_staff, nacionalidade, nome, tipo) values (16, 'Portuguese', 'Bruno Lage', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (17, 'Chinese', 'Kerstin Nalder', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (18, 'Portuguese', 'Alexandre Silva', 'Treinador Adjunto');
-- Sporting B
insert into staff (id_staff, nacionalidade, nome, tipo) values (19, 'Portuguese', 'Luís Martins', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (20, 'Estonian', 'Audre Southall', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (21, 'Northern Sotho', 'Cindie Malletratt', 'Treinador Adjunto');
-- Porto B
insert into staff (id_staff, nacionalidade, nome, tipo) values (22, 'Portuguese', 'Rui Barros', 'Treinador');
insert into staff (id_staff, nacionalidade, nome, tipo) values (23, 'Finnish', 'Darcie Goodwill', 'Presidente');
insert into staff (id_staff, nacionalidade, nome, tipo) values (24, 'Burmese', 'Mar Vallow', 'Treinador Adjunto');
-- Braga B
insert into staff (id_staff, nacionalidade, nome, tipo) values (25, 'Portuguese', 'João Aroso', 'Treinador');
--insert into staff (id_staff, nacionalidade, nome, tipo) values (26, 'Portuguese', 'António Salvador', 'Presidente');            -- President: 14 Ignore: 26
insert into staff (id_staff, nacionalidade, nome, tipo) values (27, 'Bulgarian', 'Dahlia Royston', 'Treinador Adjunto');


-- Tabela Liga_Equipa_Estadio -- Classificacao

-- Primeira Liga: Benfica
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (4, 1, 12, 0, 0, 12, 36);
-- Primeira Liga: Sporting
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (4, 2, 0, 8, 4, 0, 4);
-- Primeira Liga: Académica
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (4, 3, 0, 8, 4, 0, 4);
-- Primeira Liga: Porto
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (4, 4, 8, 4, 0, 2, 24);
-- Primeira Liga: Braga
--insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (4, 5, 9, 2, 3, 0, 30);
-- Segunda Liga: Benfica B
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (8, 6, 8, 1, 0, 7, 24);
-- Segunda Liga: Sporting B
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (8, 7, 2, 2, 5, 0, 11);
-- Segunda Liga: Porto B
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (8, 8, 0, 7, 2, 0, 17);
-- Segunda Liga: Braga B
insert into liga_equipa_estadio (liga_id_liga, equipa_estadio_id_equipa, numvitorias, numderrotas, numempates, numvitoriascons, pontos) values (8, 9, 3, 3, 3, 0, 13);


-- Tabela Jogo

insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (1, to_date('2017-11-13 17:30', 'yyyy-mm-dd HH24:MI'), 3, 2, 1, 1, 2);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (2, to_date('2017-11-14 19:30', 'yyyy-mm-dd HH24:MI'), 3, 1, 1, 6, 8);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (3, to_date('2017-11-15 10:30', 'yyyy-mm-dd HH24:MI'), 2, 0, 1, 4, 3);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (4, to_date('2017-11-17 21:30', 'yyyy-mm-dd HH24:MI'), 1, 1, 1, 7, 9);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (5, to_date('2017-11-20 15:30', 'yyyy-mm-dd HH24:MI'), 2, 2, 2, 2, 3);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (6, to_date('2017-11-21 18:30', 'yyyy-mm-dd HH24:MI'), 0, 2, 2, 8, 9);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (7, to_date('2017-11-22 19:00', 'yyyy-mm-dd HH24:MI'), 3, 0, 2, 1, 4);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (8, to_date('2017-11-23 17:00', 'yyyy-mm-dd HH24:MI'), 0, 1, 2, 6, 7);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (9, to_date('2017-11-27 19:30', 'yyyy-mm-dd HH24:MI'), 1, 0, 3, 1, 3);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (10, to_date('2017-11-28 21:30', 'yyyy-mm-dd HH24:MI'), 2, 0, 3, 4, 2);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (11, to_date('2017-11-29 22:00', 'yyyy-mm-dd HH24:MI'), 3, 1, 3, 6, 9);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (12, to_date('2017-11-30 16:30', 'yyyy-mm-dd HH24:MI'), 2, 2, 3, 7, 8);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (13, to_date('2017-12-04 10:00', 'yyyy-mm-dd HH24:MI'), 1, 2, 4, 4, 1);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (14, to_date('2017-12-05 11:30', 'yyyy-mm-dd HH24:MI'), 0, 0, 4, 3, 2);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (15, to_date('2017-12-06 14:30', 'yyyy-mm-dd HH24:MI'), 0, 1, 4, 7, 6);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (16, to_date('2017-12-07 14:30', 'yyyy-mm-dd HH24:MI'), 1, 0, 4, 9, 8);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (17, to_date('2017-12-12 19:30', 'yyyy-mm-dd HH24:MI'), 0, 1, 5, 3, 4);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (18, to_date('2017-12-13 20:00', 'yyyy-mm-dd HH24:MI'), 1, 2, 5, 2, 1);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (19, to_date('2017-12-14 22:00', 'yyyy-mm-dd HH24:MI'), 0, 0, 5, 9, 7);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (20, to_date('2017-12-15 15:30', 'yyyy-mm-dd HH24:MI'), 1, 3, 5, 8, 6);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (21, to_date('2017-12-18 16:30', 'yyyy-mm-dd HH24:MI'), 0, 1, 6, 2, 4);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (22, to_date('2017-12-19 20:00', 'yyyy-mm-dd HH24:MI'), 0, 1, 6, 3, 1);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (23, to_date('2017-12-21 10:30', 'yyyy-mm-dd HH24:MI'), 1, 2, 6, 9, 6);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (24, to_date('2017-12-22 12:00', 'yyyy-mm-dd HH24:MI'), 1, 3, 6, 8, 7);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (25, to_date('2017-12-25 18:30', 'yyyy-mm-dd HH24:MI'), 1, 0, 7, 4, 2);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (26, to_date('2017-12-26 20:30', 'yyyy-mm-dd HH24:MI'), 1, 0, 7, 6, 9);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (27, to_date('2017-12-27 13:30', 'yyyy-mm-dd HH24:MI'), 2, 0, 7, 1, 3);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (28, to_date('2017-12-29 14:30', 'yyyy-mm-dd HH24:MI'), 0, 0, 7, 7, 8);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (29, to_date('2018-01-02 14:00', 'yyyy-mm-dd HH24:MI'), 1, 0, 8, 6, 7);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (30, to_date('2018-01-03 17:30', 'yyyy-mm-dd HH24:MI'), 2, 0, 8, 1, 4);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (31, to_date('2018-01-04 20:30', 'yyyy-mm-dd HH24:MI'), 0, 1, 8, 8, 9);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (32, to_date('2018-01-05 21:00', 'yyyy-mm-dd HH24:MI'), 1, 1, 8, 2, 3);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (33, to_date('2018-01-09 10:30', 'yyyy-mm-dd HH24:MI'), 2, 0, 9, 1, 2);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (34, to_date('2018-01-10 10:00', 'yyyy-mm-dd HH24:MI'), 1, 0, 9, 6, 8);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (35, to_date('2018-01-11 14:30', 'yyyy-mm-dd HH24:MI'), 1, 0, 9, 4, 3);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (36, to_date('2018-01-12 13:00', 'yyyy-mm-dd HH24:MI'), 1, 1, 9, 7, 9);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (37, to_date('2018-01-15 21:30', 'yyyy-mm-dd HH24:MI'), 0, 1, 10, 4, 1);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (38, to_date('2018-01-18 20:30', 'yyyy-mm-dd HH24:MI'), 2, 2, 10, 3, 2);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (39, to_date('2018-01-23 19:30', 'yyyy-mm-dd HH24:MI'), 1, 2, 11, 3, 1);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (40, to_date('2018-01-25 17:30', 'yyyy-mm-dd HH24:MI'), 0, 2, 11, 2, 4);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (41, to_date('2018-01-29 16:00', 'yyyy-mm-dd HH24:MI'), 0, 1, 12, 2, 1);
insert into jogo (id_jogo, data_jogo, res_casa, res_fora, jornada, equipa_estadio_id_equipa, equipa_estadio_id_equipa1) values (42, to_date('2018-01-30 19:30', 'yyyy-mm-dd HH24:MI'), 0, 4, 12, 3, 4);


-- Tabela Jogador -- PARA FAZER -> ADICIONAR JOGADORES SUBSTITUTOS

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (1, 'Becki Sneller', 'Portugal', 'Portuguese', to_date('1998-11-07', 'yyyy-mm-dd'), 170, 537365, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (2, 'Rois Binnes', 'Portugal', 'Portuguese', to_date('1985-01-21', 'yyyy-mm-dd'), 193, 656041, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (3, 'Vanny Pedrocchi', 'Portugal', 'Portuguese', to_date('1992-10-30', 'yyyy-mm-dd'), 162, 573213, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (4, 'Collette McLoughlin', 'Portugal', 'Portuguese', to_date('1991-02-02', 'yyyy-mm-dd'), 177, 541830, 'Avançado', 'Direito', 5, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (5, 'Inesita Loughnan', 'Portugal', 'Portuguese', to_date('1999-03-03', 'yyyy-mm-dd'), 190, 559604, 'Avançado', 'Direito', 4, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (6, 'Shirlene Janodet', 'Portugal', 'Portuguese', to_date('1992-08-22', 'yyyy-mm-dd'), 170, 575408, 'Guarda-Redes', 'Direito', 0, 5);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (7, 'Lorrin Poolman', 'Portugal', 'Portuguese', to_date('1990-04-30', 'yyyy-mm-dd'), 167, 606153, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (8, 'Alexis Colloby', 'Portugal', 'Portuguese', to_date('1989-10-12', 'yyyy-mm-dd'), 166, 635463, 'Avançado', 'Esquerdo', 13, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (9, 'Joice Danelutti', 'Brazil', 'Brazillian', to_date('1990-12-01', 'yyyy-mm-dd'), 187, 615377, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (10, 'Natty Kloser', 'Portugal', 'Portuguese', to_date('1986-09-08', 'yyyy-mm-dd'), 172, 558785, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (11, 'Karl Stent', 'Portugal', 'Portuguese', to_date('1989-10-13', 'yyyy-mm-dd'), 191, 659347, 'Defesa', 'Direito', 0, 0);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (89, 'Fae Furlonge', 'Portugal', 'Portuguese', to_date('2000-06-20', 'yyyy-mm-dd'), 178, 639969, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (90, 'Shae Jillings', 'Portugal', 'Portuguese', to_date('1990-08-31', 'yyyy-mm-dd'), 190, 599449, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (91, 'Zola Culleton', 'Portugal', 'Portuguese', to_date('1995-09-23', 'yyyy-mm-dd'), 186, 587250, 'Defesa', 'Esquerdo', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (12, 'Oralie Ruvel', 'France', 'French', to_date('1997-04-04', 'yyyy-mm-dd'), 162, 624143, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (13, 'Benjamen Monahan', 'Portugal', 'Portuguese', to_date('1990-05-14', 'yyyy-mm-dd'), 175, 623985, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (14, 'Lay Messent', 'Brazil', 'Brazillian', to_date('1986-03-27', 'yyyy-mm-dd'), 177, 617409, 'Avançado', 'Direito', 3, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (15, 'Israel Bannon', 'France', 'French', to_date('1993-09-10', 'yyyy-mm-dd'), 192, 540177, 'Avançado', 'Direito', 3, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (16, 'Meagan Meeke', 'Portugal', 'Portuguese', to_date('1985-12-08', 'yyyy-mm-dd'), 160, 666724, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (17, 'Willabella Carluccio', 'Portugal', 'Portuguese', to_date('1991-11-26', 'yyyy-mm-dd'), 175, 562820, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (18, 'Lemar Guyonnet', 'Brazil', 'Brazillian', to_date('1998-09-13', 'yyyy-mm-dd'), 181, 586289, 'Avançado', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (19, 'Robin Wathell', 'Brazil', 'Brazillian', to_date('1993-07-13', 'yyyy-mm-dd'), 169, 648316, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (20, 'Ruy Pickles', 'Portugal', 'Portuguese', to_date('1989-08-06', 'yyyy-mm-dd'), 200, 642345, 'Guarda-Redes', 'Esquerdo', 0, 19);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (21, 'Bernie Braams', 'Portugal', 'Portuguese', to_date('1991-01-11', 'yyyy-mm-dd'), 199, 660961, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (22, 'Nikolos Billiard', 'Portugal', 'Portuguese', to_date('1985-05-06', 'yyyy-mm-dd'), 189, 550804, 'Defesa', 'Direito', 0, 0);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (92, 'Gleda Scandwright', 'Portugal', 'Portuguese', to_date('1996-10-22', 'yyyy-mm-dd'), 166, 623286, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (93, 'Salmon Pummell', 'Portugal', 'Portuguese', to_date('1991-03-26', 'yyyy-mm-dd'), 185, 619341, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (94, 'Jami Cosgra', 'Portugal', 'Portuguese', to_date('1991-11-12', 'yyyy-mm-dd'), 165, 595767, 'Médio', 'Direito', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (23, 'Jeri Dyka', 'Brazil', 'Brazillian', to_date('1997-03-28', 'yyyy-mm-dd'), 198, 629924, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (24, 'Isabelita Tuite', 'Portugal', 'Portuguese', to_date('1986-06-12', 'yyyy-mm-dd'), 171, 595222, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (25, 'Sheree Bilham', 'Portugal', 'Portuguese', to_date('1983-07-01', 'yyyy-mm-dd'), 162, 571265, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (26, 'Pippo Frampton', 'France', 'French', to_date('1991-11-25', 'yyyy-mm-dd'), 159, 558569, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (27, 'Auberon Labrom', 'Brazil', 'Brazillian', to_date('1996-10-04', 'yyyy-mm-dd'), 173, 642008, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (28, 'Francis Spilsted', 'Portugal', 'Portuguese', to_date('1991-02-27', 'yyyy-mm-dd'), 177, 601317, 'Avançado', 'Direito', 3, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (29, 'Seline Pluck', 'Portugal', 'Portuguese', to_date('1983-03-31', 'yyyy-mm-dd'), 173, 655105, 'Avançado', 'Esquerdo', 3, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (30, 'Corry Saffill', 'Brazil', 'Brazillian', to_date('1991-08-11', 'yyyy-mm-dd'), 182, 600251, 'Avançado', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (31, 'Jim Loblie', 'France', 'French', to_date('1994-09-10', 'yyyy-mm-dd'), 155, 644460, 'Guarda-Redes', 'Esquerdo', 0, 19);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (32, 'Kathleen Dowker', 'Portugal', 'Portuguese', to_date('1991-07-02', 'yyyy-mm-dd'), 200, 528382, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (33, 'Wilhelm Rennix', 'Portugal', 'Portuguese', to_date('1986-05-17', 'yyyy-mm-dd'), 160, 600203, 'Defesa', 'Esquerdo', 0, 0);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (95, 'Orlando Fautley', 'Portugal', 'Portuguese', to_date('1991-01-27', 'yyyy-mm-dd'), 174, 563334, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (96, 'Kenneth Tames', 'Portugal', 'Portuguese', to_date('1999-08-12', 'yyyy-mm-dd'), 168, 609261, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (97, 'Bastien Clurow', 'Portugal', 'Portuguese', to_date('1985-12-06', 'yyyy-mm-dd'), 180, 637984, 'Defesa', 'Esquerdo', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (34, 'Ola Rubes', 'Portugal', 'Portuguese', to_date('1986-09-25', 'yyyy-mm-dd'), 162, 556875, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (35, 'Lawrence Vern', 'France', 'French', to_date('1993-01-03', 'yyyy-mm-dd'), 166, 525322, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (36, 'Cecile Strickett', 'Brazil', 'Brazillian', to_date('1987-05-31', 'yyyy-mm-dd'), 195, 588346, 'Guarda-Redes', 'Direito', 0, 8);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (37, 'Roosevelt Boards', 'Portugal', 'Portuguese', to_date('1996-12-02', 'yyyy-mm-dd'), 195, 570951, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (38, 'Sandi Carroll', 'Portugal', 'Portuguese', to_date('1995-07-15', 'yyyy-mm-dd'), 163, 598420, 'Avançado', 'Esquerdo', 5, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (39, 'Aylmar Zanini', 'Portugal', 'Portuguese', to_date('1983-03-22', 'yyyy-mm-dd'), 182, 650325, 'Avançado', 'Direito', 2, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (40, 'Jeni Gilogly', 'Portugal', 'Portuguese', to_date('1996-12-02', 'yyyy-mm-dd'), 199, 547260, 'Avançado', 'Direito', 8, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (41, 'Ellswerth Scarlin', 'Portugal', 'Portuguese', to_date('1996-12-24', 'yyyy-mm-dd'), 172, 587985, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (42, 'Sherilyn Vannoort', 'Brazil', 'Brazillian', to_date('1984-08-24', 'yyyy-mm-dd'), 195, 594456, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (43, 'Rhodie Goggan', 'Portugal', 'Portuguese', to_date('1985-10-07', 'yyyy-mm-dd'), 180, 561656, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (44, 'Konstantin Care', 'Portugal', 'Portuguese', to_date('1988-07-24', 'yyyy-mm-dd'), 195, 659986, 'Médio', 'Direito', 0, 0);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (98, 'Clarie McMoyer', 'Portugal', 'Portuguese', to_date('1995-04-20', 'yyyy-mm-dd'), 185, 574009, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (99, 'Caron Baress', 'Portugal', 'Portuguese', to_date('1998-08-16', 'yyyy-mm-dd'), 187, 605039, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (100, 'Preston Gashion', 'Portugal', 'Portuguese', to_date('1990-07-30', 'yyyy-mm-dd'), 177, 599081, 'Médio', 'Esquerdo', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (45, 'Percy Tremlett', 'United Kingdom', 'English', to_date('1994-11-08', 'yyyy-mm-dd'), 198, 658645, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (46, 'Jennilee Bardsley', 'Portugal', 'Portuguese', to_date('1995-10-18', 'yyyy-mm-dd'), 177, 528951, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (47, 'Ben Dytham', 'Brazil', 'Brazillian', to_date('1996-07-31', 'yyyy-mm-dd'), 188, 565327, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (48, 'Nathanial Torrent', 'Portugal', 'Portuguese', to_date('1986-03-13', 'yyyy-mm-dd'), 160, 537605, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (49, 'Charyl Bavridge', 'Brazil', 'Brazillian', to_date('1987-11-29', 'yyyy-mm-dd'), 181, 568036, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (50, 'Sanford McGivena', 'Brazil', 'Brazillian', to_date('1997-01-12', 'yyyy-mm-dd'), 174, 566646, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (51, 'Mora Sevier', 'Portugal', 'Portuguese', to_date('1999-10-10', 'yyyy-mm-dd'), 199, 641049, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (52, 'Gizela Park', 'Portugal', 'Portuguese', to_date('1985-07-03', 'yyyy-mm-dd'), 172, 591550, 'Avançado', 'Esquerdo', 3, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (53, 'Nathanial Akitt', 'Portugal', 'Portuguese', to_date('1994-02-09', 'yyyy-mm-dd'), 168, 610387, 'Avançado', 'Direito', 10, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (54, 'Blinnie Enders', 'Portugal', 'Portuguese', to_date('1990-12-08', 'yyyy-mm-dd'), 164, 615865, 'Avançado', 'Esquerdo', 2, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (55, 'Barb Physick', 'Portugal', 'Portuguese', to_date('1987-08-19', 'yyyy-mm-dd'), 177, 650695, 'Guarda-Redes', 'Direito', 0, 5);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (101, 'Carol-jean Wakenshaw', 'Portugal', 'Portuguese', to_date('2000-05-23', 'yyyy-mm-dd'), 174, 570782, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (102, 'Maggee Gueinn', 'Portugal', 'Portuguese', to_date('1986-12-30', 'yyyy-mm-dd'), 179, 644887, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (103, 'Flynn Cluitt', 'Portugal', 'Portuguese', to_date('1999-07-02', 'yyyy-mm-dd'), 176, 542320, 'Médio', 'Direito', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (56, 'Noelyn Brassill', 'Brazil', 'Brazillian', to_date('1992-02-06', 'yyyy-mm-dd'), 187, 594715, 'Avançado', 'Direito', 4, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (57, 'Cinda Malzard', 'Portugal', 'Portuguese', to_date('1989-01-15', 'yyyy-mm-dd'), 166, 659306, 'Avançado', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (58, 'Donia Ogborne', 'France', 'French', to_date('1985-03-21', 'yyyy-mm-dd'), 157, 633731, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (59, 'Rudd Iacomini', 'Portugal', 'Portuguese', to_date('1997-11-05', 'yyyy-mm-dd'), 155, 594651, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (60, 'Derrick Brolan', 'France', 'French', to_date('1993-08-22', 'yyyy-mm-dd'), 158, 635009, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (61, 'Hesther Balden', 'France', 'French', to_date('1988-06-22', 'yyyy-mm-dd'), 162, 629745, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (62, 'Pietra Custed', 'Brazil', 'Brazillian', to_date('1997-05-26', 'yyyy-mm-dd'), 163, 660352, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (63, 'Felice Berryman', 'Portugal', 'Portuguese', to_date('1996-11-15', 'yyyy-mm-dd'), 198, 588696, 'Guarda-Redes', 'Direito', 0, 7);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (64, 'Gerrilee Meaker', 'Portugal', 'Portuguese', to_date('1990-08-23', 'yyyy-mm-dd'), 175, 649189, 'Avançado', 'Direito', 1, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (65, 'Mariellen Martini', 'Portugal', 'Portuguese', to_date('1995-02-07', 'yyyy-mm-dd'), 189, 531382, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (66, 'Rockie Boyer', 'Portugal', 'Portuguese', to_date('1987-10-04', 'yyyy-mm-dd'), 190, 666876, 'Médio', 'Direito', 0, 0);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (104, 'Gwyneth Worsom', 'Portugal', 'Portuguese', to_date('1986-04-09', 'yyyy-mm-dd'), 180, 647327, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (105, 'Melissa Dibley', 'Portugal', 'Portuguese', to_date('1989-11-06', 'yyyy-mm-dd'), 183, 625731, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (106, 'Agnes Jepperson', 'Portugal', 'Portuguese', to_date('1999-12-10', 'yyyy-mm-dd'), 168, 572561, 'Defesa', 'Direito', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (67, 'Stephannie Brimicombe', 'Portugal', 'Portuguese', to_date('1989-12-29', 'yyyy-mm-dd'), 200, 663427, 'Médio', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (68, 'Herminia Danels', 'Brazil', 'Brazillian', to_date('1983-07-18', 'yyyy-mm-dd'), 171, 661063, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (69, 'Kaspar Hounson', 'France', 'French', to_date('1983-07-11', 'yyyy-mm-dd'), 164, 664317, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (70, 'Kerry Viscovi', 'Brazil', 'Brazillian', to_date('1984-05-25', 'yyyy-mm-dd'), 166, 617070, 'Avançado', 'Direito', 1, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (71, 'Lane Learoyde', 'Portugal', 'Portuguese', to_date('1983-09-06', 'yyyy-mm-dd'), 192, 636174, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (72, 'Kale Lawlings', 'Portugal', 'Portuguese', to_date('1986-04-10', 'yyyy-mm-dd'), 176, 564442, 'Defesa', 'Esquerdo', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (73, 'Alicia Burditt', 'Portugal', 'Portuguese', to_date('1984-12-26', 'yyyy-mm-dd'), 176, 655979, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (74, 'Davy Arrowsmith', 'Portugal', 'Portuguese', to_date('1995-07-09', 'yyyy-mm-dd'), 174, 629628, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (75, 'Jerrilee Gullick', 'Portugal', 'Portuguese', to_date('1983-09-03', 'yyyy-mm-dd'), 175, 583135, 'Avançado', 'Direito', 3, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (76, 'Nolly Quig', 'Portugal', 'Portuguese', to_date('1995-11-16', 'yyyy-mm-dd'), 183, 569275, 'Avançado', 'Direito', 1, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (77, 'Ollie Fer', 'Portugal', 'Portuguese', to_date('1987-03-26', 'yyyy-mm-dd'), 200, 615071, 'Guarda-Redes', 'Direito', 0, 16);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (107, 'Ignacio Wyper', 'Portugal', 'Portuguese', to_date('1988-09-21', 'yyyy-mm-dd'), 188, 606372, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (108, 'Cybil Kestle', 'Portugal', 'Portuguese', to_date('1987-01-08', 'yyyy-mm-dd'), 179, 593716, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (109, 'Marv Awin', 'Portugal', 'Portuguese', to_date('1995-11-03', 'yyyy-mm-dd'), 188, 643730, 'Médio', 'Direito', 0, 0);


insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (78, 'Eryn Splevin', 'Portugal', 'Portuguese', to_date('1994-03-30', 'yyyy-mm-dd'), 187, 653494, 'Avançado', 'Esquerdo', 1, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (79, 'Phillipp Cattel', 'Portugal', 'Portuguese', to_date('1994-02-21', 'yyyy-mm-dd'), 195, 569674, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (80, 'Mommy Bradder', 'Portugal', 'Portuguese', to_date('1985-08-28', 'yyyy-mm-dd'), 172, 529222, 'Avançado', 'Direito', 2, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (81, 'Gerardo Dolohunty', 'Brazil', 'Brazillian', to_date('1983-12-16', 'yyyy-mm-dd'), 160, 560264, 'Avançado', 'Direito', 5, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (82, 'Dav Wallege', 'Portugal', 'Portuguese', to_date('1999-03-04', 'yyyy-mm-dd'), 158, 541191, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (83, 'Blondell Towler', 'Portugal', 'Portuguese', to_date('1986-06-05', 'yyyy-mm-dd'), 170, 565620, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (84, 'Chrissie Powney', 'United Kingdom', 'English', to_date('1987-11-19', 'yyyy-mm-dd'), 200, 586708, 'Guarda-Redes', 'Direito', 0, 8);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (85, 'Karalynn Lorraway', 'Portugal', 'Portuguese', to_date('1989-08-28', 'yyyy-mm-dd'), 173, 628782, 'Médio', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (86, 'Silvanus Skedge', 'Brazil', 'Brazillian', to_date('1991-12-03', 'yyyy-mm-dd'), 174, 582490, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (87, 'Morly Kinsella', 'Portugal', 'Portuguese', to_date('1984-01-06', 'yyyy-mm-dd'), 156, 565824, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (88, 'Edan Royste', 'Spain', 'Spanish', to_date('1996-08-01', 'yyyy-mm-dd'), 182, 581776, 'Médio', 'Direito', 0, 0);

insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (110, 'Towney Lemmer', 'Portugal', 'Portuguese', to_date('1992-06-17', 'yyyy-mm-dd'), 174, 614478, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (111, 'Frants Brownfield', 'Portugal', 'Portuguese', to_date('1999-02-26', 'yyyy-mm-dd'), 178, 588253, 'Defesa', 'Direito', 0, 0);
insert into jogador (id_jogador, nome, naturalidade, nacionalidade, data_nasc, altura, salario, posicao, pe, golos, golos_suf) values (112, 'Lib Colkett', 'Portugal', 'Portuguese', to_date('1994-07-25', 'yyyy-mm-dd'), 171, 601716, 'Médio', 'Direito', 0, 0);


-- Tabela Sancao_Disc

insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (1, 4, 'Vermelho', 66102);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (2, 6, 'Amarelo', 213);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (3, 23, 'Amarelo', 92088);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (4, 24, 'Amarelo', 33286);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (5, 31, null, 94140);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (6, 42, null, 8719);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (7, 1, 'Amarelo', 2184);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (8, 23, 'Vermelho', 80228);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (9, 34, 'Amarelo', 69076);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (10, 35, 'Vermelho', 44100);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (11, 34, 'Amarelo', 8936);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (12, 23, 'Vermelho', 10404);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (13, 12, 'Vermelho', 69053);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (14, 15, null, 3492);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (15, 25, 'Vermelho', 93735);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (16, 32, 'Vermelho', 25865);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (17, 41, 'Vermelho', 88525);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (18, 3, null, 63859);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (19, 22, 'Amarelo', 13638);
insert into sancao_disc (id_sancao, jogo_id_jogo, cartao, coima) values (20, 14, 'Amarelo', 37167);


-- Tabela Liga+Equipa+Estadio -- Equipa Vencedora

insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (1, 1, to_date('2015-05-16', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (2, 2, to_date('2016-04-14', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (1, 3, to_date('2017-11-15', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (1, 4, to_date('2018-11-10', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (7, 5, to_date('2015-05-16', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (8, 6, to_date('2016-04-14', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (6, 7, to_date('2017-11-15', 'yyyy-mm-dd'));
insert into equipa_estadio_liga (equipa_estadio_id_equipa, liga_id_liga, datav) values (6, 8, to_date('2018-11-10', 'yyyy-mm-dd'));


-- Tabela Jogador+Jogo -- Jogadores que marcam golos e seus golos no jogo

-- Jogo: 1 -- Equipa: 1 vs 2 -- 3 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (5, 1, 10);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (4, 1, 22);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (4, 1, 50);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (14, 1, 2);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (14, 1, 30);

-- Jogo: 2 -- Equipa: 6 vs 8 -- 3 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 2, 25);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 2, 43);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 2, 67);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (76, 2, 34);

-- Jogo: 3 -- Equipa: 4 vs 3 -- 2 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (38, 3, 53);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 3, 68);

-- Jogo: 4 -- Equipa: 7 vs 9 -- 1 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (64, 4, 19);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (81, 4, 47);

-- Jogo: 5 -- Equipa: 2 vs 3 -- 2 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (15, 5, 34);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (15, 5, 68);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (28, 5, 36);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (28, 5, 40);

-- Jogo: 6 -- Equipa: 8 vs 9 -- 0 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (81, 6, 32);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (81, 6, 63);

-- Jogo: 7 -- Equipa: 1 vs 4 -- 3 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (5, 7, 30);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (5, 7, 36);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (5, 7, 54);

-- Jogo: 8 -- Equipa: 6 vs 7 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (56, 8, 11);

-- Jogo: 9 -- Equipa: 1 vs 3 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 9, 59);

-- Jogo: 10 -- Equipa: 4 vs 2 -- 2 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (39, 10, 58);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (39, 10, 70);

-- Jogo: 11 -- Equipa: 6 vs 9 -- 3 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (54, 11, 15);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (54, 11, 84);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 11, 22);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (80, 11, 32);

-- Jogo: 12 -- Equipa: 7 vs 8 -- 2 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (56, 12, 47);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (56, 12, 63);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (75, 12, 37);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (75, 12, 78);

-- Jogo: 13 -- Equipa: 4 vs 1 -- 1 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (38, 13, 32);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 13, 47);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 13, 58);

-- Jogo: 15 -- Equipa: 7 vs 6 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 15, 84);

-- Jogo: 16 -- Equipa: 9 vs 8 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (80, 16, 36);

-- Jogo: 17 -- Equipa: 3 vs 4 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (38, 17, 25);

-- Jogo: 18 -- Equipa: 2 vs 1 -- 1 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (15, 18, 49);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 18, 26);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 18, 72);

-- Jogo: 20 -- Equipa: 8 vs 6 -- 1 - 3
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (75, 20, 34);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 20, 21);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 20, 39);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 20, 81);

-- Jogo: 21 -- Equipa: 2 vs 4 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (38, 21, 16);

-- Jogo: 22 -- Equipa: 3 vs 1 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (4, 22, 18);

-- Jogo: 23 -- Equipa: 9 vs 6 -- 1 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (81, 23, 14);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 23, 20);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (53, 23, 27);

-- Jogo: 24 -- Equipa: 8 vs 7 -- 1 - 3
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (70, 24, 32);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (56, 24, 25);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (57, 24, 57);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (57, 24, 74);

-- Jogo: 25 -- Equipa: 4 vs 2 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (38, 25, 52);

-- Jogo: 26 -- Equipa: 6 vs 9 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (52, 26, 26);

-- Jogo: 27 -- Equipa: 1 vs 3 -- 2 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 27, 83);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 27, 90);

-- Jogo: 29 -- Equipa: 6 vs 7 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (52, 29, 37);

-- Jogo: 30 -- Equipa: 1 vs 4 -- 2 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 30, 57);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 30, 80);

-- Jogo: 31 -- Equipa: 8 vs 9 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (81, 31, 21);

-- Jogo: 32 -- Equipa: 2 vs 3 -- 1 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (14, 32, 52);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (28, 32, 27);

-- Jogo: 33 -- Equipa: 1 vs 2 -- 2 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 33, 24);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (4, 33, 78);

-- Jogo: 34 -- Equipa: 6 vs 8 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (52, 34, 24);

-- Jogo: 35 -- Equipa: 4 vs 3 -- 1 - 0
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 35, 17);

-- Jogo: 36 -- Equipa: 7 vs 9 -- 1 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (57, 36, 69);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (78, 36, 22);

-- Jogo: 37 -- Equipa: 4 vs 1 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (4, 37, 30);

-- Jogo: 38 -- Equipa: 3 vs 2 -- 2 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (29, 38, 14);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (29, 38, 22);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (18, 38, 32);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (18, 38, 52);

-- Jogo: 39 -- Equipa: 3 vs 1 -- 1 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (29, 39, 6);

insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 39, 24);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 39, 73);

-- Jogo: 40 -- Equipa: 2 vs 4 -- 0 - 2
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 40, 38);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 40, 69);

-- Jogo: 41 -- Equipa: 2 vs 1 -- 0 - 1
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (8, 41, 25);

-- Jogo: 42 -- Equipa: 3 vs 4 -- 0 - 4
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 42, 25);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 42, 62);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 42, 78);
insert into jogador_jogo (jogador_id_jogador, jogo_id_jogo, minuto_marc) values (40, 42, 82);


-- Tabela Substituicoes

insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (4, 22, 86, 110);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (21, 52, 42, 99);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (22, 14, 23, 96);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (34, 25, 49, 103);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (36, 63, 79, 111);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (38, 43, 22, 92);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (39, 37, 33, 97);
insert into substituicoes (jogo_id_jogo, minuto_sub, jogador_id_jogador1, jogador_id_jogador2) values (42, 72, 44, 100);


-- Tabela Jogador_Sancao_Disc -- Jogadores que levaram sanções disciplinares

insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (44, 1);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (37, 2);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (24, 3);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (28, 4);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (15, 5);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (19, 6);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (38, 7);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (6, 8);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (23, 9);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (10, 10);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (49, 11);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (14, 12);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (13, 13);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (2, 14);
insert into jogador_sancao_disc (jogador_id_jogador, sancao_disc_id_sancao) values (26, 15);


-- Tabela Staff_Sancao_Disc -- Staff que levaram sanções disciplinares

insert into staff_sancao_disc (staff_id_staff, sancao_disc_id_sancao) values (27, 16);
insert into staff_sancao_disc (staff_id_staff, sancao_disc_id_sancao) values (10, 17);
insert into staff_sancao_disc (staff_id_staff, sancao_disc_id_sancao) values (6, 18);
insert into staff_sancao_disc (staff_id_staff, sancao_disc_id_sancao) values (19, 19);
insert into staff_sancao_disc (staff_id_staff, sancao_disc_id_sancao) values (11, 20);


-- Tabela Melhor_Marc -- Melhor_Marc

insert into Melhor_Marc (golos, jogador_id_jogador) values (13, 8);
insert into Melhor_Marc (golos, jogador_id_jogador) values (10, 53);
insert into Melhor_Marc (golos, jogador_id_jogador) values (8, 40);
insert into Melhor_Marc (golos, jogador_id_jogador) values (5, 4);
insert into Melhor_Marc (golos, jogador_id_jogador) values (5, 38);


-- Tabela GR_Mais_GS -- GR_Mais_GS

insert into GR_Mais_GS (golos, jogador_id_jogador) values (19, 20);
insert into GR_Mais_GS (golos, jogador_id_jogador) values (19, 31);
insert into GR_Mais_GS (golos, jogador_id_jogador) values (16, 77);
insert into GR_Mais_GS (golos, jogador_id_jogador) values (8, 36);
insert into GR_Mais_GS (golos, jogador_id_jogador) values (8, 84);


-- Tabela Jogador_Equipa_Estadio -- Jogadores que pertencem a uma equipa (Pode existir jogadores sem equipa/sem trabalho)

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (1, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (2, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (3, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (4, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (5, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (6, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (7, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (8, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (9, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (10, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (11, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (89, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (90, 1);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (91, 1);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (12, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (13, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (14, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (15, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (16, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (17, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (18, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (19, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (20, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (21, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (22, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (92, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (93, 2);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (94, 2);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (23, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (24, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (25, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (26, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (27, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (28, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (29, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (30, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (31, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (32, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (33, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (95, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (96, 3);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (97, 3);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (34, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (35, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (36, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (37, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (38, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (39, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (40, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (41, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (42, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (43, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (44, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (98, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (99, 4);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (100, 4);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (45, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (46, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (47, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (48, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (49, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (50, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (51, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (52, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (53, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (54, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (55, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (101, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (102, 6);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (103, 6);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (56, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (57, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (58, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (59, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (60, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (61, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (62, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (63, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (64, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (65, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (66, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (104, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (105, 7);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (106, 7);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (67, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (68, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (69, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (70, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (71, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (72, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (73, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (74, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (75, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (76, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (77, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (107, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (108, 8);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (109, 8);

insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (78, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (79, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (80, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (81, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (82, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (83, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (84, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (85, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (86, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (87, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (88, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (110, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (111, 9);
insert into jogador_equipa_estadio (jogador_id_jogador, equipa_estadio_id_equipa) values (112, 9);


-- Tabela Equipa_Estadio_Staff -- Staff que pertencem a uma equipa (Pode existir staff sem equipa/sem trabalho)

insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (1, 1);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (1, 2);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (1, 3);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (2, 4);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (2, 5);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (2, 6);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (3, 7);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (3, 8);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (3, 9);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (4, 10);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (4, 11);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (4, 12);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (6, 17);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (6, 16);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (6, 18);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (7, 20);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (7, 19);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (7, 21);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (8, 23);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (8, 22);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (8, 24);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (9, 14);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (9, 25);
insert into equipa_estadio_staff (equipa_estadio_id_equipa, staff_id_staff) values (9, 27);


-- Tabela Patrocinador_Equipa_Estadio -- Patrocinadores que patrocinem as equipas (Pode existir patrocinadores sem equipas)

insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (1, 1);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (1, 6);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (2, 2);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (2, 7);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (3, 3);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (3, 9);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (4, 4);
insert into patrocinador_equipa_estadio (patrocinador_id_patrocinador, equipa_estadio_id_equipa) values (4, 8);
