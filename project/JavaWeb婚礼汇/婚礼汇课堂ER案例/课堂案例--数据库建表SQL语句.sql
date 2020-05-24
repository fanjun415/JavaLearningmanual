-- MySQL Script generated by MySQL Workbench
-- 05/12/17 14:17:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_hotel` (
  `hotel_id` INT NOT NULL AUTO_INCREMENT,
  `hotel_name` VARCHAR(45) NOT NULL,
  `hotel_addr` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_taocan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_taocan` (
  `taocan_id` INT NOT NULL AUTO_INCREMENT,
  `taocan_name` VARCHAR(45) NULL,
  `taocan_price` INT NULL,
  `hotel_id` INT NULL,
  PRIMARY KEY (`taocan_id`),
  INDEX `hotel_taocan_fg_key_idx` (`hotel_id` ASC),
  CONSTRAINT `hotel_taocan_fg_key`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `mydb`.`tb_hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_baojian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_baojian` (
  `baojian_id` INT NOT NULL AUTO_INCREMENT,
  `baojian_name` VARCHAR(45) NULL,
  `baojian_min_desk_num` INT NULL,
  `baojian_min_pay` INT NULL ,
  `bj_hotel_id` INT NULL,
  PRIMARY KEY (`baojian_id`),
  INDEX `hotel_baojian_fk_idx` (`bj_hotel_id` ASC),
  CONSTRAINT `hotel_baojian_fk`
    FOREIGN KEY (`bj_hotel_id`)
    REFERENCES `mydb`.`tb_hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_image` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(45) NULL,
  `image_type` VARCHAR(45) NULL,
  `object_id` INT NULL,
  PRIMARY KEY (`image_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_phone` VARCHAR(45) NOT NULL,
  `user_address` VARCHAR(45) NULL,
  `user_image` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_account` (
  `account_id` INT NOT NULL,
  `account_price` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`account_id`),
  INDEX `user_account_fk_idx` (`user_id` ASC),
  CONSTRAINT `user_account_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tb_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_no` VARCHAR(45) NULL ,
  `order_price` INT NULL,
  `taocan_id` INT NULL,
  `user_id` INT NULL,
  `order_baojian_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `oder_taocan_fk_idx` (`taocan_id` ASC),
  INDEX `order_user_fk_idx` (`user_id` ASC),
  INDEX `order_baojian_fk_idx` (`order_baojian_id` ASC),
  CONSTRAINT `oder_taocan_fk`
    FOREIGN KEY (`taocan_id`)
    REFERENCES `mydb`.`tb_taocan` (`taocan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_user_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tb_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_baojian_fk`
    FOREIGN KEY (`order_baojian_id`)
    REFERENCES `mydb`.`tb_baojian` (`baojian_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_shopping_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_shopping_cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `cart_taocan_id` INT NULL,
  `cart_user_id` INT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `cart_taocan_idx` (`cart_taocan_id` ASC),
  INDEX `cart_user_fk_idx` (`cart_user_id` ASC),
  CONSTRAINT `cart_taocan_fk`
    FOREIGN KEY (`cart_taocan_id`)
    REFERENCES `mydb`.`tb_taocan` (`taocan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cart_user_fk`
    FOREIGN KEY (`cart_user_id`)
    REFERENCES `mydb`.`tb_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
