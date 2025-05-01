 DROP DATABASE bd_projetoIntegrador;
CREATE DATABASE bd_projetoIntegrador;

USE bd_projetoIntegrador;

DROP TABLE IF EXISTS login;
CREATE TABLE login(
	id_login INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- PK
	nome VARCHAR(200) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL,
    tipo_usuario BOOL NOT NULL, -- define se o perfil é de administrador ou /simples
    login VARCHAR(20) NOT NULL,
    senha VARCHAR(8) NOT NULL
);

DROP TABLE IF EXISTS cadastroCategorias;
CREATE TABLE cadastroCategorias(
    id_categoria INT NOT NULL, -- PK
	categoria  VARCHAR(50) NOT NULL PRIMARY KEY, 
    data_cadastro TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS cadastroItens;
CREATE TABLE cadastroItens(
	cod_produto VARCHAR(6) NOT NULL PRIMARY KEY, -- PK
	descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2),
    unidade_de_contagem CHAR(2),
    categoria  VARCHAR(50) NOT NULL, -- FK CADASTROITENS/ NOME DA CATEGORIA
    localizacao VARCHAR(255),
    quantidade_em_estoque VARCHAR(9),
    
    FOREIGN KEY (categoria)
		REFERENCES cadastroCategorias (categoria)
);

SELECT * 
FROM cadastroCategorias;


SELECT *
FROM cadastroItens;
DESC cadastroItens;



