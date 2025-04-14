-- exclui se existir
DROP DATABASE IF EXISTS db_escola;

-- cria se não exisitir
CREATE DATABASE IF NOT EXISTS db_escola;

-- usando a database
USE db_escola;

-- criando tabela
CREATE TABLE IF NOT EXISTS Alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE NOT NULL,
    -- unique: não deixa o valor se repetir
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    nota DECIMAL(5,2),
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- inserindo registros
-- id e data de registro são informações do banco de daos, não é necessario serem exibidas
INSERT INTO Alunos (nome, data_nascimento, email, telefone, nota)
VALUES ('João da Silva', '2000-01-15', 'jds@teste.com','11987654321','85.5');
 
INSERT INTO Alunos (nome, data_nascimento, email, telefone, nota)
VALUES ('Maria Oliveira', '1999-05-23', 'mo@teste.com','11987651234','92.0');
 
INSERT INTO Alunos (nome, data_nascimento, email, telefone, nota)
VALUES ('Carlos Souza', '2001-07-30', 'cs@teste.com','11987650000','78.0');

-- seleciona todos os campos da tabela
SELECT * FROM Alunos;

-- conta quantos registros de alunos exitem na tabela
SELECT COUNT(*) AS quantidade_alunos FROM Alunos;

-- soma das notas(coluna nota) 
SELECT SUM(nota) AS soma_das_notas FROM Alunos;
 

-- seleciona amedia das notas AVG: faz a média
SELECT AVG(nota) AS media_das_notas FROM Alunos;
SELECT ROUND(AVG(nota),2) AS media_das_notas_arredondado FROM Alunos;

-- maior nota
SELECT MAX(nota) AS maior_nota FROM Alunos;

-- menor nota
SELECT MIN(nota) AS menor_nota FROM Alunos;