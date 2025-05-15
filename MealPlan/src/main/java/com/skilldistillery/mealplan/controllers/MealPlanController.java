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
			model.addAttribute("mealPlan", mealPlanDAO.getMealPlanDetailsById(user.getId(), mealPlanId));
			viewName = "viewMealPlan";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@GetMapping("deleteMealPlan.do")
	public String confirmMealPlanDelete(HttpSession session, @RequestParam("mealPlanId") int mealPlanId, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			MealPlan mealPlan = mealPlanDAO.getMealPlanDetailsById(user.getId(), mealPlanId);
			model.addAttribute("mealPlan", mealPlan);
			viewName = "deleteMealPlan";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@PostMapping("deleteMealPlan.do")
	public String deleteMealPlan(HttpSession session, @RequestParam("mealPlanId") int mealPlanId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			mealPlanDAO.deleteMealPlan(mealPlanId, user);
			viewName = "redirect:userProfile.do";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@RequestMapping("enableMealPlan.do")
	public String enableRecipe(HttpSession session, @RequestParam("mealPlanId") int mealPlanId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			mealPlanDAO.enableMealPlan(mealPlanId, user);
			sessionService.refreshLoggedInUser(session);
			viewName = "redirect:userProfile.do";
		} else {
			viewName = "home";
		}
		return viewName;
	}

	@GetMapping("updateMealPlan.do")
	public String retrieveUpdateMealPlan(HttpSession session, @RequestParam("mealPlanId") int mealPlanId, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		MealPlan mealPlanToUpdate = mealPlanDAO.getMealPlanDetailsById(user.getId(), mealPlanId);
		if (mealPlanToUpdate != null) {
			model.addAttribute("mealPlan", mealPlanToUpdate);
			viewName = "updateMealPlan";
		} else {
			viewName = "userProfile";
		}
		return viewName;
	}

	@PostMapping("updateMealPlan.do")
	public String updateMealPlan(HttpSession session, @RequestParam("mealPlanId") int mealPlanId, MealPlan mealPlan) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			MealPlan mealPlanUpdated = mealPlanDAO.updateMealPlan(mealPlanId, user, mealPlan);
			viewName = "redirect:viewMealPlan.do?mealPlanId=" + mealPlanId;

		} else {
			viewName = "redirect:userProfile";
		}
		return viewName;
	}

	@PostMapping("addRecipeToMealPlan.do")
	public String addRecipeToMealPlan(Model model, @RequestParam("recipeId") int recipeId, HttpSession session,
			@RequestParam("mealPlanId") int mealPlanId) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			mealPlanDAO.addToMealPlan(recipeId, user.getId(), mealPlanId);
			viewName = "redirect:viewMealPlan.do?mealPlanId=" + mealPlanId;
		}else {
			viewName = "redirect:viewrecipe.do?recipeId=" + recipeId;
		}
		return viewName;
	}
	
	@GetMapping("deleteRecipeFromMealPlan.do")
	public String confirmRecipeDeleteFromMealPlan(HttpSession session, @RequestParam("mealPlanId") int mealPlanId, @RequestParam("recipeId") int recipeId,
			Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			MealPlan mealPlan = mealPlanDAO.getMealPlanDetailsById(user.getId(), mealPlanId);
			Recipe recipe = recipeDAO.getRecipeDetails(recipeId);
			model.addAttribute("recipe", recipe);
			model.addAttribute("mealPlan", mealPlan);
			viewName = "deleteRecipeFromMealPlan";
		} else {
			viewName = "home";
		}
		return viewName;
	}
	
	@PostMapping("deleteRecipeFromMealPlan.do")
	public String deleteRecipeFromeMealPlan(Model model, @RequestParam("recipeId") int recipeId, HttpSession session,
			@RequestParam("mealPlanId") int mealPlanId){
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if (user != null) {
			mealPlanDAO.deleteFromMealPlan(recipeId, user.getId(), mealPlanId);
//			model.addAttribute("recipe", recipeId);
//			model.addAttribute("mealPlan", mp);
			viewName = "redirect:viewMealPlan.do?mealPlanId=" + mealPlanId;
		}else {
			viewName = "home";
		}
		return viewName;
	}
}
