CREATE DATABASE db_ex01;

USE db_ex01;

CREATE TABLE professor(
	cod_professor INT NOT NULL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE alunos(
	matricula VARCHAR(10) NOT NULL PRIMARY KEY,
    cod_curso INT NOT NULL,
    cod_professor INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_de_nascimento DATE NOT NULL
);

CREATE TABLE cursos(
	cod_curso INT NOT NULL PRIMARY KEY,
    cod_professor INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    quantidade_alunos INT NOT NULL
);
-- tabela que voce vai alterar
ALTER TABLE alunos
-- nome da chave estrangeira
ADD CONSTRAINT fk_cursos_alunos
-- coluna da tabela que esta sendo alterada, receberá a chave estrangeira
FOREIGN KEY (cod_curso)
-- tabela de onde vai estar puxando o primary key  
REFERENCES cursos(cod_curso);

ALTER TABLE alunos
ADD CONSTRAINT fk_professor_alunos
FOREIGN KEY (cod_professor)
REFERENCES professor(cod_professor);

ALTER TABLE cursos
ADD CONSTRAINT fk_professor_cursos
FOREIGN KEY (cod_professor)
REFERENCES professor(cod_professor);

-- DROP TABLE alunos;
 
--  DROP TABLE cursos;
 
--  DROP TABLE professor;
 
--  DROP DATABASE db_ex01;
 
 




    