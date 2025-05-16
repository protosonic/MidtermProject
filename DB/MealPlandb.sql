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
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (2, 'Best Gumbo Recipe', 'Andouille Sausage, Chicken Thighs, Shrimp, Lump Crab Meat, Vegetable Oil, All-Purpose Flour, Holy Trinity, Seasonings, Garlic, Herbs and Spices, Chicken Broth, Diced Tomatoes with Green Chilies, Green Onions, Fresh Parsley, Cooked Rice, File Powder', 'https://www.jocooks.com/wp-content/uploads/2023/10/gumbo-recipe-1-4.jpg', '2025-04-16', 'Brown the Sausage and Chicken\nIn a large skillet, heat 1 tablespoon of vegetable oil over medium heat. Add the andouille sausage and chicken thighs, and brown them until they develop a crust. Remove them from the heat and set aside.\n\nMake the Roux\nWhisk 1 cup of vegetable oil and 1 cup of flour together in a large Dutch oven or heavy-bottomed pot. Stir the mixture constantly and cook it over medium heat for about 15 to 20 minutes, or until it transforms into a dark brown chocolate color.\n\nAdd the Aromatics and Spices\nAdd the chopped onions, bell peppers, and celery to the pot. Season with salt and black pepper, and cook for about 5 minutes to soften, stirring often to prevent the roux from burning. Then, add minced garlic, thyme, oregano, paprika, and bay leaves. Cook for just one more minute until fragrant.\n\nAdd the Chicken and Sausage\nReturn the browned sausage and chicken to the pot. Coat them well in the vegetable mixture and cook for 5 to 7 minutes.\n\nAdd the Broth and Cook\nSlowly pour in the chicken broth, then add the can of diced tomatoes. Bring the mixture to a simmer, reduce the heat to low, and let it cook covered for about 1 hour.\n\nAdd the Seafood\nAfter the stew has simmered for an hour, stir in the shrimp, lump crab meat, green onions, and fresh parsley until well combined. Cook the gumbo covered for 5 more minutes, or until the shrimp is no longer pink and done. Taste and add more salt and black pepper if necessary.\n\nServe and Enjoy\nServe the gumbo over cooked rice in your favorite soup bowl, with a sprinkle of filé powder on top if desired.', '2025-05-15', 1, 1, 'This is the best Gumbo Recipe', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (3, 'Creamy Chicken Pesto Pasta', 'Penne pasta (or any short pasta)\n\nBoneless, skinless chicken breasts\n\nKosher salt\n\nFreshly ground black pepper\n\nRed pepper flakes\n\nItalian seasoning\n\nExtra-virgin olive oil\n\nHeavy cream\n\nParmesan cheese\n\nSun-dried tomatoes\n\nBasil pesto\n\nFresh basil leaves', 'https://www.themediterraneandish.com/wp-content/uploads/2023/08/pesto-chicken-pasta-recipe-16.jpg', '2025-04-18', 'Season the chicken. Add the chicken to a bowl and season with the Italian seasoning and a big pinch each of kosher salt and black pepper. Toss to coat.\n\nCook the pasta. Bring a medium pot of water to a boil and salt it well with about 1 tablespoon of salt. Drop the pasta in the boiling water and cook until al dente according to package instructions (about 8 to 9 minutes).\n\nCook the chicken. While the pasta is cooking, heat the olive oil in a large non-stick skillet over medium-high. Add the chicken and cook, tossing occasionally, until golden brown on the outside and cooked through, about 7 to 8 minutes.\n\nDrain the pasta. When the pasta is ready, reserve about 1 cup of the cooking water, then drain the pasta.\n\nCombine. Reduce the heat under the chicken, then stir in the cooked pasta, heavy cream, Parmesan, and sun-dried tomatoes. Mix until well combined. If it seems dry, add a splash of the reserved pasta water (a couple tablespoons at a time) until the sauce is glossy and coats the pasta.\n\nAdd the pesto. Remove the pan from the heat and stir in the basil pesto. Finish with a sprinkle of extra Parmesan, red pepper flakes, and torn fresh basil leaves. Serve immediately.', '2025-05-15', 1, 1, 'Favorite recipe from MRE', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (4, 'Peanut Udon Noodles & Fried Eggs', '4 Pasture-Raised Eggs\n\n8 oz Mushrooms\n\n2 Tbsp Sambal Oelek\n\n4 cloves Garlic\n\n2 tsp Black & White Sesame Seeds\n\n1 lb Udon Noodles\n\n8 oz Shredded Cabbage & Carrots\n\n2 Tbsp Smooth Peanut Butter Spread\n\n8 oz Snow Peas\n\n4 Tbsp Soy Glaze Olive Oil\n\nSalt\n\nPepper', 'https://media.blueapron.com/culinary/recipe/46247/square_image/2e2df0bd45389d4638d901c34b52c7fe.jpg?format=pjpg&quality=80&width=1300', '2025-04-19', 'Prepare the ingredients & make the sauce\n\nRemove the udon noodles from the refrigerator to bring to room temperature.\n\nWash and dry the mushrooms, snow peas, and shredded cabbage & carrots.\n\nThinly slice the mushrooms; peel and roughly chop 2 cloves of garlic.\n\nIn a bowl, whisk together the peanut butter spread, soy glaze, ½ cup water, and sambal oelek to taste.\n\nIf desired, remove the tough strings from the snow peas. \nmedia.blueapron.com\n\nStart the stir-fry\n\nHeat a drizzle of olive oil in a large nonstick pan over medium-high until hot.\n\nAdd the sliced mushrooms, cabbage & carrots, snow peas, and chopped garlic; season with salt and pepper.\n\nCook, stirring occasionally, 2 to 3 minutes, until the vegetables are slightly softened. \nmedia.blueapron.com\n\nFinish the stir-fry\n\nUsing your hands, gently separate the udon noodles, then add them and the sauce to the pan.\n\nSeason with salt and pepper and cook, stirring constantly, 2 to 3 minutes, until the sauce is well combined and the noodles are heated through.\n\nTransfer to a large bowl and cover with foil to keep warm.\n\nRinse and wipe out the pan. \nmedia.blueapron.com\n\nFry the eggs & serve\n\nIn the same pan, heat another drizzle of olive oil over medium-high until hot.\n\nCrack in the eggs (keeping them separated), season with salt and pepper, and cook 4 to 5 minutes, until the whites are set and yolks reach your desired doneness.\n\nTurn off the heat. Serve the stir-fry topped with the fried eggs and garnish with the black & white sesame seeds. Enjoy!', '2025-05-10', 1, 1, 'It contains *Peanuts*!!', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (5, 'Lemony Shrimp Scampi with Orzo and Arugula', 'For the vinaigrette:\n\n⅓ cup extra-virgin olive oil\n\nZest of 2 large lemons\n\n½ cup fresh lemon juice (about 2 large lemons)\n\n½ teaspoon kosher salt\n\n½ teaspoon freshly ground black pepper\n\nFor the shrimp & arugula:\n\n2 tablespoons extra-virgin olive oil\n\n1 large shallot, chopped\n\n1 pound large shrimp, peeled and deveined\n\n1 teaspoon kosher salt\n\n½ cup dry white wine (e.g., pinot grigio)\n\n5 cups (about 6 oz) baby arugula', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/6/25/0/GH0523H_lemony-shrimp-scampi-with-orzo-and-arugula-recipe_s4x3.jpg.rend.hgtvcom.1280.720.suffix/1529939290774.webp', '2025-03-20', 'Cook the orzo. Bring a large pot of salted water to a boil over high heat. Add the orzo and cook until tender but still firm to the bite, stirring occasionally, 6 to 8 minutes. Drain and reserve about 1 cup of the pasta water.\n\nMake the vinaigrette. In a small bowl, whisk together the olive oil, lemon zest, lemon juice, salt, and pepper until smooth. Set aside.\n\nSauté shallots & shrimp. In a large skillet, heat the oil over medium-high. Add the chopped shallot and cook until soft, 2 to 3 minutes. Add the shrimp, season with salt and pepper, and cook until the shrimp turn pink and are cooked through, about 2 to 3 minutes. Remove the shrimp from the skillet.\n\nWilt the arugula. Increase the heat to high. Add the white wine and arugula to the skillet. Using a wooden spoon, scrape up any browned bits from the bottom of the pan. Cook for 1 minute, until most of the liquid has evaporated and the arugula is wilted.\n\nCombine & finish. Return the cooked orzo and shrimp to the skillet. Pour in the vinaigrette and toss until everything is evenly coated, adding reserved pasta water as needed to loosen.\n\nServe. Transfer to a large bowl and serve immediately.', '2025-05-11', 1, 1, 'You can replace the white wine with chicken or vegetable broth for a non-alcoholic version', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (6, 'Chili-Rubbed Pork Chops', '2 large onions\n\n1/3 cup New Mexico chili powder\n\nKosher salt\n\n1/2 teaspoon dried oregano\n\n1/2 teaspoon ground cumin\n\n1/4 teaspoon ground cloves\n\n2 cloves garlic, smashed\n\n8 thin-cut boneless pork chops (about 2 pounds total), trimmed\n\nVegetable oil, for brushing\n\nSpanish rice, for serving (optional)', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2010/1/21/1/FNM_030110-Weeknight-024_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371591016320.webp', '2025-01-27', 'Roughly chop ½ onion and place in a blender with the chili powder, 1½ teaspoons salt, oregano, cumin, cloves, and smashed garlic. Puree, adding about ⅓ cup water to form a thick paste.\n\nSlice the remaining 1½ onions into thin rings; in a bowl, toss the rings and pork chops with the chili paste to coat.\n\nLightly brush a large cast-iron skillet or grill pan with vegetable oil and heat over high until almost smoking. Arrange 4 pork chops in the pan, surround with half the onions, and cook until the chops start to blacken and are cooked through, about 4 minutes per side. Repeat with the remaining chops and onions. Serve (with rice, if desired).', '2025-05-11', 1, 1, 'For deeper flavor, coat the chops in the chili paste up to 2 hours ahead and refrigerate, covered.', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (7, 'Healthy Bulgogi Quesadilla Recipe', '1lb lean flank steak, raw\nSauce:\n6 tablespoons low sodium soy sauce\n1 1/2 tablespoon sesame seeds\n1 tablespoon minced garlic\n1g Stevia in the raw (or 2 tablespoons coconut sugar or 1 tablespoon honey)\nblack pepper to taste\n1 1/2 tablespoon sesame oil\nQuesadillas:\n6 low-carb whole wheat tortillas\n12 tablespoons shredded cabbage (2 tablespoons per quesadilla)\n6 tablespoons carrot sticks (1 tablespoon per quesadilla)\n6 tablespoons diced bell pepper (1 tablespoon per quesadilla)\n1 1/2 cup reduced fat Monterey Jack (1/4 cup per quesadilla)\n6 tablespoons black beans, drained (1 tablespoon per quesadilla)', 'https://fitmencook.com/wp-content/uploads/2023/03/DSC04540-311.jpg.webp', '2024-12-10', 'Slice the steak. Cut 1 lb flank steak into very thin pieces, about the thickness of two coins.\n\nMake and apply the marinade. In a large bowl, whisk together the low-sodium soy sauce, sesame oil, sesame seeds, minced garlic, Stevia, and black pepper. Add the sliced steak and toss to coat. Cover and refrigerate for at least 1 hour (or overnight) to marinate.\n\nCook the steak. Spray a nonstick skillet with cooking spray and heat on high. Add the marinated steak and sear, stirring occasionally, until it reaches your desired doneness (about 6–8 minutes).\n\nPrep the steak. Transfer the cooked steak to a plate, let it rest briefly until cool enough to handle, then chop into bite-sized pieces.\n\nAssemble the quesadillas. Lay a tortilla flat and sprinkle half of the cheese over one side. Top with a portion of chopped steak, shredded cabbage, carrot sticks, diced bell pepper, black beans, and the remaining cheese. Fold the tortilla in half to form a semicircle.\n\nCook the quesadillas. Heat the same nonstick skillet over medium heat (sprayed again if needed). Add the folded quesadilla and cook until the cheese melts and the tortilla is golden brown and crispy, about 3 minutes per side. Serve immediately.', '2025-05-13', 1, 1, 'Mexican/ Korean fusion style food!', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (8, 'Easy Bulgogi (Korean BBQ Beef)', '⅓ cup soy sauce\n\n2 green onions, chopped, dark green parts separated from white and light green parts\n\n¼ yellow onion, thinly sliced\n\n3 tablespoons white sugar\n\n3 cloves garlic, minced\n\n2 tablespoons toasted sesame seeds\n\n1 tablespoon sesame oil\n\n¼ teaspoon Korean red pepper flakes\n\n¼ teaspoon minced fresh ginger\n\n⅛ teaspoon ground black pepper\n\n1 ½ pounds beef sirloin steak, cut very thin using kitchen shears\n\n1 teaspoon honey, or to taste', 'https://www.allrecipes.com/thmb/fNOf3Ibz9w_Eip7ArOyR1bMMIoY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/246172-Easy-Bulgogi-ddmfs-104-4x3-1-c0ddcab340474175a5d1c96bc2edabbc.jpg', '2025-01-20', 'Gather all ingredients.\n\nIn a large glass or ceramic bowl, whisk together soy sauce, the white and light-green parts of the green onions, yellow onion, sugar, garlic, sesame seeds, sesame oil, red pepper flakes, ginger, and black pepper.\n\nAdd the very thinly sliced steak to the bowl and toss to coat evenly. Cover with plastic wrap and refrigerate to marinate for 1 hour (or up to 1 day).\n\nHeat a wok or large skillet over medium heat. Working in batches, add the steak and marinade to the hot pan. Cook, stirring, until the beef is cooked through and caramelized—about 5 minutes—stirring in honey as it cooks.\n\nTransfer to a serving platter and garnish with the dark-green parts of the chopped green onions. Serve immediately.', '2025-05-14', 1, 1, 'Finish the cooked bulgogi with a quick pass over a charcoal grill or a torch for a subtle smoky note', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (9, 'Coconut Chicken Rice Bowl', '1½ lbs diced chicken breast\n\n1 tsp kosher salt\n\n1 tsp smoked paprika\n\n1 tsp dried oregano (or dried herb blend)\n\nSauce ingredients\n\n½ onion, minced\n\n3 cloves garlic\n\n1 tsp fresh grated ginger (or up to 1 Tbsp, to taste)\n\n¼ cup chicken broth\n\n1¼ cups light coconut milk\n\n1 Tbsp tomato paste\n\n½ tsp kosher salt\n\nFor serving\n\nFresh cilantro\n\n3 cups cooked jasmine or basmati rice\n\nAdditional coconut milk (optional, for drizzling)', 'https://www.skinnytaste.com/wp-content/uploads/2024/05/Coconut-Chicken-Rice-Bowls-12.jpg', '2025-02-14', 'Season the diced chicken breast with kosher salt, smoked paprika, and dried oregano.\n\nPreheat a large skillet over high heat, spray with oil, and add the chicken in an even layer. Cook until browned, about 3–5 minutes.\n\nRemove the chicken from the skillet. Reduce the heat to medium, spray with a bit more oil, then add the minced onion, garlic, and grated ginger. Sauté for 1 minute.\n\nPour in the chicken broth to deglaze the pan, scraping up any browned bits. Simmer for about 1 minute.\n\nStir in the tomato paste, light coconut milk, and ½ teaspoon kosher salt. Bring the sauce to a simmer and let it thicken for a few minutes.\n\nReturn the chicken (with any accumulated juices) to the pan and cook on medium heat for 3–4 minutes more, until heated through and coated in sauce.\n\nServe the coconut chicken over jasmine or basmati rice. Garnish with fresh cilantro and, if desired, drizzle with additional coconut milk.', '2025-05-14', 1, 1, 'Don’t like cilantro? Skip it or swap it with scallions.', 1);
INSERT INTO `recipe` (`id`, `name`, `ingredients`, `image_url`, `date_created`, `directions`, `date_updated`, `enabled`, `user_id`, `notes`, `published`) VALUES (10, 'Food Cart-Style Chicken Salad with White Sauce', '24 oz (about 4 large) boneless, skinless chicken thighs, fat trimmed\n\nJuice of ½ lemon\n\n2 cloves garlic, minced\n\n1¼ tsp ground cumin\n\n1 tsp olive oil\n\n1 tsp kosher salt\n\n1 tsp dried oregano\n\n¾ tsp sweet paprika\n\n½ tsp turmeric\n\nWhite Yogurt Sauce (makes 1¼ cups)\n1 cup whole milk yogurt (e.g. Stonyfield)\n\n2 Tbsp mayonnaise\n\n1 Tbsp apple cider vinegar\n\n1 tsp lemon juice\n\n½ tsp salt\n\n½ tsp sugar\n\n⅛ tsp black pepper\n\nFor the salad\n6 cups chopped iceberg or romaine lettuce\n\n2 medium tomatoes, quartered\n\n½ small red onion, thinly sliced\n\nPrepared mild harissa (optional, for drizzling)', 'https://www.skinnytaste.com/wp-content/uploads/2019/01/Street-Cart-Style-Chicken-Salad-with-White-Sauce-8.jpg', '2025-03-15', 'Season the chicken with lemon juice, minced garlic, cumin, olive oil, salt, oregano, paprika, and turmeric. Let rest for at least 15 minutes (or up to overnight).\n\nWhisk together yogurt, mayonnaise, apple cider vinegar, lemon juice, salt, sugar, and pepper; chill.\n\nHeat a large nonstick skillet or griddle over medium-high. Add the chicken and cook undisturbed until the bottom is well browned, about 5 minutes.\n\nFlip the chicken and cook the second side until browned, about 4–5 minutes.\n\nReduce heat to low and continue cooking until nearly cooked through, about 10 more minutes.\n\nTransfer chicken to a cutting board, slice into thin strips, then return to the pan and cook over medium heat until fully done and crisped, about 8–10 minutes more.\n\nDivide lettuce, tomato wedges, and red onion among plates or a large serving bowl.\n\nTop with the warm chicken strips and drizzle with the chilled yogurt sauce (and harissa, if using). Serve immediately.', '2025-05-09', 1, 1, 'Use full-fat or Greek yogurt for a thicker sauce; thin with a splash of water or lemon juice if needed.', 1);

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

