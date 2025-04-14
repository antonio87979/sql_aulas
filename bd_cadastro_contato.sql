drop database bd_cadastro_contato;
CREATE SCHEMA IF NOT EXISTS `bd_cadastro_contato` DEFAULT CHARACTER SET utf8 ;
USE `bd_cadastro_contato` ;

-- -----------------------------------------------------
-- Table `bd_cadastro_contato`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cadastro_contato`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `dataNascimento` DATETIME NOT NULL,
  `tipoDocumento` VARCHAR(3) NOT NULL,
  `documento` VARCHAR(15) NOT NULL,
  `dataCadastro` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cadastro_contato`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cadastro_contato`.`endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `logradouro` VARCHAR(150) NOT NULL,
  `numero` CHAR(10) NOT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  `dataCadastro` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoa_endereco`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `bd_cadastro_contato`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cadastro_contato`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cadastro_contato`.`telefone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pessoa` INT NOT NULL,
  `numeroTelefone` VARCHAR(15) NOT NULL,
  `tipoTelefone` VARCHAR(15) NOT NULL,
  `dataCadastro` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoa_telefone`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `bd_cadastro_contato`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO pessoa (nome, email, dataNascimento, tipoDocumento, documento) VALUES
('Ana Silva', 'ana.silva@email.com', '1990-05-15 10:30:00', 'RG', '1234567890'),
('Pedro Oliveira', 'pedro.oliveira@outroemail.com', '1988-12-20 15:45:30', 'CPF', '98765432101'),
('Mariana Souza', 'mariana.souza@maisumemail.com', '1995-03-10 08:00:00', 'RG', '0192837465'),
('Lucas Pereira', 'lucas.pereira@testemail.com', '1982-07-25 19:12:45', 'CNH', '0987654321'),
('Sofia Costa', 'sofia.costa@qualqueremail.com', '2001-11-01 22:05:10', 'CPF', '11223344556');

INSERT INTO endereco (id_pessoa, logradouro, numero, cidade, estado) VALUES
(1, 'Rua das Flores', '123', 'São Paulo', 'SP'),
(2, 'Avenida Brasil', '456', 'Rio de Janeiro', 'RJ'),
(3, 'Travessa da Paz', '789', 'Belo Horizonte', 'MG'),
(4, 'Rua das Palmeiras', '101', 'Salvador', 'BA'),
(5, 'Praça Central', 'S/N', 'Curitiba', 'PR'),
(1, 'Rua dos Lírios', '222', 'Porto Alegre', 'RS'),
(2, 'Avenida Atlântica', '333', 'Recife', 'PE'),
(3, 'Rua da Aurora', '444', 'Fortaleza', 'CE'),
(4, 'Rua das Acácias', '555', 'Brasília', 'DF'),
(5, 'Travessa do Sol', '666', 'Manaus', 'AM');

INSERT INTO telefone (id_pessoa, numeroTelefone, tipoTelefone) VALUES
(1, '(11) 98765-4321', 'Celular'),
(1, '(21) 3333-4444', 'Fixo'),
(1, '(31) 99999-8888', 'Celular'),
(2, '(47) 96666-5555', 'Celular'),
(2, '(85) 3444-5555', 'Fixo'),
(2, '(35) 91111-2222', 'Celular'),
(3, '(11) 3777-8888', 'Fixo'),
(3, '(67) 92222-3333', 'Celular'),
(3, '(27) 3555-6666', 'Fixo'),
(4, '(79) 94444-5555', 'Celular'),
(4, '(53) 3888-9999', 'Fixo'),
(4, '(86) 90000-1111', 'Celular'),
(5, '(48) 3111-2222', 'Fixo'),
(5, '(96) 93333-4444', 'Celular'),
(5, '(11) 3666-7777', 'Fixo');

UPDATE telefone
SET   numeroTelefone = '0800-123-4567', tipoTelefone = 'Outro'
WHERE id = 3;

UPDATE endereco
SET   logradouro = 'Rua dos Pinheiros', numero = '789', cidade = 'Curitiba', estado = 'PR'
WHERE id = 2;

UPDATE pessoa
SET   nome = 'Sofia Costa', email = 'sofia.costa@qualqueremail.com', dataNascimento = '2001-11-01 22:05:10', tipoDocumento = 'CPF', documento = '11223344556'
WHERE id = 5;

SELECT COUNT(*) AS quantidade_pessoa 
FROM pessoa;
SELECT COUNT(*) AS quantidade_endereco 
FROM endereco;
SELECT COUNT(*) AS quantidade_telefone 
FROM telefone;

SELECT nome AS depois_2000, dataCadastro AS depois_2000
FROM pessoa
WHERE dataNascimento > '2000-01-01 00:00:00';

SELECT COUNT(dataNascimento)AS antes_2000
FROM pessoa
WHERE dataNascimento < '2000-01-01 00:00:00';

SELECT COUNT(dataNascimento) AS depois_2000
FROM pessoa
WHERE dataNascimento < '2000-01-01 00:00:00';

SELECT CONCAT(nome, ' / ', tipoDocumento) AS quantos_rg_cpf
FROM pessoa
WHERE tipoDocumento IN ('RG', 'CPF');

SELECT CONCAT(nome, ' / ', tipoDocumento) AS quantos_cnh
FROM pessoa
WHERE tipoDocumento IN ('CNH');

-- SUBSTRING: seleciona os 4 primeiros caracteres da coluna numeroTelefone
SELECT SUBSTRING(numeroTelefone, 1, 4) AS ddd_11
FROM telefone
-- LEFT: extrai os 4 primeiros caracteres da coluna numeroTelefone para WHERE fazer a filtragem
WHERE LEFT(numeroTelefone, 4) = '(11)';

SELECT CONCAT(id, ' | ', estado) AS fora_sao_paulo
FROM endereco
WHERE estado <> 'SP';

