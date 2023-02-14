-- MySQL Script generated by MySQL Workbench
-- Tue Feb 14 14:44:46 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Database-Accident-Gouv
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Database-Accident-Gouv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Database-Accident-Gouv` DEFAULT CHARACTER SET utf8 ;
USE `Database-Accident-Gouv` ;

-- -----------------------------------------------------
-- Table `Database-Accident-Gouv`.`PREFIXE_caracteristiques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Database-Accident-Gouv`.`PREFIXE_caracteristiques` (
  `PREFIXE_caracteristiques_id` INT NOT NULL,
  `PREFIXE_caracteristiques_num_acc` VARCHAR(13) NULL COMMENT 'numéro d\'identifiant de l\'accident.',
  `PREFIXE_caracteristiques_jour` INT NULL COMMENT 'jour de l\'accident.',
  `PREFIXE_caracteristiques_mois` INT NULL COMMENT 'mois de l\'accident.',
  `PREFIXE_caracteristiques_an` INT NULL COMMENT 'année de l\'accident.',
  `PREFIXE_caracteristiques_hrmn` DATETIME NULL COMMENT 'heure et minutes de l\'accident.',
  `PREFIXE_caracteristiques_lum` VARCHAR(45) NULL COMMENT 'conditions d\'éclairage dans lesquelles l\'accident s\'est produit.',
  `PREFIXE_caracteristiques_dep` VARCHAR(5) NULL COMMENT 'code du département.',
  `PREFIXE_caracteristiques_com` VARCHAR(5) NULL COMMENT 'numéro de commune',
  `PREFIXE_caracteristiques_agg` VARCHAR(45) NULL COMMENT 'localisation de l\'accident.',
  `PREFIXE_caracteristiques_int` VARCHAR(45) NULL COMMENT 'type d\'intersection.',
  `PREFIXE_caracteristiques_atm` VARCHAR(100) NULL COMMENT 'conditions atmosphériques lors de l\'accident.',
  `PREFIXE_caracteristiques_col` VARCHAR(45) NULL COMMENT 'type de collision.',
  `PREFIXE_caracteristiques_adr` VARCHAR(50) NULL COMMENT 'adresse postale pour les accidents survenus en agglomération.',
  `PREFIXE_caracteristiques_lat` DOUBLE NULL COMMENT 'latitude du lieu de l\'accident.',
  `PREFIXE_caracteristiques_long` DOUBLE NULL COMMENT 'longitude du lieu de l\'accident.\n',
  `PREFIXE_caracteristiques_UUID` VARCHAR(36) NULL,
  PRIMARY KEY (`PREFIXE_caracteristiques_id`),
  UNIQUE INDEX `PREFIXE_caracteristiques_UUID_UNIQUE` (`PREFIXE_caracteristiques_UUID` ASC) VISIBLE,
  UNIQUE INDEX `PREFIXE_caracteristiques_num_acc_UNIQUE` (`PREFIXE_caracteristiques_num_acc` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Database-Accident-Gouv`.`PREFIXE_lieux`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Database-Accident-Gouv`.`PREFIXE_lieux` (
  `PREFIXE_lieux_id` INT NOT NULL,
  `PREFIXE_lieux_num_acc` VARCHAR(13) NULL COMMENT 'numéro d\'identifiant de l\'accident.',
  `PREFIXE_lieux_cart` INT NULL COMMENT 'catégorie de route.',
  `PREFIXE_lieux_voie` VARCHAR(3) NULL COMMENT 'numéro de la route.',
  `PREFIXE_lieux_v1` INT NULL COMMENT 'indice numérique du numéro de route.',
  `PREFIXE_lieux_v2` VARCHAR(10) NULL COMMENT 'lettre indice alphanumérique de la route.',
  `PREFIXE_lieux_circ` INT NULL COMMENT 'régime de circulation.',
  `PREFIXE_lieux_nbv` VARCHAR(10) NULL COMMENT 'nombre total de voies de circulation.',
  `PREFIXE_lieux_vosp` INT NULL COMMENT 'présence d\'une voie réservée.',
  `PREFIXE_lieux_prof` INT NULL COMMENT 'profil en long de la route.',
  `PREFIXE_lieux_pr` INT NULL COMMENT 'numéro du PR de rattachement.',
  `PREFIXE_lieux_pr1` INT NULL COMMENT 'distance en mètres au PR ',
  `PREFIXE_lieux_plan` INT NULL COMMENT 'tracé en plan de la route.',
  `PREFIXE_lieux_lartpc` INT NULL COMMENT 'largeur du terre-plein central.',
  `PREFIXE_lieux_larrout` INT NULL COMMENT 'largeur de la chaussée.',
  `PREFIXE_lieux_surf` INT NULL COMMENT 'état de la surface de la chaussée.',
  `PREFIXE_lieux_UUID` VARCHAR(36) NULL,
  PRIMARY KEY (`PREFIXE_lieux_id`),
  UNIQUE INDEX `PREFIXE_lieux_UUID_UNIQUE` (`PREFIXE_lieux_UUID` ASC) VISIBLE,
  UNIQUE INDEX `PREFIXE_lieux_num_acc_UNIQUE` (`PREFIXE_lieux_num_acc` ASC) VISIBLE,
  CONSTRAINT `cle_etrangere_lieu`
    FOREIGN KEY (`PREFIXE_lieux_num_acc`)
    REFERENCES `Database-Accident-Gouv`.`PREFIXE_caracteristiques` (`PREFIXE_caracteristiques_num_acc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Database-Accident-Gouv`.`PREFIXE_vehicules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Database-Accident-Gouv`.`PREFIXE_vehicules` (
  `PREFIXE_vehicules_id` INT NOT NULL,
  `PREFIXE_vehicules_num_acc` VARCHAR(13) NOT NULL COMMENT 'numéro d\'identifiant de l\'accident. ',
  `PREFIXE_vehicules_num_veh` VARCHAR(2) NOT NULL COMMENT 'numéro du véhicule dans l\'accident. ',
  `PREFIXE_vehicules_senc` INT NOT NULL COMMENT 'sens de circulation du véhicule.',
  `PREFIXE_vehicules_catv` INT NOT NULL COMMENT 'catégorie du véhicule. ',
  `PREFIXE_vehicules_occutc` INT NULL COMMENT 'nombre d\'occupants dans le véhicule.',
  `PREFIXE_vehicules_obs` INT NOT NULL COMMENT 'présence d\'obstacle fixe. ',
  `PREFIXE_vehicules_obsm` INT NOT NULL COMMENT 'présence d\'obstacle mobile. ',
  `PREFIXE_vehicules_choc` INT NOT NULL COMMENT 'direction d\'impact du choc. ',
  `PREFIXE_vehicules_UUID` VARCHAR(36) NULL,
  PRIMARY KEY (`PREFIXE_vehicules_id`),
  UNIQUE INDEX `PREFIXE_vehicules_UUID_UNIQUE` (`PREFIXE_vehicules_UUID` ASC) VISIBLE,
  UNIQUE INDEX `PREFIXE_vehicules_num_veh_UNIQUE` (`PREFIXE_vehicules_num_veh` ASC) VISIBLE,
  UNIQUE INDEX `PREFIXE_vehicules_num_acc_UNIQUE` (`PREFIXE_vehicules_num_acc` ASC) VISIBLE,
  CONSTRAINT `clé_etrangere_vehicule`
    FOREIGN KEY (`PREFIXE_vehicules_num_acc`)
    REFERENCES `Database-Accident-Gouv`.`PREFIXE_caracteristiques` (`PREFIXE_caracteristiques_num_acc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Database-Accident-Gouv`.`PREFIXE_usagers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Database-Accident-Gouv`.`PREFIXE_usagers` (
  `PREFIXE_usagers_id` INT NOT NULL,
  `PREFIXE_usagers_num_acc` VARCHAR(11) NULL COMMENT 'numéro d\'identifiant de l\'accident ',
  `PREFIXE_usagers_num_veh` INT NULL COMMENT 'numéro du véhicule impliqué dans l\'accident ',
  `PREFIXE_usagers_place` INT NULL COMMENT 'place occupée par l\'usager dans le véhicule',
  `PREFIXE_usagers_catu` INT NULL COMMENT 'catégorie de l\'usager (conducteur, passager, piéton)',
  `PREFIXE_usagers_grav` INT NULL COMMENT 'gravité de la lésion de l\'usager',
  `PREFIXE_usagers_sexe` VARCHAR(3) NULL COMMENT 'sexe de l\'usager',
  `PREFIXE_usagers_an_nais` INT NULL COMMENT 'année de naissance de l\'usager',
  `PREFIXE_usagers_trajet` INT NULL COMMENT 'type de trajet de l\'usager (domicile-travail, domicile-école, etc.)',
  `PREFIXE_usagers_UUID` VARCHAR(36) NULL,
  PRIMARY KEY (`PREFIXE_usagers_id`),
  UNIQUE INDEX `PREFIXE_usagers_UUID_UNIQUE` (`PREFIXE_usagers_UUID` ASC) VISIBLE,
  UNIQUE INDEX `PREFIXE_usagers_num_acc_UNIQUE` (`PREFIXE_usagers_num_acc` ASC) VISIBLE,
  CONSTRAINT `cle_etrangere_usagers`
    FOREIGN KEY (`PREFIXE_usagers_num_acc`)
    REFERENCES `Database-Accident-Gouv`.`PREFIXE_caracteristiques` (`PREFIXE_caracteristiques_num_acc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
