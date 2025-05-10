-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mealplandb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mealplandb` ;

-- -----------------------------------------------------
-- Schema mealplandb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mealplandb` DEFAULT CHARACTER SET utf8 ;
USE `mealplandb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `biography` TEXT NULL,
  `profile_image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `ingredients` TEXT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `date_created` DATETIME NOT NULL,
  `directions` TEXT NOT NULL,
  `date_updated` DATETIME NULL,
  `enabled` TINYINT NULL,
  `user_id` INT NOT NULL,
  `notes` TEXT NULL,
  `published` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_plan` ;

CREATE TABLE IF NOT EXISTS `meal_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `description` TEXT NULL,
  `notes` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `date_created` DATETIME NULL,
  `date_updated` DATETIME NULL,
  `published` TINYINT NULL,
  INDEX `fk_meal_plan_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_meal_plan_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_has_meal_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_has_meal_plan` ;

CREATE TABLE IF NOT EXISTS `recipe_has_meal_plan` (
  `recipe_id` INT NOT NULL,
  `meal_plan_id` INT NOT NULL,
  PRIMARY KEY (`recipe_id`, `meal_plan_id`),
  INDEX `fk_recipe_has_meal_plan_meal_plan1_idx` (`meal_plan_id` ASC) VISIBLE,
  INDEX `fk_recipe_has_meal_plan_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_meal_plan_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_meal_plan_meal_plan1`
    FOREIGN KEY (`meal_plan_id`)
    REFERENCES `meal_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_comment` ;

CREATE TABLE IF NOT EXISTS `recipe_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NOT NULL,
  `comment` TEXT NULL,
  `enabled` TINYINT NULL,
  `date_created` DATETIME NULL,
  `user_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  INDEX `fk_comment_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_comment_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `recipe_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `allergen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allergen` ;

CREATE TABLE IF NOT EXISTS `allergen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_time`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_time` ;

CREATE TABLE IF NOT EXISTS `meal_time` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_allergen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_allergen` ;

CREATE TABLE IF NOT EXISTS `recipe_allergen` (
  `recipe_id` INT NOT NULL,
  `allergen_id` INT NOT NULL,
  INDEX `fk_recipe_allergens_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_recipe_allergens_allergens1_idx` (`allergen_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_allergens_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_allergens_allergens1`
    FOREIGN KEY (`allergen_id`)
    REFERENCES `allergen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_meal_time`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_meal_time` ;

CREATE TABLE IF NOT EXISTS `recipe_meal_time` (
  `recipe_id` INT NOT NULL,
  `meal_time_id` INT NOT NULL,
  INDEX `fk_recipe_meal_time_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_recipe_meal_time_meal_times1_idx` (`meal_time_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_meal_time_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_meal_time_meal_times1`
    FOREIGN KEY (`meal_time_id`)
    REFERENCES `meal_time` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet` ;

CREATE TABLE IF NOT EXISTS `diet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_diet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_diet` ;

CREATE TABLE IF NOT EXISTS `recipe_diet` (
  `recipe_id` INT NOT NULL,
  `diet_id` INT NOT NULL,
  INDEX `fk_recipe_diet_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_recipe_diet_diet1_idx` (`diet_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_diet_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_diet_diet1`
    FOREIGN KEY (`diet_id`)
    REFERENCES `diet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_image` ;

CREATE TABLE IF NOT EXISTS `recipe_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2000) NULL,
  `date_created` DATETIME NULL,
  `caption` TEXT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_image_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_image_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_rating` ;

CREATE TABLE IF NOT EXISTS `recipe_rating` (
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `remark` TEXT NULL,
  `date_created` DATETIME NULL,
  PRIMARY KEY (`recipe_id`, `user_id`),
  INDEX `fk_recipe_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_recipe_has_user_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_has_user_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS mealplanuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'mealplanuser'@'localhost' IDENTIFIED BY 'mealplanuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'mealplanuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `date_created`, `first_name`, `last_name`, `biography`, `profile_image_url`) VALUES (1, 'admin', 'test', 1, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (1, 'Chicken Enchiladas', 'Chicken', NULL, '2025-02-11', 'Put in oven', NULL, NULL, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `meal_plan` (`id`, `user_id`, `name`, `enabled`, `description`, `notes`, `image_url`, `date_created`, `date_updated`, `published`) VALUES (1, 1, 'Meal Plan 1', 1, 'description', 'notes', 'imageurl', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_has_meal_plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_has_meal_plan` (`recipe_id`, `meal_plan_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_comment` (`id`, `recipe_id`, `comment`, `enabled`, `date_created`, `user_id`, `in_reply_to_id`) VALUES (1, 1, NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `allergen`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `allergen` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Gluten-free', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_time`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `meal_time` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Breakfast', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_allergen`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_allergen` (`recipe_id`, `allergen_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_meal_time`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_meal_time` (`recipe_id`, `meal_time_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diet`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `diet` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Vegan', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_diet`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_diet` (`recipe_id`, `diet_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_image` (`id`, `image_url`, `date_created`, `caption`, `recipe_id`) VALUES (1, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `mealplandb`;
INSERT INTO `recipe_rating` (`recipe_id`, `user_id`, `rating`, `remark`, `date_created`) VALUES (1, 1, NULL, NULL, NULL);

COMMIT;

