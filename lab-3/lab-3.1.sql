-- MySQL Script generated by MySQL Workbench
-- Sat 31 Dec 2022 06:29:29 PM -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `tipo` ENUM('pessoa_fisica', 'pessoa_jurica') NULL,
  `identificacao` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `Frete` DECIMAL(15,2) NULL,
  PRIMARY KEY (`id`, `cliente_id`),
  INDEX `fk_Pedido_Cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `mydb`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `id` INT NOT NULL,
  `categoria` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `valor` DECIMAL(15,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_Fornecedor` (
  `produto_id` INT NOT NULL,
  `fornecedor_id` INT NOT NULL,
  PRIMARY KEY (`produto_id`, `fornecedor_id`),
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`fornecedor_id` ASC) VISIBLE,
  INDEX `fk_Produto_has_Fornecedor_Produto_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `mydb`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `mydb`.`Fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `id` INT NOT NULL,
  `local` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_Estoque` (
  `produto_id` INT NOT NULL,
  `estoque_id` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`produto_id`, `estoque_id`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`estoque_id` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `mydb`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`estoque_id`)
    REFERENCES `mydb`.`Estoque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_Pedido` (
  `produto_id` INT NOT NULL,
  `pedido_id` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`produto_id`, `pedido_id`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`pedido_id` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `mydb`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `mydb`.`Pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_Vendedor` (
  `produto_id` INT NOT NULL,
  `vendedor_id` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`produto_id`, `vendedor_id`),
  INDEX `fk_Produto_has_Vendedor_Vendedor1_idx` (`vendedor_id` ASC) VISIBLE,
  INDEX `fk_Produto_has_Vendedor_Produto1_idx` (`produto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Vendedor_Produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `mydb`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Vendedor_Vendedor1`
    FOREIGN KEY (`vendedor_id`)
    REFERENCES `mydb`.`Vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
