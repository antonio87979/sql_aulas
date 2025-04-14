CREATE SCHEMA IF NOT EXISTS `bd_restaurante` DEFAULT CHARACTER SET utf8 ;
USE `bd_restaurante` ;

-- -----------------------------------------------------
-- Table `bd_restaurante`.`categoriaRestaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`categoriaRestaurante` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`shopping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`shopping` (
  `cnpj` VARCHAR(16) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `latitude` FLOAT(10,6) NOT NULL,
  `longitude` FLOAT(10,6) NOT NULL,
  `cidade` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(30) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `rua` VARCHAR(50) NOT NULL,
  `numero` INT(5) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`restaurante` (
  `cnpj` VARCHAR(16) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `numero` INT(5) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `cnpjShopping` VARCHAR(16) NOT NULL,
  `idCategoriaRestaurante` INT(10) NOT NULL,
  PRIMARY KEY (`cnpj`),
  CONSTRAINT `fk_categoriaRestaurante_restaurante`
    FOREIGN KEY (`idCategoriaRestaurante`)
    REFERENCES `bd_restaurante`.`categoriaRestaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_restaurante`
    FOREIGN KEY (`cnpjShopping`)
    REFERENCES `bd_restaurante`.`shopping` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`horarioFuncionamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`horarioFuncionamento` (
  `id` INT(2) NOT NULL,
  `horaInicial` TIME NOT NULL,
  `horaFinal` TIME NOT NULL,
  `cnpjRestaurante` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_restaurante_horarioFuncionamento`
    FOREIGN KEY (`cnpjRestaurante`)
    REFERENCES `bd_restaurante`.`restaurante` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`cardapio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`cardapio` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(200) NOT NULL,
  `cnpjRestaurante` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_restaurante_cardapio`
    FOREIGN KEY (`cnpjRestaurante`)
    REFERENCES `bd_restaurante`.`restaurante` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`itemCardapio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`itemCardapio` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` INT NOT NULL,
  `valor` FLOAT(4,2) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `tempoPreparo` TIME NOT NULL,
  `idCardapio` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cardapio_itemCardapio`
    FOREIGN KEY (`idCardapio`)
    REFERENCES `bd_restaurante`.`cardapio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`categoriaItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`categoriaItem` (
  `id` INT(6) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(60) NOT NULL,
  `obrigatorio` TINYINT NOT NULL,
  `qtdItens` INT(2) NOT NULL,
  `fkItemCardapio` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_itemCardapio_categoriaItem`
    FOREIGN KEY (`fkItemCardapio`)
    REFERENCES `bd_restaurante`.`itemCardapio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_restaurante`.`opcaoCategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_restaurante`.`opcaoCategoria` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(50) NOT NULL,
  `valor` FLOAT(4,2) NOT NULL,
  `fkCategoriaItem` INT(5) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_categoriaItem_opcaoCategoria`
    FOREIGN KEY (`fkCategoriaItem`)
    REFERENCES `bd_restaurante`.`categoriaItem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO shopping (cnpj, nome, latitude, longitude, cidade, estado, pais, bairro, rua, numero, telefone)
VALUES ('51325667000103', 'SPMArket', 000000.0001, 000000.0002, 'são paulo', 'SP', 'Brasil', 'cotias', 'malassais', 10, '11111111111'  );

INSERT INTO shopping (cnpj, nome, latitude, longitude, cidade, estado, pais, bairro, rua, numero, telefone)
VALUES ('33285513000145', 'interlagos', 000000.0002, 000000.0003, 'são paulo', 'SP', 'Brasil', 'maua', 'malassai', 11, '11111111112' );

INSERT INTO shopping (cnpj, nome, latitude, longitude, cidade, estado, pais, bairro, rua, numero, telefone)
VALUES ('78189895000141', 'eldorado', 000000.0003, 000000.0004, 'são paulo', 'SP', 'Brasil', 'jau', 'malas', 12, '11111111113' );

INSERT INTO shopping (cnpj, nome, latitude, longitude, cidade, estado, pais, bairro, rua, numero, telefone)
VALUES ('14829105000162', 'Parque Cidade', 000000.0004, 000000.0005, 'são paulo', 'SP', 'Brasil', 'belem', 'matias', 13, '11111111114' );

INSERT INTO shopping (cnpj, nome, latitude, longitude, cidade, estado, pais, bairro, rua, numero, telefone)
VALUES ('90246835000118', 'Boa Vista', 000000.0005, 000000.0006, 'são paulo', 'SP', 'Brasil', 'dominos', 'mota', 14, '11111111115' );
 
UPDATE shopping
SET nome = 'Boa Vista', latitude = 100000.0005, longitude = 100000.0006, cidade = 'montanhas', estado = 'AM', pais = 'Brasil', bairro = 'dona juselia', rua = 'não se aplica', numero = 14, telefone = '11111111115'
WHERE cnpj = '80261267000171';
 
 
SELECT cnpj, nome, latitude, longitude, cidade, estado, pais, bairro, rua, numero, telefone 
FROM shopping;



INSERT INTO categoriaRestaurante (id, nome)
VALUES (1, 'japones');

INSERT INTO categoriaRestaurante (id, nome)
VALUES (2, 'fastfood');

INSERT INTO categoriaRestaurante (id, nome)
VALUES (3, 'gourmet');

INSERT INTO categoriaRestaurante (id, nome)
VALUES (4, 'mexicano');

INSERT INTO categoriaRestaurante (id, nome)
VALUES (5, 'churrascaria');

UPDATE categoriaRestaurante
SET  nome = 'italiano'
WHERE id = 4;

SELECT id, nome
FROM categoriaRestaurante;



INSERT INTO restaurante (cnpj, nome, numero, descricao, telefone, cnpjShopping, idCategoriaRestaurante)
VALUES ('26522149000124', 'kuraphança', 121, 'loja de comida japonesa', '11000000001', '51325667000103', 2);

INSERT INTO restaurante (cnpj, nome, numero, descricao, telefone, cnpjShopping, idCategoriaRestaurante)
VALUES ('57944116000104', 'kingdonalds', 122, 'loja de comida rapida', '11000000002', '51325667000103', 2);

INSERT INTO restaurante (cnpj, nome, numero, descricao, telefone, cnpjShopping, idCategoriaRestaurante)
VALUES ('62433595000126', 'le sapore', 523, 'loja de comida de alto nivel', '11000000003', '51325667000103', 3);

INSERT INTO restaurante (cnpj, nome, numero, descricao, telefone, cnpjShopping, idCategoriaRestaurante)
VALUES ('50247276000147', 'los papitos', 724, 'loja de comida mexicana', '11000000004', '51325667000103', 4);

INSERT INTO restaurante (cnpj, nome, numero, descricao, telefone, cnpjShopping, idCategoriaRestaurante)
VALUES ('95791443000154', 'brasa', 525, 'churrascaria com rodízio', '11000000005', '51325667000103', 5);

UPDATE restaurante
SET  descricao = 'loja de comida italiana', nome = 'munamassa'
WHERE cnpj = '50247276000147';

SELECT cnpj, nome, numero, descricao, telefone, cnpjShopping, idCategoriaRestaurante
FROM restaurante;



INSERT INTO horarioFuncionamento (id, horaInicial, horaFinal, cnpjRestaurante)
VALUES (1, '10:00', '22:00', '26522149000124' );
INSERT INTO horarioFuncionamento (id, horaInicial, horaFinal, cnpjRestaurante)
VALUES (2, '10:00', '22:00', '57944116000104');
INSERT INTO horarioFuncionamento (id, horaInicial, horaFinal, cnpjRestaurante)
VALUES (3, '16:00', '21:30', '62433595000126');
INSERT INTO horarioFuncionamento (id, horaInicial, horaFinal, cnpjRestaurante)
VALUES (4, '12:00', '22:00', '50247276000147');
INSERT INTO horarioFuncionamento (id, horaInicial, horaFinal, cnpjRestaurante)
VALUES (5, '16:00', '22:00', '95791443000154');

UPDATE horarioFuncionamento
SET  horaInicial = '10:00'
WHERE id = 4;

SELECT id, horaInicial, horaFinal, cnpjRestaurante
FROM horarioFuncionamento;



INSERT INTO cardapio (id, descricao, cnpjRestaurante)
VALUES (1, 'Sushi Maki (Rolinho de Sushi), Gyoza (Pastel Japonês)', '26522149000124' );
INSERT INTO cardapio (id, descricao, cnpjRestaurante)
VALUES (2, 'hanburguer big, batata rustica', '57944116000104');
INSERT INTO cardapio (id, descricao, cnpjRestaurante)
VALUES (3, 'banana gourmet, alimento gourmet', '62433595000126');
INSERT INTO cardapio (id, descricao, cnpjRestaurante)
VALUES (4, 'guacamole, taccos', '50247276000147');
INSERT INTO cardapio (id, descricao, cnpjRestaurante)
VALUES (5, 'picanha no espetão, porção de costela', '95791443000154');

UPDATE cardapio
SET  descricao = 'pizzas, macarrão de massa milenar'
WHERE id = 4;

SELECT id, descricao, cnpjRestaurante
FROM cardapio;



INSERT INTO itemCardapio (id, nome, valor, descricao, tempoPreparo, idCardapio)
VALUES (1, 'Sushi Maki', 15.00, 'Rolinho de Sushi', '07:00', 1);
INSERT INTO itemCardapio (id, nome, valor, descricao, tempoPreparo, idCardapio)
VALUES (2, 'batata rustica', 10.00, 'batata', '04:00', 2);
INSERT INTO itemCardapio (id, nome, valor, descricao, tempoPreparo, idCardapio)
VALUES (3, 'alimento gourmet', 60.00, 'alimento surpresa', '20:00', 3);
INSERT INTO itemCardapio (id, nome, valor, descricao, tempoPreparo, idCardapio)
VALUES (4, 'taccos', 17.00, 'taccos mexicanos originais', '10:00', 4);
INSERT INTO itemCardapio (id, nome, valor, descricao, tempoPreparo, idCardapio)
VALUES (5, 'picanha no espetão', 40.00, 'pedaços de picanha num espeto giga', '25:00', 5);

UPDATE itemCardapio
SET  nome = 'macarrão de massa milenar',  descricao = 'macarrão de massa milenar'
WHERE id = 4;

SELECT id, nome, valor, descricao, tempoPreparo, idCardapio
FROM itemCardapio;



INSERT INTO categoriaItem (id, titulo, descricao, obrigatorio, qtdItens, fkItemCardapio)
VALUES (1, 'A', 'pedido aceito', 1, 1, 1);
INSERT INTO categoriaItem (id, titulo, descricao, obrigatorio, qtdItens, fkItemCardapio)
VALUES (2, 'B', 'pedido aceito', 1, 1, 2);
INSERT INTO categoriaItem (id, titulo, descricao, obrigatorio, qtdItens, fkItemCardapio)
VALUES (3, 'C', 'pedido aceito', 1, 1, 3);
INSERT INTO categoriaItem (id, titulo, descricao, obrigatorio, qtdItens, fkItemCardapio)
VALUES (4, 'D', 'pedido aceito', 1, 1, 4);
INSERT INTO categoriaItem (id, titulo, descricao, obrigatorio, qtdItens, fkItemCardapio)
VALUES (5, 'E', 'pedido aceito', 1, 1, 5);

UPDATE categoriaItem
SET  descricao = 'em espera'
WHERE id = 4;

SELECT id, titulo, descricao, obrigatorio, qtdItens, fkItemCardapio
FROM categoriaItem;



INSERT INTO opcaoCategoria (id, titulo, descricao, valor, fkCategoriaItem)
VALUES (1, 'A', '.', 15.00, 1);
INSERT INTO opcaoCategoria (id, titulo, descricao, valor, fkCategoriaItem)
VALUES (2, 'B', '.', 10.00, 2);
INSERT INTO opcaoCategoria (id, titulo, descricao, valor, fkCategoriaItem)
VALUES (3, 'C', '.', 60.00, 3);
INSERT INTO opcaoCategoria (id, titulo, descricao, valor, fkCategoriaItem)
VALUES (4, 'D', '.', 17.00, 4);
INSERT INTO opcaoCategoria (id, titulo, descricao, valor, fkCategoriaItem)
VALUES (5, 'E', '.', 40.00, 5);

UPDATE opcaoCategoria
SET  titulo = 'F'
WHERE id = 4;

SELECT id, titulo, descricao, valor, fkCategoriaItem
FROM opcaoCategoria;










DELETE FROM opcaoCategoria
WHERE id = 4;
DELETE FROM categoriaItem
WHERE id = 4;
DELETE FROM itemCardapio
WHERE id = 4;
DELETE FROM cardapio
WHERE id = 4;
DELETE FROM horarioFuncionamento
WHERE id = 4;
DELETE FROM restaurante
WHERE cnpj = '50247276000147';
DELETE FROM categoriaRestaurante
WHERE id = 1;
DELETE FROM shopping
WHERE cnpj = '33285513000145';

-- drop database bd_restaurante