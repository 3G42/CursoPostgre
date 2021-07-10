--------------------------------- ARQUIVOS -------------------------------

-- pg_hba.conf

/*
Arquivo responsável pelo controle de autenticação dos usuarios no servidor
PostgreSql
*/

local 	   database user auth-method [auth-options)]
host 	   database user auth-method [auth-options)]
hostssl    database user auth-method [auth-options)]
hostnossl  database user auth-method [auth-options)]
host       database user IP-address IP-mask auth-method [auth-options)]
hostssl    database user IP-address IP-mask auth-method [auth-options)]
hostnossl  database user IP-address IP-mask auth-method [auth-options)]


-- Métodos de autenticação

TRUST  	-> SEM SENHA
REJECT 	-> REJEITA CONEXÃO
MD5		-> CRIPTOGRAFIA MD5
PASSWORD-> SEM CRIPTOGRAFIA
...

--NÃO FAZER:
	host all all 0.0.0.0/0 md5
	
--- pg_ident.conf

Arquivo reponsavel por mapearos usuario do sistema operacional com os usua-
rios do banco de dados
-> Localizado em PGDATA
-> Necessita estar habilitada em pg_hba.conf


-------------------------------Comandos Administrativos -------------------
** UBUNTU:
* pg_lsclusters : Lista todos os clusters PostgreSql
* pg_createcluster <version> <cluster name>: cria um novo cluster
* pg_dropcluster <version> <cluster name>: apaga cluster
* pg_ ctlcluster <version> <cluster name>: START,STOP,STATUS,RESTART DE CLUSTER.


-------------------------------Arquitetura/Hierarquia----------------------
Cluster: Coleção de bancos de dados que compartilham as mesmas configurações do PostgreSql
Bancos de dados: Conjuntosz de schemas com seus objetos/relações
Schema: Conjunto de tabvelas, funções, views, etc.



