package com.skilldistillery.mealplan.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.mealplan.data.UserDAO;
import com.skilldistillery.mealplan.entities.User;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionServiceImpl implements SessionService{
	
	@Autowired
	private UserDAO userDAO;
	
	public void refreshLoggedInUser(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			user = userDAO.authenticateUser(user.getUsername(), user.getPassword());
			session.setAttribute("loggedInUser", user);
		}
	}

}
