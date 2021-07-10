/* -------------------------- CONCEITOS USERS/ROLES/GROUPS ---------------------
Roles(papéis ou funções), users(usuarios) e grupos de usuários são "contas",
perfis de atuação em um banco de dados, que possuem permissões em comum ou
especificas.

Nas versões anteriores do PostgreSQL 8.1, usuários e roles tinham comporta-
mentos diferente.  Hoje, ambos são alias

*/
------------------------- ADMINISTRANDO USERS/ROLES/GROUPS ------------------
/*
CREATE ROLE name [[WITH] option [...]]

-- options:

	SUPERUSER 	| 	*NOSUPERUSER
	CREATEDB	|	*NOCREATEDB 			--> PERMISSÃO DE CRIAR DB
	CREATEROLE	|	*NOCREATEROLE		--> PERMISSÃO DE CRIAR ROLE
	*INHERIT	|	 NOINHERIT			--> HERDA PERMISSÕES DA ROLE AO QUAL PERTENCE
	LOGIN		|	*NOLOGIN
	REPLICATION	|	NOREPLICATION		--> Permite que o usuário se conecte ao servidor em modo 'replication' 
	BYPASSRLS	|	NOBYPASSRLS			
	CONNECTION LIMIT connlimit			--> Determina quantidade de conexões 
	[ENCRYPTED] PASSWORD 'password' | PASSWORD NULL		
	VALID UNTIL 'timestamp' 			--> Determina tempo de validade do usuario
	IN ROLE role_name 	[, ...]			-->  Determina que a role criada pertence a role_name
	IN GROUP role_name 	[, ...]
	ROLE role_name 		[, ...]			--> Determina que role_name, é pertencente a role criada
	ADMIN role_name 	[, ...]	
	USER role_name 		[, ...]
	SYSID uid
	
*/	
--- EXEMPLO
	CREATE ROLE administradores 
		CREATEDB
		CREATEROLE
		INHERIT
		NOLOGIN
		REPLICATION
		BYPASSRLS
		CONNECTION LIMIT -1;
	CREATE ROLE professores
		NOCREATEDB
		NOCREATEROLE
		INHERIT
		NOLOGIN
		NOBYPASSRLS
		CONNECTION LIMIT 10;
		
	CREATE ROLE alunos
		NOCREATEDB
		NOCREATEROLE
		INHERIT
		NOLOGIN
		NOBYPASSRLS
		CONNECT LIMIT 90;
	
	GRANT [role a ser concedida] TO [role a assumir permissões]
	
	REVOKE [role que será revogada] FROM [role que terá suas permissões revogadas]
	
---*** ALTERAR ROLE 
	ALTER ROLE role_specification [WITH] option [...]
---*** APAGAR ROLE
	DROP ROLE role_specification
	
--------------------------- ADMINISTRANDO ACESSOS (GRANT) ------------------------

--DATABASE

	GRANT {{CREATE | CONNECT | TEMPORARY | TEMP} [,...] | ALL [PRIVILEGES]}
			ON DATABASE database_name [,...]
			TO role_specification [,...] [WITH GRANT OPTION];
	
--SCHEMA
	GRANT {{CREATE | USAGE }[, ...] | ALL [PRIVILEGES]}
		ON SCHEMA schema_name[, ...]
		TO role_specification [, ...] [WITH GRANT OPTION]

--TABLE 
	GRANT {{SELECT | INSERT | UPDATE | DELETE | TRUNCATE | REFERENCES | TRIGGER}
		[, ...] | ALL [PRIVILEGES]}
		ON {[TABLE] table_name [, ...]
			| ALL TABLES IN SCHEMA schema_name [, ...]}
		TO role_specification [, ...] [WITH GRANT OPTION]
		
		
		
-- REVOKE 
	REVOKE [GRANT OPTION FOR]
		{{CREATE | CONNECT | TEMPORARY | TEMP} [, ...] | ALL [PRIVILEGES] }
		ON DATABASE database_name [, ...] 
		FROM { [GROUP] role_name | PUBLIC } [, ...]
		[CASCADE | RESTRICT];
		
	REVOKE [GRANT OPTION FOR]
		{{CREATE | USAGE} [, ...] | ALL [PRIVILEGES] }
		ON SCHEMA schema_name [, ...] 
		FROM { [GROUP] role_name | PUBLIC } [, ...]
		[CASCADE | RESTRICT]
		
