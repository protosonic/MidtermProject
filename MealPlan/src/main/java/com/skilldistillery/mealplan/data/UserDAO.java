package com.skilldistillery.mealplan.data;

import java.util.List;

import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;

public interface UserDAO {
	User authenticateUser(String username, String password);
	
	User createAccountForUser(User user);
	
	
	
	

}
