CREATE DATABASE db_ex06;

USE db_ex06;

CREATE TABLE cartao(
	numero VARCHAR(16) NOT NULL PRIMARY KEY,
    cpf_cnpj VARCHAR(16),
    validade DATE,
    cvv VARCHAR(3),
    nome_titular VARCHAR(50),
    cpf_usuario VARCHAR(11) NOT NULL
);

CREATE TABLE usuario(
	cpf VARCHAR(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(30),
    senha VARCHAR(30)
);

ALTER TABLE cartao
ADD CONSTRAINT fk_usuario_cartao
FOREIGN KEY (cpf_usuario)
REFERENCES usuario(cpf);

DROP TABLE cartao;
DROP TABLE usuario;
DROP DATABASE db_ex06;