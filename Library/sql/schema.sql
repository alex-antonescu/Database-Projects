-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Library` DEFAULT CHARACTER SET utf8 ;
USE `Library` ;

-- -----------------------------------------------------
-- Table `Library`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`books` (
  `id_book` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `isAvailable` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_book`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`users_borrows_books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`users_borrows_books` (
  `users_id_user` INT NOT NULL,
  `books_id_book` INT NOT NULL,
  `borrow_date` DATETIME NOT NULL,
  `return_date` DATETIME NOT NULL,
  INDEX `fk_users_has_books_books1_idx` (`books_id_book` ASC) VISIBLE,
  INDEX `fk_users_has_books_users_idx` (`users_id_user` ASC) VISIBLE,
  PRIMARY KEY (`users_id_user`, `books_id_book`, `borrow_date`),
  CONSTRAINT `fk_users_has_books_users`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `Library`.`users` (`id_user`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_books_books1`
    FOREIGN KEY (`books_id_book`)
    REFERENCES `Library`.`books` (`id_book`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`authors` (
  `id_author` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_author`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`books_has_authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`books_has_authors` (
  `books_id_book` INT NOT NULL,
  `authors_id_author` INT NOT NULL,
  PRIMARY KEY (`books_id_book`, `authors_id_author`),
  INDEX `fk_books_has_authors_authors1_idx` (`authors_id_author` ASC) VISIBLE,
  INDEX `fk_books_has_authors_books1_idx` (`books_id_book` ASC) VISIBLE,
  CONSTRAINT `fk_books_has_authors_books1`
    FOREIGN KEY (`books_id_book`)
    REFERENCES `Library`.`books` (`id_book`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_authors_authors1`
    FOREIGN KEY (`authors_id_author`)
    REFERENCES `Library`.`authors` (`id_author`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
