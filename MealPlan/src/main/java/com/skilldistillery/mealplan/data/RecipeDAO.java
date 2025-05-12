package com.skilldistillery.mealplan.data;

import java.util.List;

import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;

public interface RecipeDAO {
	
	List<Recipe> getRecipesList();
	Recipe getRecipeDetails(int recipeId);
	boolean deleteRecipe(int recipeId, User user);

}
