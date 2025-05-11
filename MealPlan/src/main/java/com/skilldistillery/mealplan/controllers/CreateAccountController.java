package com.skilldistillery.mealplan.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealplan.data.UserDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class CreateAccountController {
	
	@Autowired
	private UserDAO userDAO;
	
	@PostMapping("createAccount.do")
	public String createAccount(@RequestParam("firstName") String firstName, 
			@RequestParam("lastName") String lastName, @RequestParam("userName") 
			String userName, @RequestParam("passWord") String passWord,Model model, 
			HttpSession session,User user) {
			
			//TODO do we need to add to model attribute??
			userDAO.createAccountForUser(userName, passWord, firstName, lastName);
			
		
		return "userhomepage";
		
	}
	
	
	
	
}
