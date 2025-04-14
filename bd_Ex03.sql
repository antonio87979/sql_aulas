CREATE DATABASE db_ex03;

USE db_ex03;

CREATE TABLE tb_estoque(
	id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(45),
    preco_produto DECIMAL(10, 2),
    qtd_produto INT,
    nome_fornecedor VARCHAR(45),
    data_compra DATE,
    nome_comprador VARCHAR(45),
    end_fornecedor VARCHAR(100),
    tipo_produto VARCHAR(20),
    subtotal DECIMAL(10,2),
    tel_fornecedor VARCHAR(15)
);
    
 