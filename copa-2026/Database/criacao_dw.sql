-- public.dim_estadio definição

-- Drop table

-- DROP TABLE public.dim_estadio;

CREATE TABLE public.dim_estadio (
	sk_estadio serial4 NOT NULL,
	nome_estadio varchar(100) NOT NULL,
	cidade varchar(50) NOT NULL,
	pais varchar(30) NOT NULL,
	capacidade int4 NULL,
	CONSTRAINT dim_estadio_pkey PRIMARY KEY (sk_estadio)
);


-- public.dim_fase definição

-- Drop table

-- DROP TABLE public.dim_fase;

CREATE TABLE public.dim_fase (
	stage_id int4 NULL,
	stage_name varchar(50) NULL,
	is_knockout varchar(10) NULL
);


-- public.dim_selecao definição

-- Drop table

-- DROP TABLE public.dim_selecao;

CREATE TABLE public.dim_selecao (
	team_id int4 NOT NULL,
	team_name varchar(50) NULL,
	fifa_code varchar(10) NULL,
	group_letter varchar(2) NULL,
	confederation varchar(30) NULL,
	fifa_ranking_pre_tournament int4 NULL,
	elo_rating int4 NULL,
	manager_name varchar(50) NULL,
	CONSTRAINT pk_dim_selecao PRIMARY KEY (team_id)
);


-- public.dim_tempo definição

-- Drop table

-- DROP TABLE public.dim_tempo;

CREATE TABLE public.dim_tempo (
	id_tempo serial4 NOT NULL,
	data_completa date NULL,
	ano int4 NULL,
	mes int4 NULL,
	dia int4 NULL,
	nome_dia_semana varchar(20) NULL,
	CONSTRAINT dim_tempo_pkey PRIMARY KEY (id_tempo)
);


-- public.fato_partida definição

-- Drop table

-- DROP TABLE public.fato_partida;

CREATE TABLE public.fato_partida (
	match_id int4 NOT NULL,
	"date" timestamptz NULL,
	kickoff_time_utc varchar(20) NULL,
	stage_id int4 NULL,
	venue_id int4 NULL,
	home_team_id int4 NULL,
	away_team_id int4 NULL,
	home_score int4 NULL,
	away_score int4 NULL,
	home_penalty_score int4 NULL,
	away_penalty_score int4 NULL,
	status varchar(50) NULL,
	result_type varchar(50) NULL,
	home_xg numeric(5, 2) NULL,
	away_xg numeric(5, 2) NULL,
	referee_id int4 NULL,
	player_of_the_match_id int4 NULL,
	CONSTRAINT fato_partida_pkey PRIMARY KEY (match_id)
);


-- public.dim_jogador definição

-- Drop table

-- DROP TABLE public.dim_jogador;

CREATE TABLE public.dim_jogador (
	jogador_id int4 NOT NULL,
	team_id int4 NULL,
	nome_jogador varchar(100) NULL,
	posicao varchar(50) NULL,
	gols int4 DEFAULT 0 NULL,
	CONSTRAINT dim_jogador_pkey PRIMARY KEY (jogador_id),
	CONSTRAINT dim_jogador_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.dim_selecao(team_id)
);