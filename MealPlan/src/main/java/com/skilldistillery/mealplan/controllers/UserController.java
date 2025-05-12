package com.skilldistillery.mealplan.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.mealplan.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDAO.authenticateUser("admin", "test"));
		return "home";
	}


	
}
