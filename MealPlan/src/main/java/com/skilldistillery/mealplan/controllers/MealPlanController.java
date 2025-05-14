package com.skilldistillery.mealplan.controllers;

import java.util.List;

import org.apache.logging.log4j.message.AsynchronouslyFormattable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealplan.data.MealPlanDAO;
import com.skilldistillery.mealplan.data.RecipeDAO;
import com.skilldistillery.mealplan.entities.MealPlan;
import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;
import com.skilldistillery.mealplan.services.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MealPlanController {

	@Autowired
	private MealPlanDAO mealPlanDAO;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private RecipeDAO recipeDAO;

	@GetMapping("createMealPlan.do")
	public String goToCreateMealPlan(HttpSession session, Model model, MealPlan newMealPlan) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			viewName = "createNewMealPlan";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@PostMapping("createMealPlan.do")
	public String creatingNewMealPlan(HttpSession session, Model model, MealPlan newMealPlan) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			mealPlanDAO.createNewMealPlan(newMealPlan, user.getId());
			model.addAttribute("mealPlan", newMealPlan);
//			List<Recipe> foundRecipes = recipeDAO.getMealPlanRecipesList();
//			model.addAttribute("listOfRecipes", foundRecipes);
//			viewName = "redirect:viewMealPlan.do?mealPlanId=" + newMealPlan.getId(); 
			viewName = "viewMealPlan"; 
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@GetMapping("viewMealPlan.do")
	public String showMealPlans(HttpSession session, Model model, @RequestParam("mealPlanId") int mealPlanId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			model.addAttribute("mealPlan", mealPlanDAO.findMealPlanById(user.getId(), mealPlanId));
			viewName = "viewMealPlan";
		} else {
			viewName = "home";
		}
		return viewName;
	}
}
