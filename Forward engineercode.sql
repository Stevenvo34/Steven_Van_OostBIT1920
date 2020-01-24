-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Examen Question3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Examen Question3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Examen Question3` ;
USE `Examen Question3` ;

-- -----------------------------------------------------
-- Table `Examen Question3`.`Mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen Question3`.`Mutations` (
  `idMutations` INT NOT NULL AUTO_INCREMENT,
  `Gene Name` VARCHAR(45) CHARACTER SET 'binary' NULL,
  `start` INT NULL,
  `end` INT NULL,
  `Chromosome` INT NULL,
  `Gene ID` INT NOT NULL,
  `Patient_name` VARCHAR(45) NULL,
  `patient_syndrome` VARCHAR(45) NULL,
  `SyndromeID` INT NOT NULL,
  PRIMARY KEY (`idMutations`, `Gene ID`, `SyndromeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen Question3`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen Question3`.`Patients` (
  `idPatients` INT NOT NULL,
  `Gender` ENUM('F', 'M') NULL,
  `Age at diagnostic` VARCHAR(45) NULL,
  `Patientscol` DATETIME NULL,
  PRIMARY KEY (`idPatients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen Question3`.`Gene info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen Question3`.`Gene info` (
  `Gene Name` VARCHAR(45) NULL,
  `Gene discription` VARCHAR(500) NULL,
  `Gene ID` INT NOT NULL,
  PRIMARY KEY (`Gene ID`),
  CONSTRAINT `fk_Gene`
    FOREIGN KEY (`Gene ID`)
    REFERENCES `Examen Question3`.`Mutations` (`Gene ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen Question3`.`Syndrome info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen Question3`.`Syndrome info` (
  `SyndromeID` INT NOT NULL,
  `Syndrome info` VARCHAR(300) NULL,
  `Syndrome name` VARCHAR(45) NULL,
  PRIMARY KEY (`SyndromeID`),
  CONSTRAINT `fk syndrome`
    FOREIGN KEY (`SyndromeID`)
    REFERENCES `Examen Question3`.`Mutations` (`SyndromeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen Question3`.`Mutations_has_Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen Question3`.`Mutations_has_Patients` (
  `Mutations_id` INT NOT NULL,
  `Patients_id` INT NOT NULL,
  PRIMARY KEY (`Mutations_id`, `Patients_id`),
  INDEX `fk_Mutations_has_Patients_Patients1_idx` (`Patients_id` ASC) VISIBLE,
  INDEX `fk_Mutations_has_Patients_Mutations1_idx` (`Mutations_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mutations_has_Patients_Mutations1`
    FOREIGN KEY (`Mutations_id`)
    REFERENCES `Examen Question3`.`Mutations` (`idMutations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mutations_has_Patients_Patients1`
    FOREIGN KEY (`Patients_id`)
    REFERENCES `Examen Question3`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
