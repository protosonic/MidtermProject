package com.skilldistillery.mealplan.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealplan.data.UserDAO;
import com.skilldistillery.mealplan.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class CreateAccountController {

	@Autowired
	private UserDAO userDAO;

	@PostMapping("createAccount.do")
	public String createAccount(Model model, HttpSession session, User user) {
		userDAO.createAccountForUser(user);
		
		model.addAttribute("TESTUSER", userDAO.authenticateUser(user.getUsername(), user.getPassword()));
		
		if (userDAO.createAccountForUser(user) != null) {
			session.setAttribute("loggedInUser", user);
			return "userhomepage";
		}

		return "home";

	}

}
