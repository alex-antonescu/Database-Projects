-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema School
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema School
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `School` DEFAULT CHARACTER SET utf8 ;
USE `School` ;

-- -----------------------------------------------------
-- Table `School`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Students` (
  `id_student` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_student`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Courses` (
  `id_course` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_course`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Instructors` (
  `idInstructors` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idInstructors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Enrollments` (
  `id_student` INT NOT NULL,
  `id_course` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `price` FLOAT NOT NULL,
  `Instructors_idInstructors` INT NOT NULL,
  `Courses_id_course` INT NOT NULL,
  PRIMARY KEY (`id_student`, `id_course`, `Instructors_idInstructors`, `Courses_id_course`),
  INDEX `fk_Enrollments_Instructors1_idx` (`Instructors_idInstructors` ASC) VISIBLE,
  INDEX `fk_Enrollments_Courses1_idx` (`Courses_id_course` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollments_Students`
    FOREIGN KEY (`id_student`)
    REFERENCES `School`.`Students` (`id_student`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Enrollments_Courses`
    FOREIGN KEY (`id_course`)
    REFERENCES `School`.`Courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Enrollments_Instructors1`
    FOREIGN KEY (`Instructors_idInstructors`)
    REFERENCES `School`.`Instructors` (`idInstructors`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Enrollments_Courses1`
    FOREIGN KEY (`Courses_id_course`)
    REFERENCES `School`.`Courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
