drop database bd_produtos;

CREATE SCHEMA IF NOT EXISTS `bd_produtos` DEFAULT CHARACTER SET utf8 ;
USE `bd_produtos` ;

-- -----------------------------------------------------
-- Table `bd_produtos`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_produtos`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sigla` CHAR(2) NOT NULL,
  `dataCadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_produtos`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_produtos`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `id_categoria` INT NOT NULL,
  `dataCadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_categoria_produto`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `bd_produtos`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `bd_produtos`.`categoria` (`id`, `nome`, `sigla`, `dataCadastro`) VALUES 
(1, 'Eletrônicos', 'EL', '2024-01-05 10:00:00'),
(2, 'Roupas', 'RP', '2024-02-15 11:00:00'),
(3, 'Alimentos', 'AL', '2024-03-20 12:00:00'),
(4, 'Móveis', 'MV', '2024-04-25 13:00:00'),
(5, 'Brinquedos', 'BR', '2024-05-10 14:00:00'),
(6, 'Livros', 'LV', '2024-06-15 16:00:00'),
(7, 'Ferramentas', 'FR', '2024-07-20 17:00:00'),
(8, 'Beleza', 'BL', '2024-08-30 17:00:00'),
(9, 'Esportes', 'ES', '2024-09-05 18:00:00'),
(10, 'Automotivo', 'AU', '2024-10-15 19:00:00');
 
INSERT INTO `bd_produtos`.`produto` (`id`, `nome`, `descricao`, `preco`, `id_categoria`, `dataCadastro`) VALUES
(1, 'Smartphone', 'Smartphone de última geração', 1999.99, 1, '2024-01-05 10:00:00'),
(2, 'Notebook', 'Notebook com alta performance', 2999.99, 1, '2024-01-12 11:00:00'),
(3, 'Camiseta', 'Camiseta de algodão', 49.99, 2, '2024-02-10 13:00:00'),
(4, 'Calça Jeans', 'Calça jeans azul', 89.99, 2, '2024-02-12 13:00:00'),
(5, 'Arroz', 'Pacote de arroz 5kg', 19.99, 3, '2024-03-10 09:00:00'),
(6, 'Feijão', 'Pacote de feijão 1kg', 7.99, 3, '2024-03-25 10:00:00'),
(7, 'Sofá', 'Sofá de 3 lugares', 999.99, 4, '2024-04-25 14:00:00'),
(8, 'Mesa de Jantar', 'Mesa de jantar 6 cadeiras', 1499.99, 4, '2024-04-30 17:00:00'),
(9, 'Boneca', 'Boneca de pano', 29.99, 5, '2024-05-10 18:00:00'),
(10, 'Carrinho', 'Carrinho de brinquedo', 39.99, 5, '2024-05-15 19:00:00'),
(11, 'Livro de Ficção', 'Livro de ficção científica', 59.99, 9, '2024-06-18 10:00:00'),
(12, 'Livro de História', 'Livro de história do Brasil', 69.99, 9, '2024-06-20 11:00:00'),
(13, 'Martelo', 'Martelo de aço', 24.99, 7, '2024-07-22 12:00:00'),
(14, 'Chave de Fenda', 'Conjunto de chaves de fenda', 34.99, 7, '2024-07-25 14:00:00'),
(15, 'Shampoo', 'Shampoo para cabelos secos', 19.99, 6, '2024-08-10 08:00:00'),
(16, 'Condicionador', 'Condicionador para cabelos secos', 21.99, 6, '2024-08-15 10:00:00'),
(17, 'Bola de Futebol', 'Bola de futebol oficial', 79.99, 9, '2024-09-05 15:00:00'),
(18, 'Tênis de Corrida', 'Tênis de corrida leve', 199.99, 9, '2024-09-22 17:00:00'),
(19, 'Pneu', 'Pneu para carro', 299.99, 10, '2024-10-15 18:00:00'),
(20, 'Óleo de Motor', 'Óleo de motor sintético', 49.99, 10, '2024-10-22 19:00:00');
 
SELECT COUNT(*) AS quantidade_produtos 
FROM produto;

SELECT ROUND(AVG(preco),2) AS media_dos_produtos_arredondado 
FROM produto;
 
SELECT MAX(preco) AS maior_preco 
FROM Produto;

SELECT MIN(preco) AS menor_preco 
FROM produto;

SELECT CONCAT( nome, ' / ', descricao)AS sobre_produto 
FROM produto;

SELECT dataCadastro
FROM produto 
WHERE dataCadastro BETWEEN '2024-10-01 00:00:00' AND '2024-10-30 00:00:00';

SELECT CONCAT(id, ' | ', nome) AS produtos
FROM produto 
WHERE dataCadastro BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 00:00:00';

SELECT SUM(preco) AS valor_total
FROM produto;

SELECT (MAX(preco) - MIN(preco)) AS diferença_preço
FROM produto;

SELECT nome, preco
FROM produto
WHERE id_categoria = 3;

SELECT SUM(preco)
FROM produto
WHERE id_categoria = 6;

SELECT ROUND(AVG(preco),2) AS media_dos_produtos_acima_100
FROM produto
WHERE preco >= 100.00;
