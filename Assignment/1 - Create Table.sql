-- CTTPSI21 pass: bd

/*
*
*	CTeSP: TPSI
*	2018/2019
*
*	Create Tables
*
*	Pedro dos Santos Alves	a21270246
*	Leandro Adão Fidalgo	a21270093
*
*/

-- Tabela Epoca

CREATE TABLE epoca (
	id_epoca	 NUMBER,
	nome	 VARCHAR2(100) UNIQUE NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim	 DATE NOT NULL,
	PRIMARY KEY(id_epoca)
);


-- Tabela Liga

CREATE TABLE liga (
	id_liga	 NUMBER,
	nome		 VARCHAR2(100) NOT NULL,
	epoca_id_epoca NUMBER NOT NULL,
	PRIMARY KEY(id_liga)
);


-- Tabela Patrocinador

CREATE TABLE patrocinador (
	id_patrocinador NUMBER,
	nome		 VARCHAR2(100) UNIQUE NOT NULL,
	PRIMARY KEY(id_patrocinador)
);


-- Tabela Equipa+Estadio

CREATE TABLE equipa_estadio (
	id_equipa		 NUMBER,
	nome		 VARCHAR2(100) UNIQUE NOT NULL,
	fundacao		 DATE NOT NULL,
	material_desportivo VARCHAR2(100) NOT NULL,
	alcunha		 VARCHAR2(100),
	estadio_nome	 VARCHAR2(100) UNIQUE NOT NULL,
	estadio_capacidade	 NUMBER(5,0) NOT NULL,
	estadio_localizacao VARCHAR2(100),
	liga_id_liga	 NUMBER NOT NULL,
	PRIMARY KEY(id_equipa)
);

-- Tabela Staff

CREATE TABLE staff (
	id_staff	 NUMBER,
	nacionalidade VARCHAR2(100) NOT NULL,
	nome		 VARCHAR2(100) NOT NULL,
	tipo		 VARCHAR2(100) NOT NULL,
	PRIMARY KEY(id_staff)
);

-- Tabela Liga_Equipa_Estadio -- Classificacao

CREATE TABLE liga_equipa_estadio (
	liga_id_liga		 NUMBER,
	equipa_estadio_id_equipa NUMBER,
	numvitorias	 NUMBER(3,0),
	numderrotas	 NUMBER(3,0),
	numempates	 NUMBER(3,0),
	numvitoriascons	 NUMBER(3,0),
	pontos		 NUMBER(3,0) NOT NULL,
	PRIMARY KEY(liga_id_liga,equipa_estadio_id_equipa)
);


-- Tabela Jogo

CREATE TABLE jogo (
	id_jogo			 NUMBER,
	data_jogo		 DATE NOT NULL,
	res_casa			 NUMBER(2,0),
	res_fora			 NUMBER(2,0),
	jornada			 NUMBER(3,0) NOT NULL,
	equipa_estadio_id_equipa	 NUMBER NOT NULL,
	equipa_estadio_id_equipa1 NUMBER NOT NULL,
	PRIMARY KEY(id_jogo)
);


-- Tabela Jogador

CREATE TABLE jogador (
	id_jogador	 NUMBER,
	nome		 VARCHAR2(100) NOT NULL,
	naturalidade	 VARCHAR2(100) NOT NULL,
	nacionalidade VARCHAR2(100) NOT NULL,
	data_nasc	 DATE NOT NULL,
	altura	 NUMBER(3,0) NOT NULL,
	salario	 NUMBER(10,0) NOT NULL,
	posicao	 VARCHAR2(100),
	pe		 VARCHAR2(100) NOT NULL,
	golos	 NUMBER(5,0) NOT NULL,
    golos_suf NUMBER(5,0) NOT NULL,
	PRIMARY KEY(id_jogador)
);


-- Tabela Sancao_Disc

CREATE TABLE sancao_disc (
	id_sancao NUMBER,
    jogo_id_jogo NUMBER NOT NULL,
	cartao	 VARCHAR2(8),
	coima	 NUMBER(10,0) NOT NULL,
	PRIMARY KEY(id_sancao)
);


-- Tabela Liga+Equipa+Estadio -- Equipa Vencedora

CREATE TABLE equipa_estadio_liga (
	equipa_estadio_id_equipa NUMBER NOT NULL,
	liga_id_liga		 NUMBER,
	datav	 DATE NOT NULL,
	PRIMARY KEY(liga_id_liga)
);


-- Tabela Jogador+Jogo -- Jogadores que marcam golos e seus golos no jogo

CREATE TABLE jogador_jogo (
	jogador_id_jogador NUMBER,
	jogo_id_jogo	 NUMBER,
	minuto_marc NUMBER,
	PRIMARY KEY(jogador_id_jogador,jogo_id_jogo, minuto_marc)
);


-- Tabela Jogador_Sancao_Disc -- Jogadores que levaram sanções disciplinares

CREATE TABLE jogador_sancao_disc (
	jogador_id_jogador	 NUMBER,
	sancao_disc_id_sancao NUMBER,
	PRIMARY KEY(jogador_id_jogador,sancao_disc_id_sancao)
);


-- Tabela Staff_Sancao_Disc -- Staff que levaram sanções disciplinares

CREATE TABLE staff_sancao_disc (
	staff_id_staff	 NUMBER,
	sancao_disc_id_sancao NUMBER,
	PRIMARY KEY(staff_id_staff,sancao_disc_id_sancao)
);


-- Tabela Liga_Jogador -- GR_Mais_GS

CREATE TABLE GR_Mais_GS (
	golos	 NUMBER,
	jogador_id_jogador NUMBER,
	PRIMARY KEY(jogador_id_jogador)
);


-- Tabela Jogador_Liga -- Melhor_Marc

CREATE TABLE melhor_marc (
	jogador_id_jogador NUMBER,
	golos	 NUMBER,
	PRIMARY KEY(jogador_id_jogador)
);


-- Tabela Jogador_Equipa_Estadio -- Jogadores que pertencem a uma equipa (Pode existir jogadores sem equipa/sem trabalho)

CREATE TABLE jogador_equipa_estadio (
	jogador_id_jogador	 NUMBER,
	equipa_estadio_id_equipa NUMBER NOT NULL,
	PRIMARY KEY(jogador_id_jogador)
);


-- Tabela Equipa_Estadio_Staff -- Staff que pertencem a uma equipa (Pode existir staff sem equipa/sem trabalho)

CREATE TABLE equipa_estadio_staff (
	equipa_estadio_id_equipa NUMBER NOT NULL,
	staff_id_staff		 NUMBER,
	PRIMARY KEY(staff_id_staff)
);


-- Tabela Patrocinador_Equipa_Estadio -- Patrocinadores que patrocinem as equipas (Pode existir patrocinadores sem equipas)

CREATE TABLE patrocinador_equipa_estadio (
	patrocinador_id_patrocinador NUMBER,
	equipa_estadio_id_equipa	 NUMBER,
	PRIMARY KEY(patrocinador_id_patrocinador,equipa_estadio_id_equipa)
);


-- Tabela Substituicoes -- Substuições num determinado jogo

CREATE TABLE substituicoes (
    jogo_id_jogo NUMBER,
    minuto_sub NUMBER NOT NULL,
    jogador_id_jogador1 NUMBER NOT NULL,
    jogador_id_jogador2 NUMBER NOT NULL,
    PRIMARY KEY(jogo_id_jogo, jogador_id_jogador1, jogador_id_jogador2)
);


-- Tabela Avisos

CREATE TABLE avisos (
    mensagem varchar2(250)
);


ALTER TABLE liga ADD CONSTRAINT liga_fk1 FOREIGN KEY (epoca_id_epoca) REFERENCES epoca(id_epoca);
ALTER TABLE equipa_estadio ADD CONSTRAINT equipa_estadio_fk1 FOREIGN KEY (liga_id_liga) REFERENCES liga(id_liga);
ALTER TABLE jogo ADD CONSTRAINT jogo_fk1 FOREIGN KEY (equipa_estadio_id_equipa) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE jogo ADD CONSTRAINT jogo_fk2 FOREIGN KEY (equipa_estadio_id_equipa1) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE sancao_disc ADD CONSTRAINT sancao_disc_fk1 FOREIGN KEY (jogo_id_jogo) REFERENCES jogo(id_jogo);
ALTER TABLE equipa_estadio_liga ADD CONSTRAINT equipa_estadio_liga_fk1 FOREIGN KEY (equipa_estadio_id_equipa) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE equipa_estadio_liga ADD CONSTRAINT equipa_estadio_liga_fk2 FOREIGN KEY (liga_id_liga) REFERENCES liga(id_liga);
ALTER TABLE liga_equipa_estadio ADD CONSTRAINT liga_equipa_estadio_fk1 FOREIGN KEY (liga_id_liga) REFERENCES liga(id_liga);
ALTER TABLE liga_equipa_estadio ADD CONSTRAINT liga_equipa_estadio_fk2 FOREIGN KEY (equipa_estadio_id_equipa) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE jogador_jogo ADD CONSTRAINT jogador_jogo_fk1 FOREIGN KEY (jogador_id_jogador) REFERENCES jogador(id_jogador);
ALTER TABLE jogador_jogo ADD CONSTRAINT jogador_jogo_fk2 FOREIGN KEY (jogo_id_jogo) REFERENCES jogo(id_jogo);
ALTER TABLE jogador_sancao_disc ADD CONSTRAINT jogador_sancao_disc_fk1 FOREIGN KEY (jogador_id_jogador) REFERENCES jogador(id_jogador);
ALTER TABLE jogador_sancao_disc ADD CONSTRAINT jogador_sancao_disc_fk2 FOREIGN KEY (sancao_disc_id_sancao) REFERENCES sancao_disc(id_sancao);
ALTER TABLE staff_sancao_disc ADD CONSTRAINT staff_sancao_disc_fk1 FOREIGN KEY (staff_id_staff) REFERENCES staff(id_staff);
ALTER TABLE staff_sancao_disc ADD CONSTRAINT staff_sancao_disc_fk2 FOREIGN KEY (sancao_disc_id_sancao) REFERENCES sancao_disc(id_sancao);
ALTER TABLE gr_mais_gs ADD CONSTRAINT gr_mais_gs_fk1 FOREIGN KEY (jogador_id_jogador) REFERENCES jogador(id_jogador);
ALTER TABLE melhor_marc ADD CONSTRAINT melhor_marc_fk1 FOREIGN KEY (jogador_id_jogador) REFERENCES jogador(id_jogador);
ALTER TABLE jogador_equipa_estadio ADD CONSTRAINT jogador_equipa_estadio_fk1 FOREIGN KEY (jogador_id_jogador) REFERENCES jogador(id_jogador);
ALTER TABLE jogador_equipa_estadio ADD CONSTRAINT jogador_equipa_estadio_fk2 FOREIGN KEY (equipa_estadio_id_equipa) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE equipa_estadio_staff ADD CONSTRAINT equipa_estadio_staff_fk1 FOREIGN KEY (equipa_estadio_id_equipa) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE equipa_estadio_staff ADD CONSTRAINT equipa_estadio_staff_fk2 FOREIGN KEY (staff_id_staff) REFERENCES staff(id_staff);
ALTER TABLE patrocinador_equipa_estadio ADD CONSTRAINT patro_equipa_estadio_fk1 FOREIGN KEY (patrocinador_id_patrocinador) REFERENCES patrocinador(id_patrocinador);
ALTER TABLE patrocinador_equipa_estadio ADD CONSTRAINT patro_equipa_estadio_fk2 FOREIGN KEY (equipa_estadio_id_equipa) REFERENCES equipa_estadio(id_equipa);
ALTER TABLE substituicoes ADD CONSTRAINT sub_fkM FOREIGN KEY (jogo_id_jogo) REFERENCES jogo(id_jogo);
ALTER TABLE substituicoes ADD CONSTRAINT sub_fk1 FOREIGN KEY (jogador_id_jogador1) REFERENCES jogador(id_jogador);
ALTER TABLE substituicoes ADD CONSTRAINT sub_fk2 FOREIGN KEY (jogador_id_jogador2) REFERENCES jogador(id_jogador);
