CREATE SCHEMA IF NOT EXISTS `bd_carros` DEFAULT CHARACTER SET utf8 ;
USE `bd_carros` ;

-- -----------------------------------------------------
-- Table `bd_carros`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_carros`.`clientes` (
  `numero` INT(5) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `endereco` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bd_carros`.`apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_carros`.`apolice` (
  `numero` INT(5) NOT NULL AUTO_INCREMENT,
  `valor` FLOAT(8,2) NOT NULL,
  `fkCliente` INT(5) NOT NULL,
  PRIMARY KEY (`numero`),
  CONSTRAINT `fk_clientes_apolice`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `bd_carros`.`clientes` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bd_carros`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_carros`.`carro` (
  `registro` VARCHAR(8) NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `fkApolice` INT(5) NOT NULL,
  PRIMARY KEY (`registro`, `fkApolice`),
  CONSTRAINT `fk_apolice_carro`
    FOREIGN KEY (`fkApolice`)
    REFERENCES `bd_carros`.`apolice` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `bd_carros`.`acidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_carros`.`acidente` (
  `dataHora` DATETIME NOT NULL,
  `local` VARCHAR(100) NOT NULL,
  `fkCarro` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`dataHora`),
  CONSTRAINT `fk_carro_acidente`
    FOREIGN KEY (`fkCarro`)
    REFERENCES `bd_carros`.`carro` (`registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO clientes (numero, nome, endereco)
VALUES ();
INSERT INTO clientes (numero, nome, endereco)
VALUES ();
INSERT INTO clientes (numero, nome, endereco)
VALUES ();
INSERT INTO clientes (numero, nome, endereco)
VALUES ();
INSERT INTO clientes (numero, nome, endereco)
VALUES ();

INSERT INTO apolice (numero, nome, endereco)
VALUES ();
