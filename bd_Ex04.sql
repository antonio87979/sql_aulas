CREATE DATABASE db_ex04;

USE db_ex04;

CREATE TABLE funcao(
	cod_funcao INT NOT NULL PRIMARY KEY,
    nome_funcao VARCHAR(200),
    salario DECIMAL(10,2)
);

CREATE TABLE funcionario(
	cpf INT NOT NULL PRIMARY KEY,
    nome_funcionario VARCHAR(200),
    cod_funcao INT NOT NULL
);

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcao_funcionarios
FOREIGN KEY (cod_funcao)
REFERENCES funcao(cod_funcao);

-- DROP TABLE funcionario;
-- DROP TABLE funcao;
-- DROP DATABASE db_ex04;

