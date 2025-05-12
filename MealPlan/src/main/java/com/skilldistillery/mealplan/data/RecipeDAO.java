package com.skilldistillery.mealplan.data;

import java.util.List;

import com.skilldistillery.mealplan.entities.Recipe;

public interface RecipeDAO {
	
	List<Recipe> getRecipesList();
	Recipe getRecipeDetails(int recipeId);

}
