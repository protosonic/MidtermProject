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
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (1, 'Chicken Enchiladas', '1-2 tablespoons avocado oil, can sub olive oil\n½ yellow onion, diced\n14 oz. red enchilada sauce, I highly recommend my homemade version\n2 ¾ cups shredded chicken, see notes\nSalt, to taste\n3 cloves garlic, minced\n1 (15 oz.) can black beans, drained and rinsed\n1 (4 oz.) can diced green chiles, undrained\n2 tablespoons lime juice\n1 teaspoon hot sauce\n1 teaspoon honey\n2 tablespoons finely chopped cilantro, plus more to garnish\n8 (8-inch) flour tortillas\n3 cups shredded Mexican cheese, divided\nSour cream, for serving', 'https://thecozycook.com/wp-content/uploads/2024/03/Chicken-Enchiladas-2.jpg', '2025-02-11', 'Preheat oven to 350° F.\nCombine the seasonings and set aside. Measure out remaining ingredients before beginning.\nHeat olive oil in a large skillet over medium heat. Add the diced onions and soften for 5 minutes.\nReduce heat to medium-low. Add 1/3 cup of enchilada sauce to the skillet along with the garlic.\nAdd the cooked chicken and season with salt to taste if not already salted. Rotisserie chicken likely won’t require additional salt.\nSprinkle the chicken with the combined seasonings (from step 2) and toss to coat. Stir in the black beans, green chiles, lime juice, hot sauce, honey, and cilantro and heat through for 1 to 2 minutes. Remove and set aside.\nLightly grease a 9 x 13-inch casserole dish. Spread 1/4 cup of enchilada sauce on the bottom, the layer will be thin.\nOptional: Microwave 4 tortillas at a time for 30 seconds to make them more pliable.\nSpoon the filling on the bottom third of each tortilla and top with a heaping tablespoon of cheese. Roll tightly and place seam-side-down in the casserole dish.\nPour/spread enchilada sauce over the top of the rolled tortillas. (I use up to 3/4 cup, you don\'t have to use all remaining sauce, it may be too heavy.) Sprinkle with an even layer of the remaining cheese.\nCover and bake for 10 minutes. (If topping with foil, spray the bottom with nonstick cooking spray to prevent the cheese from sticking to it.)\nRemove cover and bake for 13 more minutes. Broil on low (450) for 1-2 minutes to brown the top slightly if desired. Watch it closely during this time.\nGarnish with cilantro and desired toppings (see notes for suggestions) and serve with sour cream!', '2025-05-12', 1, 1, 'This was my great grandma\'s recipe', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (2, 'Best Gumbo Recipe', 'Andouille Sausage, Chicken Thighs, Shrimp, Lump Crab Meat, Vegetable Oil, All-Purpose Flour, Holy Trinity, Seasonings, Garlic, Herbs and Spices, Chicken Broth, Diced Tomatoes with Green Chilies, Green Onions, Fresh Parsley, Cooked Rice, File Powder', 'https://www.jocooks.com/wp-content/uploads/2023/10/gumbo-recipe-1-4.jpg', '2025-04-16', 'Brown the Sausage and Chicken\nIn a large skillet, heat 1 tablespoon of vegetable oil over medium heat. Add the andouille sausage and chicken thighs, and brown them until they develop a crust. Remove them from the heat and set aside.\n\nMake the Roux\nWhisk 1 cup of vegetable oil and 1 cup of flour together in a large Dutch oven or heavy-bottomed pot. Stir the mixture constantly and cook it over medium heat for about 15 to 20 minutes, or until it transforms into a dark brown chocolate color.\n\nAdd the Aromatics and Spices\nAdd the chopped onions, bell peppers, and celery to the pot. Season with salt and black pepper, and cook for about 5 minutes to soften, stirring often to prevent the roux from burning. Then, add minced garlic, thyme, oregano, paprika, and bay leaves. Cook for just one more minute until fragrant.\n\nAdd the Chicken and Sausage\nReturn the browned sausage and chicken to the pot. Coat them well in the vegetable mixture and cook for 5 to 7 minutes.\n\nAdd the Broth and Cook\nSlowly pour in the chicken broth, then add the can of diced tomatoes. Bring the mixture to a simmer, reduce the heat to low, and let it cook covered for about 1 hour.\n\nAdd the Seafood\nAfter the stew has simmered for an hour, stir in the shrimp, lump crab meat, green onions, and fresh parsley until well combined. Cook the gumbo covered for 5 more minutes, or until the shrimp is no longer pink and done. Taste and add more salt and black pepper if necessary.\n\nServe and Enjoy\nServe the gumbo over cooked rice in your favorite soup bowl, with a sprinkle of filé powder on top if desired.', '2025-05-17', 1, 1, 'This is the best Gumbo Recipe', 1);

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
INSERT INTO `recipe_comment` (`id`, `recipe_id`, `comment`, `enabled`, `date_created`, `user_id`, `in_reply_to_id`) VALUES (1, 1, NULL, 1, NULL, 1, NULL);

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

