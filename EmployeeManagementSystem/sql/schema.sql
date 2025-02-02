-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EmployeeManagementSystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EmployeeManagementSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EmployeeManagementSystem` DEFAULT CHARACTER SET utf8 ;
USE `EmployeeManagementSystem` ;

-- -----------------------------------------------------
-- Table `EmployeeManagementSystem`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmployeeManagementSystem`.`roles` (
  `id_role` TINYINT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeeManagementSystem`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmployeeManagementSystem`.`departments` (
  `id_department` TINYINT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_department`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EmployeeManagementSystem`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmployeeManagementSystem`.`employees` (
  `id_employee` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `roles_id_role` TINYINT(10) NOT NULL,
  `departments_id_department` TINYINT(10) NOT NULL,
  PRIMARY KEY (`id_employee`, `roles_id_role`, `departments_id_department`),
  INDEX `fk_employees_roles_idx` (`roles_id_role` ASC) VISIBLE,
  INDEX `fk_employees_departments1_idx` (`departments_id_department` ASC) VISIBLE,
  CONSTRAINT `fk_employees_roles`
    FOREIGN KEY (`roles_id_role`)
    REFERENCES `EmployeeManagementSystem`.`roles` (`id_role`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_employees_departments1`
    FOREIGN KEY (`departments_id_department`)
    REFERENCES `EmployeeManagementSystem`.`departments` (`id_department`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
