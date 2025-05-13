package com.skilldistillery.mealplan.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealplan.data.RecipeDAO;
import com.skilldistillery.mealplan.data.UserDAO;
import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;
import com.skilldistillery.mealplan.services.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private SessionService sessionService;
	
	
//Left over from viewall function
//	@GetMapping("getRecipes.do")
//	public String getRecipesList(Model model) {
//		List<Recipe> recipeList = recipeDAO.getRecipesList();
//		model.addAttribute("list", recipeList);
//
//		return "viewall";
//	}

	@GetMapping("viewrecipe.do")
	public String showRecipe(Model model, @RequestParam("recipeId") int recipeId) {
		Recipe recipeDetails = recipeDAO.getRecipeDetails(recipeId);
		model.addAttribute("recipe", recipeDetails);
		return "viewrecipe";
	}

	@RequestMapping("deleteRecipe.do")
	public String deleteRecipe(HttpSession session, @RequestParam("recipeId") int recipeId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			recipeDAO.deleteRecipe(recipeId, user);
			viewName = "viewall";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@GetMapping("updateRecipe.do")
	public String retrieveUpdateRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Model model) {
		String viewName = "";
		Recipe recipeToUpdate = recipeDAO.getRecipeDetails(recipeId);
		if (recipeToUpdate != null) {
			model.addAttribute("recipe", recipeToUpdate);
			viewName = "updateRecipe";
		} else {
			viewName = "redirect:viewrecipes";
		}
		return viewName;
	}

	@PostMapping("updateRecipe.do")
	public String updateRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Recipe recipe) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			Recipe recipeUpdated = recipeDAO.updateRecipe(recipeId, user, recipe);
			viewName = "redirect:viewrecipe.do?recipeId=" + recipeId;
		} else {
			viewName = "redirect:viewrecipes";
		}
		return viewName;
	}

	@GetMapping("saveRecipe.do")
	public String saveRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			Recipe recipeSaved = recipeDAO.saveRecipe(recipeId, user.getId());
			sessionService.refreshLoggedInUser(session);
			viewName = "userProfile";
		} else {
			viewName = "home";
		}
		return viewName;
	}
	@PostMapping("viewRecipesByKeyword.do")
	public String viewRecipesByKeyword(HttpSession session, Model model, @RequestParam("recipeKeyword") String nameKeyword, @RequestParam("recipeKeyword") String ingredientKeyword) {
		List<Recipe> foundRecipes = recipeDAO.findRecipeByKeyword(nameKeyword, ingredientKeyword);
		model.addAttribute("listOfRecipes", foundRecipes);
		sessionService.refreshLoggedInUser(session);
		return "viewall";
	}
	
	@GetMapping("createNewRecipe.do")
	public String retrieveNewRecipeForm(HttpSession session, Model model, Recipe recipe) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if(user != null) {
		viewName = "createNewRecipe";
		} else {
		viewName = "userProfile";
		}
		return viewName;
	}
	
	@PostMapping("createNewRecipe.do")
	public String createNewRecipe(HttpSession session, Model model, Recipe recipe) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if(user != null) {
		recipeDAO.createNewRecipe(recipe, user.getId());
		int recipeId = recipe.getId();
		viewName = "redirect:viewrecipe.do?recipeId=" + recipeId;
		} else {
		viewName = "userProfile";
		}
		return viewName;
	}
}
