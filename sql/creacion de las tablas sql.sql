# creacion de las tablas con sus primary keys y sus foreign keys
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema animales_peligro_extincion_españa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema animales_peligro_extincion_españa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `animales_peligro_extincion_españa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `animales_peligro_extincion_españa` ;

-- -----------------------------------------------------
-- Table `animales_peligro_extincion_españa`.`animales_peligro_extincion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animales_peligro_extincion_españa`.`animales_peligro_extincion` (
  `animal_id` INT NOT NULL,
  `nombre_cientifico` VARCHAR(45) NULL DEFAULT NULL,
  `grupo/animal` VARCHAR(45) NULL DEFAULT NULL,
  `familia` VARCHAR(45) NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  `Nombre_comun` VARCHAR(45) NULL DEFAULT NULL,
  `categoria/extincion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`animal_id`),
  UNIQUE INDEX `uc_Nombre_comun` (`Nombre_comun` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animales_peligro_extincion_españa`.`buho_real_españa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animales_peligro_extincion_españa`.`buho_real_españa` (
  `year` INT NOT NULL,
  `parejas` INT NULL DEFAULT NULL,
  `total_de_buhos` INT NULL DEFAULT NULL,
  `Especie_buh` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`year`),
  INDEX `fk_Especie_buh` (`Especie_buh` ASC) VISIBLE,
  CONSTRAINT `fk_Especie_buh`
    FOREIGN KEY (`Especie_buh`)
    REFERENCES `animales_peligro_extincion_españa`.`animales_peligro_extincion` (`Nombre_comun`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animales_peligro_extincion_españa`.`lince_iberico_españa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animales_peligro_extincion_españa`.`lince_iberico_españa` (
  `Region_lin` VARCHAR(45) NOT NULL,
  `Subpoblacion` VARCHAR(45) NOT NULL,
  `Especie_lin` VARCHAR(45) NULL DEFAULT NULL,
  `Hembras_reproductoras` INT NULL DEFAULT NULL,
  `Cachorros` INT NULL DEFAULT NULL,
  `machos/hembaras_no_repro` INT NULL DEFAULT NULL,
  `Total_ejemplares` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Subpoblacion`),
  INDEX `fk_especie_lin` (`Especie_lin` ASC) VISIBLE,
  CONSTRAINT `fk_especie_lin`
    FOREIGN KEY (`Especie_lin`)
    REFERENCES `animales_peligro_extincion_españa`.`animales_peligro_extincion` (`Nombre_comun`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animales_peligro_extincion_españa`.`lobo_iberico_españa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animales_peligro_extincion_españa`.`lobo_iberico_españa` (
  `Region_lob` VARCHAR(45) NOT NULL,
  `Especie_lob` VARCHAR(45) NULL DEFAULT NULL,
  `exclusivas_en_la_region` INT NULL DEFAULT NULL,
  `compartidas_con_otras_regiones` INT NULL DEFAULT NULL,
  `total` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Region_lob`),
  INDEX `fk_especie_lob` (`Especie_lob` ASC) VISIBLE,
  CONSTRAINT `fk_especie_lob`
    FOREIGN KEY (`Especie_lob`)
    REFERENCES `animales_peligro_extincion_españa`.`animales_peligro_extincion` (`Nombre_comun`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
