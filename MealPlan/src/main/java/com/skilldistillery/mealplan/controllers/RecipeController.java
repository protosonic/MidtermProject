package com.skilldistillery.mealplan.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealplan.data.RecipeDAO;
import com.skilldistillery.mealplan.entities.Recipe;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@GetMapping("getRecipes.do")
	public String getRecipesList(Model model) {
		List<Recipe> recipeList = recipeDAO.getRecipesList();
		model.addAttribute("list", recipeList);
		
		return "viewall";
	}
	
	@GetMapping("viewrecipe.do")
	public String showRecipe(Model model, @RequestParam("recipeId") int recipeId) {
		Recipe recipeDetails = recipeDAO.getRecipeDetails(recipeId);
		model.addAttribute("recipe", recipeDetails);
		return "viewrecipe"; 
	}
	

}
