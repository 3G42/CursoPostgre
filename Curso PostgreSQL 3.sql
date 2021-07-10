------------------------------ DATABASE, SCHEMAS E OBJETOS -----------------------------

-- DATABASE 

CREATE DATABASE name
	[[WITH] [OWNER [=] user_name] 			--> DETERMINA O ROLE QUE TERÁ O NOVO DATABASE 
			[TEMPLATE [=] template]			--> NOME DO MODELO A PARTIR DO QUAL SERÁ CRIADO O DB
			[ENCODING [=] encoding]			--> CODIFICAÇÃO DO CONJUNTO DE CARACTERES DO NOVO DB			
			[LC_COLLATE [=] lc_collate]		--> TIPO DE ORDENAÇÃO DE STRINGS
			[LC_CTYPE [=] lc_ctype]			
			[TABLESPACE [=] tablespace_name] --> LOCALIZAÇÃO DENTRO DO DISCO
			[ALLOW_CONNECTIONS [=] allowconn] -- SE 'false' ninguem pode conectar no DB. 
			[CONNECTION LIMIT [=] connlimit] -- Quantas conexões simultaneas são permitidas. (-1 -> ilimitado)
			[IS_TEMPLATE [=] istemplate]]	--> SE 'true' então o DB pode ser clonado por algum usuario com o privilégio CREATEDB.
			
ALTER DATABASE name RENAME TO new_name
ALTER DATABASE name OWNER TO {new_owner | CURRENT_USER | SESSION_USER}
ALTER DATABASE name SET TABLESPACE new_tablespace

DROP DATABASE name;


-- SCHEMAS
CREATE SCHEMA schema_name [AUTHORIZATION role_specification] 

ALTER SCHEMA name RENAME TO new_name

ALTER SCHEMA name OWNER TO {new_owner | CURRENT_USER | SESSION_USER}

DROP SCHEMA [nome]

------ BOAS PRATICAS

CREATE SCHEMA IF NOT EXISTS schema_name [AUTHORIZATION role_specification] DROP SCHEMA IF EXISTS [name];
DROP SCHEMA IF EXISTS [nome]


------TABELA

--CONJUNTO DE DADOS DISPOSTOS EM COLUNAS E LINHAS REFERENTES A UM OBJETIVO(OBJETO) COMUM

------PRIMARY KEY
--CONJUNTO DE UM OU MAIS CAMPOS QUE NUNCA SE REPETEM NA TABELA, PERMINTINDO A INTEGRIDADE DO DADO UNICO, E A SUA REFERENCIABILIDADE
--EM OUTRAS TABELAS.
--		*Não pode haver duas ocorrências de uma mesma entidade com o mesmo conteudo na PK
--		*A chave primária não pode ser composta por atributo opcional, ou seja, atributo que aceite nulo
--		*não deve ser volatil

----TIPOS DE DADOS

Numeric Types
	smallint -> 2 bytes -> -32768 to 32767
	integer -> 4 bytes -> -2147483648 to +2147483647
	bigint -> 8 bytes
	decimal
	numeric
	real
	double precision
	smallserial 
	serial
	bigserial
	
-- Monetary Types

Character Types
	varchar(n)		-> Comprimento variavel com limite
	character(n), char(n)	-> comprimento fixo
	text
-- Binary data Types
Date/Time Types
	timestamp [(p)] [without time zone] -> Data e hora 
	timestamp [(p)] with time zone		
	date -> Data
	time [(p)] [without time zone]	-> Hora do dia sem fuso 
	time [(p)] with time zone	 	-> Hora do dia com fuso
	interval [fields] [(p)] 		-> intervalo de datas.
Boolean Types
	boolean -> 1 bytes	-> true or false
-- Enumerated Types
-- Geometric Types
-- Network Adress Types
-- Bit String Types
-- Text Search Types
-- UUID TYPES
-- XML Types
-- JSON Types
-- ARRAYS
-- COMPOSITE Types
-- RANGE Types
-- Domain Types
-- Object Identifier Types
-- pg_lsn type
-- Pseudo-Types

-- CREATE TABLE

CREATE TABLE [IF NOT EXISTS] [nome da tabela] (
	[nome do campo] [tipo] [regras] [opções]
	[nome do campo] [tipo] [regras] [opções]
	[nome do campo] [tipo] [regras] [opções]
	...
);

CREATE TABLE IF NOT EXISTS banco(
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS banco(
	codigo INTEGER,
	nome VARCHAR(50) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY(codigo)
);

--INSERT

INSERT INTO [nome da tabela]([campos da tabela])
VALUES([valores de acordo com a ordem dos campos acima])

INSERT INTO [nome da tabela]([campos da tabela])
SELECT [valores de acordo com a ordem dos campos acima];

--UPDATE

UPDATE [nome da tabela] SET
[campo1] = [novo valor do campo1],
[campo2] = [novo valor do campo2],
...
[WHERE + condições]

--	Se não tiver WHERE, o comando UPDATE atualizará todos os campos da
-- da tabela

--DELETE
DELETE FROM [nome da tabela]
[WHERE + condições]

--	Sem WHERE, o comando deletará todos os campos da tabela

--SELECT
	SELECT banco,agencia
	FROM cliente
	ições]

---	EVITE o uso de SELECT *


	SELECT codigo,nome
	FROM banco

	SELECT codigo,nome
	FROM banco
	WHERE data_criacao > '2019-10-15 15:00:00';
	



