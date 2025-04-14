CREATE DATABASE db_ex07;

USE db_ex07;

CREATE TABLE status_pedido(
	id INT(3) NOT NULL PRIMARY KEY,
    descricao VARCHAR(50)
);

CREATE TABLE tipo_pagamento(
	id INT(2) NOT NULL PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE pedido(
	id INT(100) NOT NULL PRIMARY KEY,
    idStatus INT(3) NOT NULL,
    
    CONSTRAINT fk_status_pedido_pedido
    FOREIGN KEY (idStatus)
	REFERENCES status_pedido(id),
    
    idTipoPagamento INT(2) NOT NULL,
    
    CONSTRAINT fk_tipo_pagamento_pedido
	FOREIGN KEY (idTipoPagamento)
	REFERENCES tipo_pagamento(id),
    
    cpfResponsavel VARCHAR(11),
    codigo VARCHAR(10),
    dataHoraRealizado DATETIME,
    avaliacao INT(2),
    dataHoraAvaliacao DATETIME,
    cnpjRestaurante VARCHAR(16),
    valorPedido FLOAT(4,2)
);

CREATE TABLE itens_pedido(
	id INT(20) NOT NULL PRIMARY KEY,
    idPedido INT(100) NOT NULL,
    
    CONSTRAINT fk_pedido_itens_pedido
	FOREIGN KEY (idPedido)
	REFERENCES pedido(id),
    
    nome VARCHAR(50),
    descricao VARCHAR(100),
    valor FLOAT(4,2),
    observacao VARCHAR(200)
);

-- DROP TABLE itens_pedido;
-- DROP TABLE pedido;
-- DROP TABLE status_pedido;
-- DROP TABLE tipo_pagamento;
-- DROP DATABASE db_ex07;

    
    
    