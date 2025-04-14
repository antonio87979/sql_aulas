create database db_meubanco;
-- drop database db_meubanco;

USE db_meubanco;

CREATE TABLE minha_tabela(	
	id int,
    nome varchar(20),
    data_cadastro datetime,
    valor decimal(10,2),
    eh_valido boolean,
    sigla_estado char(2)
    );

CREATE TABLE minha_tabela2(
	id int,
    nome varchar(30),
    descricao varchar(200)
    );
    
ALTER TABLE minha_tabela
ADD CONSTRAINT pk_chave_primaria
PRIMARY KEY (id);

ALTER TABLE minha_tabela2
ADD CONSTRAINT pk_chave_primaria2
PRIMARY KEY (id);

ALTER TABLE minha_tabela2
ADD COLUMN id_minha_tabela INT;

ALTER TABLE minha_tabela2
ADD CONSTRAINT fk_minha_tabela_minha_tabela2
FOREIGN KEY (id_minha_tabela)
REFERENCES minha_tabela (id);




 