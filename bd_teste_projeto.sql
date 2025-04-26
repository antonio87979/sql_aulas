CREATE DATABASE bd_projetoIntegrador;

USE bd_projetoIntegrador;

DROP TABLE IF EXISTS login;
CREATE TABLE login(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- PK
	nome VARCHAR(200) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL,
    tipo_usuario BOOL NOT NULL, -- define se o perfil é de administrador ou /simples
    login VARCHAR(20) NOT NULL,
    senha VARCHAR(8) NOT NULL
);

DROP TABLE IF EXISTS cadastroCategorias;
CREATE TABLE cadastroCategorias(
	categoria VARCHAR(50) NOT NULL PRIMARY KEY, -- PK
    data_cadastro TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS cadastroItens;
CREATE TABLE cadastroItens(
	cod_produto VARCHAR(6) NOT NULL PRIMARY KEY, -- PK
	descricao VARCHAR(200) NOT NULL,
    valor DECIMAL(10,2),
    unidade_de_contagem CHAR(2),
    categoria  VARCHAR(50) NOT NULL, -- FK CADASTROITENS/ NOME DA CATEGORIA
    -- data_validade VARCHAR(10),
    -- data_fabricacao VARCHAR(10),
    quantidade VARCHAR(7)
);


