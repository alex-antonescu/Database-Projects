-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema StudentsGrades
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema StudentsGrades
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `StudentsGrades` DEFAULT CHARACTER SET utf8 ;
USE `StudentsGrades` ;

-- -----------------------------------------------------
-- Table `StudentsGrades`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentsGrades`.`students` (
  `id_student` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_student`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentsGrades`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentsGrades`.`courses` (
  `id_course` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_course`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentsGrades`.`students_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentsGrades`.`students_has_courses` (
  `id_student` INT NOT NULL,
  `id_course` INT NOT NULL,
  `grade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_student`, `id_course`),
  INDEX `fk_students_has_courses_courses1_idx` (`id_course` ASC) VISIBLE,
  INDEX `fk_students_has_courses_students_idx` (`id_student` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_courses_students`
    FOREIGN KEY (`id_student`)
    REFERENCES `StudentsGrades`.`students` (`id_student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_courses_courses1`
    FOREIGN KEY (`id_course`)
    REFERENCES `StudentsGrades`.`courses` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
