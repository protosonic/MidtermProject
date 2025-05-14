package com.skilldistillery.mealplan.data;

import com.skilldistillery.mealplan.entities.MealPlan;

public interface MealPlanDAO {
	
	MealPlan addToMealPlan(int recipeId, int userId, int mealPlanId);
	MealPlan createNewMealPlan(MealPlan newMealPlan, int userId);
	MealPlan findMealPlanById(int userId, int mealPlanId);
}
