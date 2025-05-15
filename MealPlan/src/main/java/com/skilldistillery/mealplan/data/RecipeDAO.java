package com.skilldistillery.mealplan.data;

import java.util.List;

import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;

public interface RecipeDAO {
	
	List<Recipe> getRecipesList();
	Recipe getRecipeDetails(int recipeId);
	boolean deleteRecipe(int recipeId, User user);
	Recipe updateRecipe(int recipeId, User user, Recipe recipe);
	Recipe saveRecipe(int recipeId, int userId);
	List<Recipe> findRecipeByKeyword(String nameKeyword, String ingredientKeyword);
	Recipe createNewRecipe(Recipe newRecipe, int userId);
	boolean enableRecipe(int recipeId, User user);
	List<Recipe> getMealPlanRecipesList();
	boolean publishedRecipe(int recipeId, User user);
	

}
