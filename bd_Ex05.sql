CREATE DATABASE db_ex05;

USE db_ex05;

CREATE TABLE fornecedor(
	id_fornecedor INT NOT NULL PRIMARY KEY,
    razao_social VARCHAR (20),
    nome_fantasia VARCHAR(20),
    telefone VARCHAR(20)
    );

CREATE TABLE cliente(
	id_cliente INT NOT NULL PRIMARY KEY,
    nome_cliente VARCHAR(20),
    rua VARCHAR(20),
    numero INT,
    fone VARCHAR(20),
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    estado CHAR(2)
);

CREATE TABLE produto(
	id_produto INT NOT NULL PRIMARY KEY,
    nome_produto VARCHAR(20),
    preco_unitario DECIMAL(12,2),
    id_fornecedor INT NOT NULL
);
    
CREATE TABLE nota_fiscal(
	numero_nota INT NOT NULL PRIMARY KEY,
    valor_nota NUMERIC(12,2),
    data_emissao DATE,
    id_cliente INT NOT NULL
);

CREATE TABLE item_nota(
	numero_nota INT NOT NULL PRIMARY KEY,
    id_produto INT NOT NULL,
    qtd_item INT,
    valro_item NUMERIC(12,2)
);

ALTER TABLE produto
ADD CONSTRAINT fk_fornecedor_produtos
FOREIGN KEY (id_fornecedor)
REFERENCES fornecedor(id_fornecedor);

ALTER TABLE nota_fiscal
ADD CONSTRAINT fk_cliente_nota_fiscal
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);

ALTER TABLE item_nota
ADD CONSTRAINT fk_produto_item_nota
FOREIGN KEY (id_produto)
REFERENCES produto(id_produto);

ALTER TABLE item_nota
ADD CONSTRAINT fk_numero_nota_item_nota
FOREIGN KEY (numero_nota)
REFERENCES nota_fiscal(numero_nota);

-- DROP TABLE item_nota;
-- DROP TABLE nota_fiscal;
-- DROP TABLE produto;
-- DROP TABLE fornecedor;
-- DROP TABLE cliente;
-- DROP DATABASE db_ex05;

	

    


    
