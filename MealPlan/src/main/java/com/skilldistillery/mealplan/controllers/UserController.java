package com.skilldistillery.mealplan.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealplan.data.UserDAO;
import com.skilldistillery.mealplan.entities.Recipe;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDAO.authenticateUser("admin", "test"));
		return "home";
	}

	@GetMapping("getRecipes.do")
	public String getRecipesList(Model model) {
		List<Recipe> recipeList = userDAO.getRecipesList();
		model.addAttribute("list", recipeList);
		
		return "viewall";
	}
	
	@GetMapping("viewRecipe.do")
	public String showRecipe(Model model) {
		
		return "viewRecipe"; 
	}
}
