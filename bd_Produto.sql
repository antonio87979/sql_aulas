-- 1. Criação do Banco de Dados
CREATE DATABASE EmpresaDB;
-- 2. Selecionando o Banco de Dados para uso
USE EmpresaDB;
-- 3. Criação da Tabela Funcionários
CREATE TABLE Funcionarios (
	id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_admissao DATE
);
-- 4. Criação da Tabela Departamentos
CREATE TABLE Departamentos (
	id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
-- 5. Adicionando uma coluna na tabela Funcionarios
-- para armazenar o ID do departamento
ALTER TABLE Funcionarios
ADD departamento_id INT;
-- 6. Adicionando uma chave estrangeira na tabela Funcionarios
ALTER TABLE Funcionarios
ADD CONSTRAINT fk_departamento_funcionarios
FOREIGN KEY (departamento_id)
REFERENCES Departamentos(id);
 
-- 7. Truncando a tabela Funcionarios para 
-- remover todos os registros (mas não a estrutura)
TRUNCATE TABLE Funcionarios;
 
-- 8. Excluindo a tabela Funcionarios
DROP TABLE Funcionarios;
 
-- 9. Excluindo a tabela Departamentos
DROP TABLE Departamentos;
 
-- 10. Excluindo o Banco de Dados
DROP DATABASE EmpresaDB