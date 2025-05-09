package com.skilldistillery.mealplan.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.mealplan.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
}
