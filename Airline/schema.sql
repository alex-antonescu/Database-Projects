SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `sql_airline` DEFAULT CHARACTER SET utf8;
USE `sql_airline`;

CREATE TABLE IF NOT EXISTS `sql_airline`.`FlightClass` (
  `id_class` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_class`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Passenger` (
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `id_passenger` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_passenger`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Airline` (
  `idAirline` INT NOT NULL,
  PRIMARY KEY (`idAirline`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Flight` (
  `number` VARCHAR(50) NOT NULL,
  `departure_dateTime` DATETIME NOT NULL,
  `arrival_dateTime` DATETIME NOT NULL,
  `durationInMinutes` INT NOT NULL,
  `distance_in_KM` INT NOT NULL,
  `id_departure_airport` INT NOT NULL,
  `id_arrival_airport` INT NOT NULL,
  `Airline_idAirline` INT NOT NULL,
  PRIMARY KEY (`number`, `Airline_idAirline`),
  INDEX `fk_Flight_Airline1_idx` (`Airline_idAirline` ASC),
  CONSTRAINT `fk_Flight_Airline1`
    FOREIGN KEY (`Airline_idAirline`)
    REFERENCES `sql_airline`.`Airline` (`idAirline`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Ticket` (
  `ticketNumber` VARCHAR(50) NOT NULL,
  `price` FLOAT(25) NOT NULL,
  `Flight_number` VARCHAR(50) NOT NULL,
  `Flight_Airline_idAirline` INT NOT NULL,
  `FlightClass_id_class` INT NOT NULL,
  INDEX `fk_Ticket_Flight1_idx` (`Flight_number` ASC, `Flight_Airline_idAirline` ASC),
  INDEX `fk_Ticket_FlightClass1_idx` (`FlightClass_id_class` ASC),
  PRIMARY KEY (`ticketNumber`),
  CONSTRAINT `fk_Ticket_Flight1`
    FOREIGN KEY (`Flight_number`, `Flight_Airline_idAirline`)
    REFERENCES `sql_airline`.`Flight` (`number`, `Airline_idAirline`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ticket_FlightClass1`
    FOREIGN KEY (`FlightClass_id_class`)
    REFERENCES `sql_airline`.`FlightClass` (`id_class`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Passenger_has_Ticket` (
  `Passenger_id_passenger` INT NOT NULL,
  `Ticket_ticketNumber` VARCHAR(50) NOT NULL,
  INDEX `fk_Passenger_has_Ticket_Ticket1_idx` (`Ticket_ticketNumber` ASC),
  INDEX `fk_Passenger_has_Ticket_Passenger1_idx` (`Passenger_id_passenger` ASC),
  CONSTRAINT `fk_Passenger_has_Ticket_Passenger1`
    FOREIGN KEY (`Passenger_id_passenger`)
    REFERENCES `sql_airline`.`Passenger` (`id_passenger`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Passenger_has_Ticket_Ticket1`
    FOREIGN KEY (`Ticket_ticketNumber`)
    REFERENCES `sql_airline`.`Ticket` (`ticketNumber`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Airport` (
  `IATACode` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IATACode`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `sql_airline`.`Airport_has_Flight` (
  `Airport_IATACode` VARCHAR(50) NOT NULL,
  `Flight_number` VARCHAR(50) NOT NULL,
  `Flight_Airline_idAirline` INT NOT NULL,
  PRIMARY KEY (`Airport_IATACode`, `Flight_number`, `Flight_Airline_idAirline`),
  INDEX `fk_Airport_has_Flight_Flight1_idx` (`Flight_number` ASC, `Flight_Airline_idAirline` ASC),
  INDEX `fk_Airport_has_Flight_Airport1_idx` (`Airport_IATACode` ASC),
  CONSTRAINT `fk_Airport_has_Flight_Airport1`
    FOREIGN KEY (`Airport_IATACode`)
    REFERENCES `sql_airline`.`Airport` (`IATACode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Airport_has_Flight_Flight1`
    FOREIGN KEY (`Flight_number`, `Flight_Airline_idAirline`)
    REFERENCES `sql_airline`.`Flight` (`number`, `Airline_idAirline`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
