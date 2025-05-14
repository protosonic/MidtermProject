package com.skilldistillery.mealplan.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.mealplan.data.MealPlanDAO;
import com.skilldistillery.mealplan.entities.MealPlan;
import com.skilldistillery.mealplan.entities.User;
import com.skilldistillery.mealplan.services.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MealPlanController {

	@Autowired
	private MealPlanDAO mealPlanDAO;
	@Autowired
	private SessionService sessionService;

	@GetMapping("createMealPlan.do")
	public String goToCreateMealPlan(HttpSession session, Model model, MealPlan newMealPlan) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if(user != null) {
		viewName = "createNewMealPlan";
		} else {
		viewName = "userProfile";
		}
		return viewName;
	}
	
	@PostMapping("createMealPlan.do")
	public String creatingNewMealPlan(HttpSession session, Model model, MealPlan newMealPlan) {
		User user = (User) session.getAttribute("loggedInUser");
		String viewName = "";
		if(user != null) {
		mealPlanDAO.createNewMealPlan(newMealPlan);
//		int mealPlanId = newMealPlan.getId();
		viewName = "viewMealplan";
		} else {
		viewName = "userProfile";
		}
		return viewName;
	}


}
