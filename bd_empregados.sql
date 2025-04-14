DROP DATABASE bd_empregados;

CREATE DATABASE bd_empregados;
 
USE bd_empregados;
 
CREATE TABLE empregado(

	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(60),

    idade SMALLINT,

    departamento VARCHAR(20),

    salario DECIMAL(10,2)

);
 
INSERT INTO empregado (nome, idade, departamento, salario)

VALUES

('João', 30, 'RH', 50000.00),

('Sarah', 28, 'TI', 60000.00),

('Miguel', 35, 'Venda', 55000.00),

('Ana', 27, 'TI', 62000.00);
 
 
-- 01

SELECT * 

FROM empregado

WHERE departamento = 'TI';
 
SELECT CONCAT(nome, ' - ', salario) AS salario_maior_55000k

FROM empregado

WHERE salario > 55000.00;
 
SELECT * 

FROM empregado

ORDER BY idade DESC;
 
 
-- 02

SELECT *

FROM empregado

WHERE idade >= 28 AND idade <= 35;

-- WHERE idade BETWEEN 28 AND 35;
 
SELECT *

FROM empregado

WHERE LEFT (nome, 1) = 'M';
 
SELECT *

FROM empregado

WHERE departamento <> 'RH';
 
 
-- 03

SELECT departamento, COUNT(id) AS empregado

FROM empregado

GROUP BY departamento;
 
SELECT departamento, ROUND(AVG(salario),2) AS media_salarios

FROM empregado

WHERE departamento = 'TI'; -- PAUSA
 
SELECT departamento, SUM(salario) AS soma_salario_vendas

FROM empregado

WHERE departamento = 'Venda';
 
 
-- 04

CREATE TABLE departamento (

	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(60) NOT NULL

);
 
CREATE TABLE colaborador (

	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(60) NOT NULL,

    department_id INT,

	FOREIGN KEY (department_id)

        REFERENCES departamento (id)

);
 
INSERT INTO departamento (nome)

VALUES

('RH'),

('TI'),

('Venda');
 
INSERT INTO colaborador (nome, department_id)

VALUES

('João', 1),

('Sarah', 2),

('Miguel', 3),

('Ana', 2);
 
SELECT c.nome, d.nome

FROM colaborador AS c

INNER JOIN departamento AS d ON c.department_id = d.id;
 