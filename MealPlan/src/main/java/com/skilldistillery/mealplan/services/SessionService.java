package com.skilldistillery.mealplan.services;

import jakarta.servlet.http.HttpSession;

public interface SessionService {
	
	void refreshLoggedInUser(HttpSession session);

}
