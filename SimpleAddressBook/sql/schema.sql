-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema simpleaddressbook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema simpleaddressbook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `simpleaddressbook` DEFAULT CHARACTER SET utf8mb3 ;
USE `simpleaddressbook` ;

-- -----------------------------------------------------
-- Table `simpleaddressbook`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simpleaddressbook`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;

USE `simpleaddressbook` ;

-- -----------------------------------------------------
-- procedure AddUser
-- -----------------------------------------------------

DELIMITER $$
USE `simpleaddressbook`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(
	IN p_first_name VARCHAR(45),
	IN p_last_name VARCHAR(45),
	IN p_phone_number VARCHAR(45),
	IN p_email_address VARCHAR(45)
)
BEGIN 
	INSERT INTO users(first_name, last_name, phone_number, email_address)
    VALUES (p_first_name, p_last_name, p_phone_number, p_email_address);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteUser
-- -----------------------------------------------------

DELIMITER $$
USE `simpleaddressbook`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(
	IN p_user_id INT
)
BEGIN
	DELETE 
	FROM users
	WHERE id_user = p_user_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ShowAllContacts
-- -----------------------------------------------------

DELIMITER $$
USE `simpleaddressbook`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowAllContacts`()
BEGIN
	SELECT * FROM users;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
