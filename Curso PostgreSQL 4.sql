---------------------------------------------------- CURSO POSTGRESQL -----------------------------------------------
-----SELECT----- 
	SELECT (campos)
	FROM tabela
	[condições]
--EXEMPLO--
	SELECT numero, nome FROM banco;
	SELECT numero, nome FROM banco WHERE ativo IS TRUE;
	SELECT nome FROM cliente WHERE email LIKE '%gmail.com';
	
	SELECT numero FROM agencia 
	WHERE banco_numero IN (SELECT numero FROM banco WHERE nome ILIKE '%Bradesco'); --NÃO RECOMENDADO
	
--- WHERE (coluna/condições)

--- =
--- > / >=
--- < / <=
--- <> / !=
--- LIKE 
--- ILIKE
--- IN

--- PRIMEIRA CONDIÇÃO DEVE SER WHERE
--- DEMAIS CONDIÇÕES AND ou OR

SELECT(campos)
FROM tabela1
WHERE EXISTS (
	SELECT (campo,)
	FROM tabela2
	WHERE campo 1 = valor1
	[AND/OR campoN = valorN]
);  --- NÃO É UMA BOA PRATICA, USA RECURSOS DO SERVIDOR DE FORMA ERRADA


-- INSERT - IDEMPOTENCIA

INSERT INTO agencia(banco_numero,numero, nome) VALUES (341,1,'Centro da cidade');
INSERT INTO agencia(banco_numero,numero,nome)
	SELECT 341,1,'Centro da cidade'
	WHERE NOT EXISTS(SELECT banco_numero,numero,nome FROM agencia 
		WHERE banco_numero = 341 AND  numero = 1 AND nome = 'Centro da cidade')
	
	
INSERT INTO agencia(banco_numero, numero, nome) VALUES (341,1,'Centro da cidade') ON
	CONFLICT(banco_numero, numero) DO NOTHING 
	
TRUNCATE [TABLE] [ONLY] name [*][,...]
	[RESTART IDENTITY | CONTINUE IDENTITY ] [CASCADE | RESTRICT]
	
	