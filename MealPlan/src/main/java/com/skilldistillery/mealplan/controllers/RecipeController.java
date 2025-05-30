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

	@GetMapping("viewrecipe.do")
	public String showRecipe(Model model, HttpSession session, @RequestParam("recipeId") int recipeId) {
		Recipe recipeDetails = recipeDAO.getRecipeDetails(recipeId);
		model.addAttribute("recipe", recipeDetails);
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			sessionService.refreshLoggedInUser(session);
		}
		return "viewrecipe";
	}

	@GetMapping("deleteRecipe.do")
	public String confirmRecipeDelete(HttpSession session, @RequestParam("recipeId") int recipeId, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			Recipe recipeDetails = recipeDAO.getRecipeDetails(recipeId);
			model.addAttribute("recipe", recipeDetails);
			viewName = "deleteRecipe";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@PostMapping("deleteRecipe.do")
	public String deleteRecipe(HttpSession session, @RequestParam("recipeId") int recipeId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			recipeDAO.deleteRecipe(recipeId, user);
			viewName = "redirect:userProfile.do";
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
			viewName = "viewrecipe";
		}
		return viewName;
	}

	@PostMapping("updateRecipe.do")
	public String updateRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Recipe recipe,
			@RequestParam(name = "isPublished", defaultValue = "false") boolean isPublished) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			if (isPublished) {
				recipe.setPublished(true);
			} else {
				recipe.setPublished(false);
			}
			Recipe recipeUpdated = recipeDAO.updateRecipe(recipeId, user, recipe);
			viewName = "redirect:viewrecipe.do?recipeId=" + recipeId;

		} else {
			viewName = "redirect:viewrecipes";
		}
		return viewName;
	}

	@GetMapping("saveRecipe.do")
	public String goToSaveRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			Recipe recipeToClone = recipeDAO.getRecipeDetails(recipeId);
			model.addAttribute("cloningRecipe", recipeToClone);
			viewName = "updateRecipe";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@PostMapping("saveRecipe.do")
	public String saveRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Model model, Recipe recipe) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			Recipe recipeSaved = recipeDAO.createNewRecipe(recipe, user.getId());
			sessionService.refreshLoggedInUser(session);
			viewName = "userProfile";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@PostMapping("viewRecipesByKeyword.do")
	public String viewRecipesByKeyword(HttpSession session, Model model,
			@RequestParam("recipeKeyword") String nameKeyword,
			@RequestParam("recipeKeyword") String ingredientKeyword) {
		List<Recipe> foundRecipes = recipeDAO.findRecipeByKeyword(nameKeyword, ingredientKeyword);
		model.addAttribute("listOfRecipes", foundRecipes);
		sessionService.refreshLoggedInUser(session);
		return "viewall";
	}

	@GetMapping("createNewRecipe.do")
	public String retrieveNewRecipeForm(HttpSession session, Model model, Recipe recipe) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
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
		if (user != null) {
			recipeDAO.createNewRecipe(recipe, user.getId());
			int recipeId = recipe.getId();
			viewName = "redirect:viewrecipe.do?recipeId=" + recipeId;
		} else {
			viewName = "userProfile";
		}
		return viewName;
	}

	@RequestMapping("enableRecipe.do")
	public String enableRecipe(HttpSession session, @RequestParam("recipeId") int recipeId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			recipeDAO.enableRecipe(recipeId, user);
			sessionService.refreshLoggedInUser(session);
			viewName = "redirect:userProfile.do";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@RequestMapping("publishedRecipe.do")
	public String publishedRecipe(HttpSession session, @RequestParam("recipeId") int recipeId, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			boolean published = recipeDAO.publishedRecipe(recipeId, user);
			model.addAttribute("published", published);
			sessionService.refreshLoggedInUser(session);
			viewName = "redirect:userProfile.do";
		} else {
			viewName = "home";
		}
		return viewName;
	}

}
