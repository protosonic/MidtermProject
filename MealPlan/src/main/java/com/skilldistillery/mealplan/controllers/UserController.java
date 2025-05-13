package com.skilldistillery.mealplan.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.mealplan.data.UserDAO;
import com.skilldistillery.mealplan.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDAO.authenticateUser("admin", "test"));
		return "home";
	}

	@GetMapping("login.do")
	public String getLogin() {
		return "login";
	}

	@PostMapping("login.do")
	public String useLogin(User user, HttpSession session) {
		user = userDAO.authenticateUser(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedInUser", user);
			return "userProfile";
		} else
			return "login";
	}
	
	@GetMapping("logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
}
