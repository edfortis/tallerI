SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `tintoreria` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `tintoreria` ;

-- -----------------------------------------------------
-- Table `tintoreria`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `aPaterno` VARCHAR(45) NOT NULL,
  `aMaterno` VARCHAR(45) NOT NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tintoreria`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `empleado_idEmpleado` INT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuario_empleado_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `fk_usuario_empleado`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `tintoreria`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tintoreria`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`entrega` (
  `idEntrega` INT NOT NULL AUTO_INCREMENT,
  `fechaEntrega` DATETIME NOT NULL,
  PRIMARY KEY (`idEntrega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tintoreria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `aPaterno` VARCHAR(45) NOT NULL,
  `aMaterno` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tintoreria`.`ventaServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`ventaServicio` (
  `idVentaServicio` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `ventaServiciocol` VARCHAR(45) NOT NULL,
  `empleado_idEmpleado` INT NOT NULL,
  `entrega_idEntrega` INT NULL,
  `cliente_idCliente` INT NULL,
  PRIMARY KEY (`idVentaServicio`),
  INDEX `fk_ventaServicio_empleado1_idx` (`empleado_idEmpleado` ASC),
  INDEX `fk_ventaServicio_entrega1_idx` (`entrega_idEntrega` ASC),
  INDEX `fk_ventaServicio_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_ventaServicio_empleado1`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `tintoreria`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventaServicio_entrega1`
    FOREIGN KEY (`entrega_idEntrega`)
    REFERENCES `tintoreria`.`entrega` (`idEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventaServicio_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `tintoreria`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tintoreria`.`catalogoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`catalogoServicio` (
  `idCatalogoServicio` INT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NULL,
  `precio` DOUBLE NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `porcentaje` TINYINT NULL,
  PRIMARY KEY (`idCatalogoServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tintoreria`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tintoreria`.`carrito` (
  `idCarrito` INT NOT NULL AUTO_INCREMENT,
  `catalogoServicio_idCatalogoServicio` INT NOT NULL,
  `ventaServicio_idVentaServicio` INT NOT NULL,
  PRIMARY KEY (`idCarrito`),
  INDEX `fk_carrito_catalogoServicio1_idx` (`catalogoServicio_idCatalogoServicio` ASC),
  INDEX `fk_carrito_ventaServicio1_idx` (`ventaServicio_idVentaServicio` ASC),
  CONSTRAINT `fk_carrito_catalogoServicio1`
    FOREIGN KEY (`catalogoServicio_idCatalogoServicio`)
    REFERENCES `tintoreria`.`catalogoServicio` (`idCatalogoServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_ventaServicio1`
    FOREIGN KEY (`ventaServicio_idVentaServicio`)
    REFERENCES `tintoreria`.`ventaServicio` (`idVentaServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
