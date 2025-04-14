
CREATE SCHEMA IF NOT EXISTS `bd_venda` DEFAULT CHARACTER SET utf8 ;
USE `bd_venda` ;

-- -----------------------------------------------------
-- Table `bd_venda`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_venda`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `tipoProduto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_venda`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_venda`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `ddd` CHAR(2) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `dataCadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_venda`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_venda`.`venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `dataVenda` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cliente_venda`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `bd_venda`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_venda`.`produto_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_venda`.`produto_venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_venda` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT(100) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_venda_produto_venda`
    FOREIGN KEY (`id_venda`)
    REFERENCES `bd_venda`.`venda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_produto_venda`
    FOREIGN KEY (`id_produto`)
    REFERENCES `bd_venda`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO produto (nome, preco, tipoProduto)
VALUE ('maçã', 5.99, 'fruta');
INSERT INTO produto (nome, preco, tipoProduto)
VALUE ('batedeira', 119.99, 'elétrodomestico');
INSERT INTO produto (nome, preco, tipoProduto)
VALUE ('banana', 4.99, 'fruta');
INSERT INTO produto (nome, preco, tipoProduto)
VALUE ('liquidificador', 95.99, 'elétrodomestico');
INSERT INTO produto (nome, preco, tipoProduto)
VALUE ('uva', 8.99, 'fruta');

INSERT INTO cliente (nome, documento, email, ddd, telefone, dataCadastro)
VALUE ('eva', '90.000.000-09', 'eva@gmail.com', '11', '000000001', '2025-01-07 20:00');
INSERT INTO cliente (nome, documento, email, ddd, telefone, dataCadastro)
VALUE ('adão', '90.000.000-08', 'adao@gmail.com', '11', '000000002', '2025-01-07 19:00');
INSERT INTO cliente (nome, documento, email, ddd, telefone, dataCadastro)
VALUE ('moises', '90.000.000-07', 'moises@gmail.com', '11', '000000003', '2025-01-07 18:00');
INSERT INTO cliente (nome, documento, email, ddd, telefone, dataCadastro)
VALUE ('davi', '90.000.000-06', 'davi@gmail.com', '11', '000000004', '2025-01-07 17:00');
INSERT INTO cliente (nome, documento, email, ddd, telefone, dataCadastro)
VALUE ('rute', '90.000.000-05', 'rute@gmail.com', '11', '000000005', '2025-01-07 16:00');

INSERT INTO venda (id_cliente, dataVenda)
VALUE (5, '2025-04-07 08:30');
INSERT INTO venda (id_cliente, dataVenda)
VALUE (2, '2025-04-07 10:00');
INSERT INTO venda (id_cliente, dataVenda)
VALUE (3, '2025-04-07 14:15');
INSERT INTO venda (id_cliente, dataVenda)
VALUE (4, '2025-04-07 22:00');
INSERT INTO venda (id_cliente, dataVenda)
VALUE (3, '2025-04-07 14:00');

INSERT INTO produto_venda (id_venda, id_produto, quantidade, valor)
VALUE (5, 4, 1, 95.99);
INSERT INTO produto_venda (id_venda, id_produto, quantidade, valor)
VALUE (2, 2, 1, 119.99);
INSERT INTO produto_venda (id_venda, id_produto, quantidade, valor)
VALUE (3, 5, 1, 5.99);
INSERT INTO produto_venda (id_venda, id_produto, quantidade, valor)
VALUE (4, 3, 1, 4.99);
INSERT INTO produto_venda (id_venda, id_produto, quantidade, valor)
VALUE (5, 3, 1, 4.99);

UPDATE produto
SET   nome = 'pera', preco = 6.00, tipoProduto = 'fruta' 
WHERE id = 5;

UPDATE cliente
SET   nome = 'judas', documento = '90.000.000-04', email = 'judas@gmail.com', ddd = '11', telefone = '000000006', dataCadastro = '2025-01-07 15:00'
WHERE id = 5;

UPDATE produto_venda
SET   id_venda = 4, id_produto = 5, quantidade = 2, valor = 11.98
WHERE id = 5;

UPDATE venda
SET   id_cliente = 2, dataVenda = '2025-04-07 14:00'
WHERE id = 5;

SELECT nome, CONCAT('R$ ',preco) as preco_formatado
FROM produto;

SELECT nome, CONCAT(ddd, ' ', telefone) as contato
FROM cliente;

SELECT id_cliente, dataVenda
FROM venda;

SELECT quantidade, CONCAT('R$ ',valor) as valor_formatado
FROM produto_venda;

DELETE FROM produto_venda
WHERE id = 1;
DELETE FROM venda
WHERE id = 1;
DELETE FROM cliente
WHERE id = 1;
DELETE FROM produto
WHERE id = 1;

SELECT COUNT(*) AS quantidade_produtos FROM produto;
SELECT COUNT(*) AS quantidade_clientes FROM cliente;
SELECT COUNT(*) AS quantidade_venda FROM venda;
SELECT COUNT(*) AS quantidade_produto_venda FROM produto_venda;

SELECT SUM(valor) AS soma_dos_produtos FROM produto_venda;
SELECT ROUND(AVG(valor),2) AS media_valor_produtos_vendidos FROM produto_venda;
SELECT MAX(valor) AS maior_valor FROM produto_venda;
SELECT MIN(valor) AS menor_valor FROM produto_venda;

-- drop database bd_venda;

