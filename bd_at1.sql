CREATE SCHEMA IF NOT EXISTS `bd_at1_modelo_worbench` DEFAULT CHARACTER SET utf8 ;
USE `bd_at1_modelo_worbench` ;

-- -----------------------------------------------------
-- Table `bd_at1_modelo_worbench`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_at1_modelo_worbench`.`paciente` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `ddd` VARCHAR(2) NOT NULL,
  `telefone` VARCHAR(9) NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  `endereco` VARCHAR(80) NOT NULL,
  `dataCadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_at1_modelo_worbench`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_at1_modelo_worbench`.`medico` (
  `id` INT(5) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `especialidade` VARCHAR(50) NOT NULL,
  `crm` INT(5) NOT NULL,
  `ddd` VARCHAR(2) NOT NULL,
  `telefone` VARCHAR(9) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `dataCadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_at1_modelo_worbench`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_at1_modelo_worbench`.`consulta` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `idPaciente` INT(5) NOT NULL,
  `idMedico` INT(5) NOT NULL,
  `dataConsulta` DATETIME NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `status` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_paciente_consultas`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `bd_at1_modelo_worbench`.`paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_consultas`
    FOREIGN KEY (`idMedico`)
    REFERENCES `bd_at1_modelo_worbench`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO paciente (id, nome, dataNascimento, sexo, ddd, telefone, email, endereco, dataCadastro)
VALUES (1, 'lucas', '1980-01-01', 'M', '11', '111111111', 'lucas00004@gmail.com', '00000-001, são paulo, SP, vargem grande zona sul', '2025-04-04 20:00');
INSERT INTO paciente (id, nome, dataNascimento, sexo, ddd, telefone, email, endereco, dataCadastro)
VALUES (2, 'luciana', '1980-02-02', 'F', '11', '222222222', 'luciana00004@gmail.com', '00000-002, são paulo, SP, vargem grande zona sul', '2025-04-04 21:00');
INSERT INTO paciente (id, nome, dataNascimento, sexo, ddd, telefone, email, endereco, dataCadastro)
VALUES (3, 'lucio', '1980-01-03', 'M', '11', '333333333', 'lucio00004@gmail.com', '00000-003, são paulo, SP, vargem grande zona sul', '2025-04-04 22:00');
INSERT INTO paciente (id, nome, dataNascimento, sexo, ddd, telefone, email, endereco, dataCadastro)
VALUES (4, 'larissa', '1980-01-04', 'F', '11', '444444444', 'larissa00004@gmail.com', '00000-004, são paulo, SP, vargem grande zona sul', '2025-04-04 23:00');
INSERT INTO paciente (id, nome, dataNascimento, sexo, ddd, telefone, email, endereco, dataCadastro)
VALUES (5, 'leticia', '1980-01-05', 'F', '11', '555555555', 'leticia00004@gmail.com', '00000-005, são paulo, SP, vargem grande zona sul', '2025-04-04 00:00');

INSERT INTO medico (id, nome, especialidade, crm, ddd, telefone, email, dataCadastro)
VALUES (1, 'samuel', 'cirurgião', 001, '23', '111111111', 'samuel001@gmail.com', '2022-06-20 07:00');
INSERT INTO medico (id, nome, especialidade, crm, ddd, telefone, email, dataCadastro)
VALUES (2, 'samira', 'neurologista', 002, '23', '222222222', 'samira001@gmail.com', '2022-06-21 08:00');
INSERT INTO medico (id, nome, especialidade, crm, ddd, telefone, email, dataCadastro)
VALUES (3, 'samderson', 'cardiologista', 003, '23', '333333333', 'samderson001@gmail.com', '2022-06-22 09:00');
INSERT INTO medico (id, nome, especialidade, crm, ddd, telefone, email, dataCadastro)
VALUES (4, 'solange', 'neurologista', 004, '23', '444444444', 'solange001@gmail.com', '2022-06-23 10:00');
INSERT INTO medico (id, nome, especialidade, crm, ddd, telefone, email, dataCadastro)
VALUES (5, 'soares', 'pediatria', 005, '23', '555555555', 'soares001@gmail.com', '2022-06-24 11:00');

INSERT INTO consulta (id, idPaciente, idMedico, dataconsulta, descricao, status)
VALUES (1, 2, 5, '2025-04-04 00:30', 'consulta médica', 'iniciada');
INSERT INTO consulta (id, idPaciente, idMedico, dataconsulta, descricao, status)
VALUES (2, 2, 4, '2025-04-04 01:00', 'consulta médica', 'em espera');
INSERT INTO consulta (id, idPaciente, idMedico, dataconsulta, descricao, status)
VALUES (3, 3, 3, '2025-04-04 01:30', 'consulta médica', 'iniciada');
INSERT INTO consulta (id, idPaciente, idMedico, dataconsulta, descricao, status)
VALUES (4, 4, 2, '2025-04-04 00:35', 'consulta médica', 'iniciada');
INSERT INTO consulta (id, idPaciente, idMedico, dataconsulta, descricao, status)
VALUES (5, 5, 2, '2025-04-04 00:10', 'consulta médica', 'em espera');

UPDATE paciente
SET   nome = 'lorenza', dataNascimento = '1982-02-02', sexo = 'F', ddd = '45', telefone = '777777777', email = 'lorenza00004@gmail.com', endereco = '06564-581, cachoeiras, SP, mandavi zona leste', dataCadastro = '2025-04-04 17:00'
WHERE id = 4;

SELECT nome, dataCadastro
FROM paciente;

UPDATE medico
SET   nome = 'sara', especialidade = 'pediatria', crm = 011, ddd = '11', telefone = '666666666', email = 'sara011@gmail.com', dataCadastro = '2021-06-20 10:00'
WHERE id = 2;

SELECT nome, especialidade
FROM medico;

UPDATE consulta
SET  idPaciente = 4, idMedico = 2, dataconsulta = '2025-04-04 16:10', descricao = 'exame médico', status = 'iniciada'
WHERE id = 3;

SELECT idPaciente, descricao
FROM consulta;

DELETE FROM consulta
WHERE id = 1;

DELETE FROM medico
WHERE id = 1;

DELETE FROM paciente
WHERE id = 1;

-- drop database bd_at1_modelo_worbench;


