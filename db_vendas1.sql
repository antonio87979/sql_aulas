-- drop database modelo_db_ex05;
CREATE SCHEMA IF NOT EXISTS `modelo_db_ex05` DEFAULT CHARACTER SET utf8 ;
USE `modelo_db_ex05` ;

-- -----------------------------------------------------
-- Table `modelo_db_ex05`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_db_ex05`.`fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `razaoSocial` VARCHAR(20) NOT NULL,
  `nomeFantasia` VARCHAR(20) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_db_ex05`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_db_ex05`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(20) NOT NULL,
  `rua` VARCHAR(20) NOT NULL,
  `numero` INT NOT NULL,
  `fone` VARCHAR(20) NOT NULL,
  `bairro` VARCHAR(20) NOT NULL,
  `cidade` VARCHAR(20) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_db_ex05`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_db_ex05`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(20) NOT NULL,
  `precoUnitario` DECIMAL(12,2) NOT NULL,
  `idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  CONSTRAINT `fk_fornecedor_produto`
    FOREIGN KEY (`idFornecedor`)
    REFERENCES `modelo_db_ex05`.`fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_db_ex05`.`notaFiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_db_ex05`.`notaFiscal` (
  `numeroNota` INT NOT NULL AUTO_INCREMENT,
  `valorNota` DECIMAL(12,2) NOT NULL,
  `dataEmissao` DATE NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`numeroNota`),
  CONSTRAINT `fk_cliente_notaFiscal`
    FOREIGN KEY (`idCliente`)
    REFERENCES `modelo_db_ex05`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelo_db_ex05`.`itemNota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo_db_ex05`.`itemNota` (
  `numeroNota` INT NOT NULL,
  `idProduto` INT NOT NULL,
  `qtdItem` INT NOT NULL,
  `valorItem` DECIMAL(12,2) NULL,
  CONSTRAINT `fk_notaFiscal_itemNota`
    FOREIGN KEY (`numeroNota`)
    REFERENCES `modelo_db_ex05`.`notaFiscal` (`numeroNota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_itemNota`
    FOREIGN KEY (`idProduto`)
    REFERENCES `modelo_db_ex05`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO fornecedor (idFornecedor, razaoSocial , nomeFantasia , telefone)
VALUES (1, 'Frezenius', 'banglus', '(11)62167-5647');

INSERT INTO fornecedor (idFornecedor, razaoSocial , nomeFantasia , telefone)
VALUES (2, 'glop', 'glp', '(11)67467-5465');

INSERT INTO fornecedor (idFornecedor, razaoSocial , nomeFantasia , telefone)
VALUES (3, 'carneiros', 'lã', '(11)56724-7475');

INSERT INTO fornecedor (idFornecedor, razaoSocial , nomeFantasia , telefone)
VALUES (4, 'casa win', 'hw games', '(11)24764-6754');

UPDATE fornecedor
SET razaoSocial = 'Glop', nomeFantasia = 'Gloops'
WHERE idFornecedor = 2;

SELECT idFornecedor, razaoSocial , nomeFantasia , telefone
FROM fornecedor;

INSERT INTO cliente (idCliente, nomeCliente , rua , numero, fone, bairro, cidade, estado)
VALUES (1, 'davi', 'juritis', 13, 1159564546, 'guela', 'vitoria', 'MG');

INSERT INTO cliente (idCliente, nomeCliente , rua , numero, fone, bairro, cidade, estado)
VALUES (2, 'david', 'relatos', 45, 1154547888, 'serrinha', 'rio', 'RJ' );

INSERT INTO cliente (idCliente, nomeCliente , rua , numero, fone, bairro, cidade, estado)
VALUES (3, 'daiane', 'banglus', 33, 11444444444, 'vila rocha', 'cotias', 'SP');

INSERT INTO cliente (idCliente, nomeCliente , rua , numero, fone, bairro, cidade, estado)
VALUES (4, 'denys', 'presidente luis', 79, 11235523689, 'são josé', 'são paulo', 'SP');

UPDATE cliente
SET rua = 'gabriela gouti', numero = 69
WHERE idCliente = 1;

SELECT idCliente, nomeCliente , rua , numero, fone, bairro, cidade, estado
FROM cliente;

 INSERT INTO produto (idProduto, nomeProduto , precoUnitario , idFornecedor)
VALUES (1, 'celular', 1500.98, 1);
 
 INSERT INTO produto (idProduto, nomeProduto , precoUnitario , idFornecedor)
VALUES (2, 'cortador de grama', 1500.00,  2);

  INSERT INTO produto (idProduto, nomeProduto , precoUnitario , idFornecedor)
VALUES (3, 'sofá 2 lugares', 1299.99, 3);
 
 INSERT INTO produto (idProduto, nomeProduto , precoUnitario , idFornecedor)
VALUES (4, 'vaso de flores', 120.00, 2);

UPDATE produto
SET nomeProduto = 'cerrador de grama'
WHERE idProduto = 2;

SELECT idProduto, nomeProduto , precoUnitario , idFornecedor
FROM produto;

INSERT INTO  notaFiscal (numeroNota, valorNota , dataEmissao , idCliente)
VALUES (1, 1500.00, '2025-03-22', 1);

INSERT INTO  notaFiscal (numeroNota, valorNota , dataEmissao , idCliente)
VALUES (2, 120.00, '2025-03-21', 3);

INSERT INTO  notaFiscal (numeroNota, valorNota , dataEmissao , idCliente)
VALUES (3, 1500.98, '2025-03-09', 2);

INSERT INTO  notaFiscal (numeroNota, valorNota , dataEmissao , idCliente)
VALUES (4, 1299.99, '2025-03-16', 4);

UPDATE notaFiscal 
SET idCliente = 1
WHERE numeroNota = 2;

SELECT numeroNota, valorNota , dataEmissao , idCliente
FROM notaFiscal;

INSERT INTO  itemNota (numeroNota, idProduto , qtdItem , valorItem)
VALUES (1, 2, 1, 1500.00);

INSERT INTO  itemNota (numeroNota, idProduto , qtdItem , valorItem)
VALUES (2, 4, 1, 120.00);

INSERT INTO  itemNota (numeroNota, idProduto , qtdItem , valorItem)
VALUES (4, 1, 1, 1500.98);

INSERT INTO  itemNota (numeroNota, idProduto , qtdItem , valorItem)
VALUES (4, 3, 1, 1299.99);

UPDATE itemNota
SET qtdItem = 2
WHERE numeroNota = 2;

SELECT numeroNota, idProduto , qtdItem , valorItem
FROM itemNota ;